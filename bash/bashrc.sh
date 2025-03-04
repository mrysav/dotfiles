# shellcheck shell=bash

# Main hook for bashrc
# Everything is going to get crammed in here but technically
# I should check for interactive or not at some point for some
# potential speed gains when using bash non-interactively.
# But how often does that happen anyway?

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export EDITOR="$(which vim)"

if [[ -d "$HOME/bin" ]]; then
    export PATH="$PATH:$HOME/bin"
fi
export PATH="$PATH:$DOTFILE_DIR/bin"

# If there are secrets (access tokens, etc)
# they can be put in a file like this that is not committed
if [ -f "$HOME/.secrets.env" ]; then
  source "$HOME/.secrets.env"
fi

# kind of a hack to make sure I get what I want here...
# sometimes the /etc/profile is not sources but I want the completions
if [[ "$CODESPACES" == "true" ]]; then
  if [[ -f /etc/profile.d/bash_completion.sh ]]; then
    source /etc/profile.d/bash_completion.sh
  fi
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  source "$DOTFILE_DIR/bash/mac.sh"
fi

# Alias definitions
source "$DOTFILE_DIR/bash/aliases.sh"

source "$DOTFILE_DIR/bash/rbenv.sh"
source "$DOTFILE_DIR/bash/nodenv.sh"
source "$DOTFILE_DIR/bash/pyenv.sh"

if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

# devkitPro
if [ -f "/etc/profile.d/devkit-env.sh" ]; then
  source /etc/profile.d/devkit-env.sh
fi

# VTE / Tilix Support
if [ "$TILIX_ID" ] || [ "$VTE_VERSION" ]; then
  if [[ -f /etc/profile.d/vte/sh ]]; then
    source /etc/profile.d/vte.sh
  fi
fi

aws_completer="$(which aws_completer 2>/dev/null)"
if [ "$aws_completer" != "" ]; then
  complete -C "$aws_completer" aws
fi

source "$DOTFILE_DIR/bash/ps1.sh"
