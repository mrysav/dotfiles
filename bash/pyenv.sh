# shellcheck shell=bash

# Guard against init'ing twice
if ! [[ $PATH == *"pyenv/shims"* ]]; then

    if [[ -d "$HOME/.pyenv/bin" ]]; then
        export PATH="$HOME/.pyenv/bin:$PATH"
    fi

    if which pyenv >/dev/null; then
        eval "$(pyenv init --path)"
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
    fi
fi


