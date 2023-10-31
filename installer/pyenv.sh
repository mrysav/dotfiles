#!/bin/bash

if [[ "$0" != "${BASH_SOURCE[0]}" ]]; then
    echo -e "You should not be sourcing this installer script! Call it directly."
    return
fi

if [[ -n "$(which pyenv)" ]]; then
    echo -e "pyenv is already installed; nothing to do here"
    exit 0
fi

echo -e "Installing pyenv..."

if [[ -n "$(which brew)" ]] && [[ "$(uname -s)" == "Darwin" ]]; then
    brew install pyenv
else
    echo -e "Installing prereqs for pyenv..."

    # Install prereqs... hopefully works
    # https://github.com/rbenv/ruby-build/wiki#suggested-build-environment

    # debian
    if [ -x "$(command -v apt-get)" ]; then
        sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
            libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
            libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
    else
        echo -e "Could not determine a good build environment for pyenv prereqs; just assuming you already have the right stuff installed!"
    fi

    echo -e "Cloning pyenv repo..."

    git clone https://github.com/pyenv/pyenv.git "$HOME/.pyenv"
    mkdir -p "$HOME/.pyenv/plugins"
    git clone https://github.com/pyenv/pyenv-ccache.git "$HOME/.pyenv/plugins/pyenv-ccache"
    git clone https://github.com/pyenv/pyenv-doctor.git "$HOME/.pyenv/plugins/pyenv-doctor"
    git clone https://github.com/pyenv/pyenv-implicit.git "$HOME/.pyenv/plugins/pyenv-implicit"
    git clone https://github.com/pyenv/pyenv-update.git "$HOME/.pyenv/plugins/pyenv-update"
    git clone https://github.com/pyenv/pyenv-virtualenv.git "$HOME/.pyenv/plugins/pyenv-virtualenv"
fi
