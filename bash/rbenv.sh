# shellcheck shell=bash

if [[ -d "$HOME/.rbenv/bin" ]]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
fi
if [[ -z "$(which rbenv)" ]]; then
    eval "$(rbenv init --no-rehash -)"
fi