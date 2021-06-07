# shellcheck shell=bash

# Main hook for bashrc
# Everything is going to get crammed in here but technically
# I should check for interactive or not at some point for some
# potential speed gains when using bash non-interactively.
# But how often does that happen anyway?

export EDITOR="$(which vim)"

# Alias definitions.
if [ -f ~/dotfiles/aliases.bash ]; then
    source "$HOME/dotfiles/aliases.bash"
fi

## rbenv
# Test to see if it's installed via git checkout first, if so add it to path

if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
fi

if [ "$(which rbenv)" != "" ]; then
    eval "$(rbenv init -)"
fi

# nodenv
# export PATH="$HOME/.nodenv/bin:$PATH"
# eval "$(nodenv init --no-rehash -)"

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

if [[ "$OSTYPE" == "darwin"* ]]; then
    source "$HOME/dotfiles/mac.bash"
fi