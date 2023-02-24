# shellcheck shell=bash

# Guard against init'ing twice
if ! [[ $PATH == *"nodenv/shims"* ]]; then

    if [[ -d "$HOME/.nodenv/bin" ]]; then
        export PATH="$HOME/.nodenv/bin:$PATH"
    fi

    if which nodenv >/dev/null; then
        eval "$(nodenv init --no-rehash -)"
    fi
fi


