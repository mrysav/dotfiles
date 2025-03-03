# shellcheck shell=bash

if ! [[ $PATH == *"rbenv/shims"* ]]; then

    if [[ -d "$HOME/.rbenv/bin" ]]; then
        export PATH="$HOME/.rbenv/bin:$PATH"
    fi

    if which rbenv >/dev/null 2>/dev/null; then
        eval "$(rbenv init - bash)"
    fi

fi
