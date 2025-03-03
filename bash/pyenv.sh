# shellcheck shell=bash

if [[ -d "$HOME/.pyenv/bin" ]]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
fi

if which pyenv >/dev/null 2>/dev/null; then
    PYENV_BINDIR="$(dirname "$(which pyenv)")"
    PYENV_ROOT="$(dirname "$PYENV_BINDIR")"
    export PYENV_ROOT

    if ! [[ $PATH == *"pyenv/shims"* ]]; then
        export PATH="$PYENV_ROOT/bin:$PATH"
    fi

    eval "$(pyenv init - bash)"
    # eval "$(pyenv virtualenv-init -)"
fi


