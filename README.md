# Requirements:
- carapace: https://github.com/carapace-sh/carapace-bin
- starship (prompt theming, Ayu Dark): https://starship.rs

# To use:
See [INSTALLATION.md](INSTALLATION.md) for Linux and Windows (Git Bash) setup steps.

This repo is managed as a bare git repo checked out against `$HOME`, accessed through a `dotfiles` alias instead of a `.git` folder living in `$HOME`. Plain `git`/lazygit run anywhere else won't auto-discover it, so there's no dangling status or stray lazygit prompts outside this repo.

# Adding to the dotfiles
- `dotfiles add <path-to-file>`
- `dotfiles commit -m "Added <x> file."`
- `dotfiles push` (If being run for the first time, define the upstream.)

To browse the dotfiles repo specifically in lazygit: `lazygit --git-dir=$HOME/.dotfiles-git --work-tree=$HOME`
