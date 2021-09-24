# shellcheck shell=bash

if [[ "$CODESPACES" != "true" ]]; then
    if [[ -d "$HOME/.rbenv/bin" ]]; then
        export PATH="$HOME/.rbenv/bin:$PATH"
    fi
    if which rbenv >/dev/null; then
        eval "$(rbenv init --no-rehash -)"
    fi
fi
