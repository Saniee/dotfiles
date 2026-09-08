# Change colors so they aren't fucky on the eyes.
export LS_COLORS="${LS_COLORS}ow=1;97;45:"

# Aliases for programs.
alias lg='lazygit'
alias cr='cargo run'
alias py='python3'

# Bare-repo dotfiles management (keeps `git status`/lazygit clean everywhere else).
alias dotfiles='git --git-dir=$HOME/.dotfiles-git/ --work-tree=$HOME'

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

if command -v carapace >/dev/null 2>&1; then
    export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
    source <(carapace _carapace bash)
fi
