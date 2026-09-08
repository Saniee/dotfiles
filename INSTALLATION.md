# Installation

## Requirements
- Git — on Windows, install [Git for Windows](https://git-scm.com/download/win), which ships Git Bash
- Optional: [carapace](https://github.com/carapace-sh/carapace-bin) — completions, both platforms
- Optional: [starship](https://starship.rs) — prompt theming (Ayu Dark colors, config at `.config/starship.toml`), both platforms
- Optional: [rustup](https://rustup.rs) — only if you want `$HOME/.cargo/env` sourced

This repo is managed as a bare git repo checked out against `$HOME` and accessed through a `dotfiles` alias, so plain `git`/lazygit run elsewhere won't pick it up. Same steps on both platforms — just run them from Git Bash on Windows.

## Linux / Windows (Git Bash)

1. Clone as a bare repo:
   ```
   git clone --bare https://github.com/Saniee/dotfiles "$HOME/.dotfiles-git"
   ```
2. Define the alias for this session (it's already in `.bashrc` for future sessions once checked out):
   ```
   alias dotfiles='git --git-dir="$HOME/.dotfiles-git/" --work-tree="$HOME"'
   ```
3. Hide untracked files in status:
   ```
   dotfiles config --local status.showUntrackedFiles no
   ```
4. Checkout the files:
   ```
   dotfiles checkout
   ```
   If it fails because existing files (e.g. a default `.bashrc`) would be overwritten, back them up first:
   ```
   mkdir -p ~/.dotfiles-backup
   dotfiles checkout 2>&1 | grep -E "^\s+\." | awk '{print $1}' | xargs -I{} mv {} ~/.dotfiles-backup/{}
   dotfiles checkout
   ```
5. Reload the shell so the `dotfiles` alias and everything else in `.bashrc` takes effect:
   ```
   source ~/.bashrc
   ```

Note: `.md` files (this one included) are tracked in the repo but marked `skip-worktree` and removed from `$HOME` right after checkout — they're worth keeping in git, not worth cluttering your home directory with. `git log`/GitHub still show them normally.

## Using install.sh

`install.sh` wraps the steps above and adds a couple of things the manual flow can't do: multi-user installs, a reset, and an uninstall.

```
curl -fsSL https://raw.githubusercontent.com/Saniee/dotfiles/master/install.sh | bash
```

Run as a regular user, this installs for just your account (same result as the manual steps, `.md` exclusion included). Run as root (`| sudo bash`), it also seeds `/etc/skel` (so newly-created users inherit the dotfiles) and applies the install to `/root` plus every existing home under `/home`, fixing ownership as it goes.

Pass an action as an extra argument (`bash -s -- <action>` when piping from curl):
- `install` (default) — clone if missing, check out, back up anything conflicting
- `reset` — discard local edits to tracked files, restoring the last checked-out state; leaves the git-dir alone
- `uninstall` — remove the bare git-dir and the `dotfiles` alias from `.bashrc`; tracked files stay on disk as plain files. Add `--purge` to also delete them (the script itself is kept)

```
curl -fsSL https://raw.githubusercontent.com/Saniee/dotfiles/master/install.sh | sudo bash -s -- uninstall --purge
```

## Notes for Windows

- The `.bashrc` here sources `$HOME/.cargo/env` and sets up `carapace`/`starship`/`dircolors` only if they're actually installed, so skipping any of them on Windows is fine — no errors on shell startup.
- Git Bash starts a login shell, which reads `.bash_profile` instead of `.bashrc` — this repo's `.bash_profile` just sources `.bashrc`, so it still works the same way as on Linux.
- The Helix config under `.config/` is unused these days, but if you do use Helix, install it separately — it isn't managed by this repo's install steps on either platform.
