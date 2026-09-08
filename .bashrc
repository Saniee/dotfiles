# Change colors so they aren't fucky on the eyes.
export LS_COLORS="${LS_COLORS}ow=1;97;45:"

# Aliases for programs.
alias lg='lazygit'
alias cr='cargo run'
alias py='python3'

# Bare-repo dotfiles management (keeps `git status`/lazygit clean everywhere else).
alias dotfiles='git --git-dir=$HOME/.dotfiles-git/ --work-tree=$HOME'

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

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

if command -v carapace >/dev/null 2>&1; then
    export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
    source <(carapace _carapace bash)
fi
