# shellcheck shell=bash

alias ll='ls -halF'
alias tmux="tmux -2"
alias tm="tmux attach || tmux"
alias om="overmind"
alias be="bundle exec"

alias dotfiles="cd \$DOTFILE_DIR"

source "$DOTFILE_DIR/bash/df_install.sh"

if [[ "$CODESPACES" == "true" ]] && [[ -d "/workspaces" ]]; then
    wsdir="/workspaces"
else
    wsdir="$HOME/github"
fi
alias ws="cd $wsdir"