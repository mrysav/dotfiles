# shellcheck shell=bash

if [[ -z "$(which rbenv)" ]]; then
    if [[ -d "$HOME/.rbenv/bin" ]]; then
        export PATH="$HOME/.rbenv/bin:$PATH"
    fi
    eval "$(rbenv init --no-rehash -)"
fi