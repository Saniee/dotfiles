#!/usr/bin/env bash
# Installs this dotfiles repo as a bare repo against a home directory.
# Run as a regular user to install just for yourself, or as root to also
# seed /etc/skel (so future new users get it) and apply it to every
# existing user's home under /home.
set -euo pipefail

REPO_URL="https://github.com/Saniee/dotfiles"

install_for_home() {
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

    [ -n "$owner" ] && chown -R "$owner" "$git_dir"
}

if [ "$(id -u)" -eq 0 ]; then
    install_for_home /etc/skel ""
    install_for_home /root ""
    for home in /home/*/; do
        [ -d "$home" ] || continue
        home="${home%/}"
        user="$(basename "$home")"
        install_for_home "$home" "$user:$user"
    done
else
    install_for_home "$HOME" ""
fi

echo "Done. Run 'source ~/.bashrc' (or open a new shell) to pick up changes."
