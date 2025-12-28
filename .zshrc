export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="fwalch"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

DISABLE_AUTO_TITLE="true"

plugins=(git)

# Source the omz for functionality.
source $ZSH/oh-my-zsh.sh

# Change colors so they aren't fucky on the eyes.
export LS_COLORS="${LS_COLORS}ow=1;97;45:"

# Aliases for programs.
alias lg='lazygit'
alias cr='cargo run'
alias py='python3'

# CD Aliases for QOL.
# Alacritty Config
alias termc='cd /mnt/c/Users/asams/AppData/Roaming/alacritty'
# Drives
alias cdd='cd /mnt/d'
alias cdc='cd /mnt/c/Users/asams'
# Project Folders
alias projects='cd /mnt/d/Projects'
alias pprojects='cd /mnt/d/PersonalProjects'
# Other
alias st='rclone sync /mnt/d/Various/Tenebris fs-dav:/saniee/Tenebris -i'

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
. "$HOME/.cargo/env"
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
source <(carapace _carapace)
