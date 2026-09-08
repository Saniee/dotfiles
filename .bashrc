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
source <(carapace _carapace bash)
