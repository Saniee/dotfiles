# Requirements:
- brew: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` 
- carapace: https://github.com/carapace-sh/carapace-bin

# To use:
This repo is managed as a bare git repo checked out against `$HOME`, accessed through a `dotfiles` alias instead of a `.git` folder living in `$HOME`. Plain `git`/lazygit run anywhere else won't auto-discover it, so there's no dangling status or stray lazygit prompts outside this repo.

- Clone as a bare repo: `git clone --bare https://github.com/Saniee/dotfiles $HOME/.dotfiles-git`
- Define the alias for this session (it'll live in `.bashrc` permanently after checkout): `alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles-git/ --work-tree=$HOME'`
- Hide untracked files in status: `dotfiles config --local status.showUntrackedFiles no`
- Checkout the files: `dotfiles checkout`
  - If it fails because existing files (e.g. a default `.bashrc`) would be overwritten, back them up first:
    ```
    mkdir -p ~/.dotfiles-backup
    dotfiles checkout 2>&1 | grep -E "^\s+\." | awk '{print $1}' | xargs -I{} mv {} ~/.dotfiles-backup/{}
    dotfiles checkout
    ```
- `source ~/.bashrc` (or open a new shell) so the `dotfiles` alias is available going forward without redefining it.

# Adding to the dotfiles
- `dotfiles add <path-to-file>`
- `dotfiles commit -m "Added <x> file."`
- `dotfiles push` (If being run for the first time, define the upstream.)

To browse the dotfiles repo specifically in lazygit: `lazygit --git-dir=$HOME/.dotfiles-git --work-tree=$HOME`
