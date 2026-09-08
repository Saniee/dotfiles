# Installation

## Requirements
- Git — on Windows, install [Git for Windows](https://git-scm.com/download/win), which ships Git Bash
- Optional: [carapace](https://github.com/carapace-sh/carapace-bin) — completions, both platforms
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

## Notes for Windows

- The `.bashrc` here assumes a Rust toolchain under `$HOME/.cargo`. If it isn't installed on your Windows box, that line just fails silently on shell startup — comment it out in `.bashrc` if that bothers you.
- The Helix config under `.config/` is unused these days, but if you do use Helix, install it separately — it isn't managed by this repo's install steps on either platform.
