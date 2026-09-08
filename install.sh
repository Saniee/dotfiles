#!/usr/bin/env bash
# Manages this dotfiles repo as a bare repo against one or more home
# directories.
#
# Usage: install.sh [install|reset|uninstall] [--purge]
#
# Run as a regular user to act on just your own home, or as root to
# additionally seed /etc/skel (so future new users get it) and apply the
# action to root plus every existing user's home under /home.
#
#   install    (default) Clone the bare repo if missing and check out the
#              tracked files, backing up anything that would be overwritten.
#   reset      Discard local edits to tracked files, restoring them to the
#              last checked-out state. Leaves the git-dir alone.
#   uninstall  Remove the bare git-dir and the `dotfiles` alias from
#              .bashrc. Add --purge to also delete the tracked files
#              themselves (this script excluded).
set -euo pipefail

REPO_URL="https://github.com/Saniee/dotfiles"
ACTION="${1:-install}"
PURGE="${2:-}"

install_home() {
    local home="$1" owner="$2" git_dir="$1/.dotfiles-git"

    [ -d "$git_dir" ] || git clone --bare "$REPO_URL" "$git_dir"

    local dotfiles=(git "--git-dir=$git_dir" "--work-tree=$home")
    "${dotfiles[@]}" config --local status.showUntrackedFiles no

    if ! "${dotfiles[@]}" checkout 2>/tmp/dotfiles-checkout-err; then
        mkdir -p "$home/.dotfiles-backup"
        grep -E '^\s+\.' /tmp/dotfiles-checkout-err | awk '{print $1}' | while read -r f; do
            mkdir -p "$home/.dotfiles-backup/$(dirname "$f")"
            mv "$home/$f" "$home/.dotfiles-backup/$f"
        done
        "${dotfiles[@]}" checkout
    fi
    rm -f /tmp/dotfiles-checkout-err

    # Docs are worth keeping in the repo but not worth cluttering $HOME with.
    # skip-worktree tells git to leave these alone from here on, so deleting
    # them doesn't show up as a local change and future checkouts won't
    # restore them.
    "${dotfiles[@]}" ls-tree -r --name-only HEAD \
        | { grep '\.md$' || true; } \
        | while read -r f; do
            "${dotfiles[@]}" update-index --skip-worktree "$f"
            rm -f "$home/$f"
        done

    if [ -n "$owner" ]; then
        chown -R "$owner" "$git_dir"
    fi
}

reset_home() {
    local home="$1" git_dir="$1/.dotfiles-git"
    if [ ! -d "$git_dir" ]; then
        echo "No dotfiles install found at $home, skipping."
        return
    fi
    git "--git-dir=$git_dir" "--work-tree=$home" checkout -f
}

uninstall_home() {
    local home="$1" git_dir="$1/.dotfiles-git"
    [ -d "$git_dir" ] || return 0

    if [ "$PURGE" = "--purge" ]; then
        git "--git-dir=$git_dir" "--work-tree=$home" ls-tree -r --name-only HEAD \
            | { grep -vE '^install\.sh$' || true; } \
            | while read -r f; do rm -f "$home/$f"; done
        find "$home" -mindepth 1 -type d -empty -delete 2>/dev/null || true
    fi

    rm -rf "$git_dir"
    sed -i '/^# Bare-repo dotfiles management/,/^alias dotfiles=/d' "$home/.bashrc" 2>/dev/null || true
}

apply() {
    case "$ACTION" in
        install)   install_home "$1" "$2" ;;
        reset)     reset_home "$1" ;;
        uninstall) uninstall_home "$1" ;;
        *) echo "Unknown action: $ACTION (expected install, reset, or uninstall)" >&2; exit 1 ;;
    esac
}

if [ "$(id -u)" -eq 0 ]; then
    apply /etc/skel ""
    apply /root ""
    for home in /home/*/; do
        [ -d "$home" ] || continue
        home="${home%/}"
        user="$(basename "$home")"
        apply "$home" "$user:$user"
    done
else
    apply "$HOME" ""
fi

case "$ACTION" in
    install)   echo "Done. Run 'source ~/.bashrc' (or open a new shell) to pick up changes." ;;
    reset)     echo "Done. Local edits to tracked files were discarded." ;;
    uninstall)
        msg="Done. Removed the dotfiles git-dir and alias."
        [ "$PURGE" = "--purge" ] && msg="$msg Tracked files were also deleted."
        echo "$msg"
        ;;
esac
