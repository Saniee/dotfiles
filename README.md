# Requirements:
- oh-my-zsh: `git clone https://github.com/ohmyzsh/ohmyzsh.git .oh-my-zsh/`
- brew: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` 

# To use:
- Clone the oh-my-zsh repo: `git clone https://github.com/ohmyzsh/ohmyzsh.git .oh-my-zsh/`
- Clone the dotfiles repo -> `git clone --bare <url> $HOME/dotfiles`
- Define alias, run in the shell -> `alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'`
- Usually you will need to remove files that already exist. like `.zshrc`. Do so, or make a backup.
- Checkout the repo -> `config checkout`

# Adding to the dotfiles
- `config add <path-to-file>`
- `config commit -m "Added <x> file."`
- `config push` (If being run for the first time, define the upstream.)
