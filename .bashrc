# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

export LS_COLORS="${LS_COLORS}ow=1;97;45:"

# Aliases for used programs.
alias lg='lazygit'
alias cr='cargo run'
alias py='python3'

# CD Aliases for QOL.
alias cdd='cd /mnt/d'
alias cdc='cd /mnt/c/Users/asams'
alias cdp='cd /mnt/d/Projects'

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias configlg='lazygit --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
source <(carapace _carapace)
