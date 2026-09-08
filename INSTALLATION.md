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

## Root / multi-user install (Linux)

The steps above only check the dotfiles out into whichever `$HOME` you ran them from — installing as root only sets them up for root, not for other accounts on the box. `install.sh` handles the multi-user case: run it as root and it checks the dotfiles out into `/etc/skel` (so newly-created users inherit them) and into `/root` plus every existing user's home under `/home`, fixing ownership as it goes.

```
curl -fsSL https://raw.githubusercontent.com/Saniee/dotfiles/master/install.sh | sudo bash
```

Run it without root (as a regular user, no `sudo`) to just install for yourself — same as the manual steps above.

## Notes for Windows

- The `.bashrc` here sources `$HOME/.cargo/env` and sets up `carapace`/`starship` only if they're actually installed, so skipping any of them on Windows is fine — no errors on shell startup.
- The Helix config under `.config/` is unused these days, but if you do use Helix, install it separately — it isn't managed by this repo's install steps on either platform.
