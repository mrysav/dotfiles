# shellcheck shell=bash

# Main hook for bashrc
# Everything is going to get crammed in here but technically
# I should check for interactive or not at some point for some
# potential speed gains when using bash non-interactively.
# But how often does that happen anyway?

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Teach your kids bash before somebody else does
# http://bashrcgenerator.com/
# https://ss64.com/osx/syntax-prompt.html

reset="$(tput sgr0)"
bold="$(tput bold)"
bold_green="\e[1;32m"
bold_blue="\e[1;34m"
export PS1="\[$bold_green\]@\u\[$reset\]\[$bold\]:\[$reset\]\[$bold_blue\]\w\[$reset\]\[$bold\]\$\[$reset\] "

export EDITOR="$(which vim)"

# If there are secrets (access tokens, etc)
# they can be put in a file like this that is not committed
if [ -f "$HOME/.secrets.env" ]; then
    source "$HOME/.secrets.env"
fi

# Alias definitions
source "$DOTFILE_DIR/bash/aliases.sh"

## rbenv
if [ -d "$HOME/.rbenv" ] && [ "$(which rbenv)" != "" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init --no-rehash -)"
fi

## nodenv
if [ -d "$HOME/.nodenv" ] && [ "$(which nodenv)" != "" ]; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init --no-rehash -)"
fi

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
