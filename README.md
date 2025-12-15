# Requirements:
- oh-my-zsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- brew: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` 

# To use:
- Add into .zshrc -> `alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'`
- Clone the repo -> `git clone --bare <url> $HOME/dotfiles`
- Checkout the repo -> `config checkout`
- If needed, remove the .bashrc files or make a backup.
