export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="fwalch"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export LS_COLORS="${LS_COLORS}ow=1;97;45:"

# Aliases for used programs.
alias lg='lazygit'
alias cr='cargo run'
alias py='python3'
alias ll='ls -l'

# CD Aliases for QOL.
alias cdd='cd /mnt/d'
alias cdc='cd /mnt/c/Users/asams'
alias projects='cd /mnt/d/Projects'
alias pprojects='cd /mnt/d/PersonalProjects'
alias st='rclone sync ./tenebris fs-dav:/saniee/Tenebris -i'

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

. "$HOME/.cargo/env"

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
source <(carapace _carapace)
