# Requirements:
- oh-my-zsh: `git clone https://github.com/ohmyzsh/ohmyzsh.git .oh-my-zsh/`
- brew: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` 

# To use:
- Clone the oh-my-zsh repo: `git clone https://github.com/ohmyzsh/ohmyzsh.git .oh-my-zsh/`
- Remove an existing `.git` directory if exists.
- Clone the dotfiles repo -> `git clone -n --separate-git-dir .git https://github.com/Saniee/dotfiles throwaway`
- You can remove the `throwaway` directory.
- Checkout the repo -> `config checkout`

# Adding to the dotfiles
If using lazygit: `git config --local status.showUntrackedFiles no`

- `git add <path-to-file>`
- `git commit -m "Added <x> file."`
- `git push` (If being run for the first time, define the upstream.)
