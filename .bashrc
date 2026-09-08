# ls colors, themed for Ayu Dark.
if command -v dircolors >/dev/null 2>&1 && [ -f "$HOME/.dircolors" ]; then
    eval "$(dircolors -b "$HOME/.dircolors")"
fi

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

if command -v starship >/dev/null 2>&1; then
    export STARSHIP_CONFIG="$HOME/.config/starship.toml"
    eval "$(starship init bash)"
fi
