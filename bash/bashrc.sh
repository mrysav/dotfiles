# shellcheck shell=bash

# Main hook for bashrc
# Everything is going to get crammed in here but technically
# I should check for interactive or not at some point for some
# potential speed gains when using bash non-interactively.
# But how often does that happen anyway?

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export EDITOR="$(which vim)"

# If there are secrets (access tokens, etc)
# they can be put in a file like this that is not committed
if [ -f "$HOME/.secrets.env" ]; then
  source "$HOME/.secrets.env"
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  source "$DOTFILE_DIR/bash/mac.sh"
fi

# Alias definitions
source "$DOTFILE_DIR/bash/aliases.sh"

source "$DOTFILE_DIR/bash/rbenv.sh"
source "$DOTFILE_DIR/bash/nodenv.sh"

# asdf
if [ -f "$HOME/.asdf/asdf.sh" ]; then
  source "$HOME/.asdf/asdf.sh"
  source "$HOME/.asdf/completions/asdf.bash"
fi

# devkitPro
if [ -f "/etc/profile.d/devkit-env.sh" ]; then
  source /etc/profile.d/devkit-env.sh
fi

# VTE / Tilix Support
if [ "$TILIX_ID" ] || [ "$VTE_VERSION" ]; then
  source /etc/profile.d/vte.sh
fi

aws_completer="$(which aws_completer)"
if [ "$aws_completer" != "" ]; then
  complete -C "$aws_completer" aws
fi

source "$DOTFILE_DIR/bash/ps1.sh"
