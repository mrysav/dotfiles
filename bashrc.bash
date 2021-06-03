# shellcheck shell=bash

export EDITOR="$(which vim)"

# Alias definitions.
if [ -f ~/dotfiles/aliases.bash ]; then
    source "$HOME/dotfiles/aliases.bash"
fi

# rbenv
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init --no-rehash -)"

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