#!/bin/bash

if [[ "$0" != "${BASH_SOURCE[0]}" ]]; then
    echo -e "You should not be sourcing this installer script! Call it directly."
    return
fi

if [[ -n "$(which nodenv)" ]]; then
    echo -e "nodenv is already installed; nothing to do here"
    exit 0
fi

echo -e "Installing nodenv..."

if [[ -n "$(which brew)" ]]; then
    brew install nodenv node-build
else
    echo -e "Installing prereqs for nodenv..."

    # Install prereqs... hopefully works
    # https://github.com/rbenv/ruby-build/wiki#suggested-build-environment

    sudo apt-get install python3 g++ make
    Fedora: sudo dnf install python3 gcc-c++ make

    # debian
    if [ -x "$(command -v apt-get)" ]; then
        sudo apt-get install python3 g++ make# rhel, fedora, alinux
    elif [ -x "$(command -v yum)" ]; then
        sudo yum install python3 gcc-c++ make
    else
        echo -e "Could not determine a good build environment for nodenv prereqs; just assuming you already have the right stuff installed!"
    fi

    echo -e "Cloning nodenv repo..."

    git clone https://github.com/nodenv/nodenv.git "$HOME/.nodenv"
    mkdir -p "$HOME/.nodenv/plugins"
    git clone https://github.com/nodenv/node-build.git "$HOME/.nodenv/plugins/node-build"
    git clone https://github.com/nodenv/nodenv-aliases.git "$HOME/.nodenv/plugins/nodenv-aliases"
    git clone https://github.com/nodenv/nodenv-update.git "$HOME/.nodenv/plugins/nodenv-update"
fi
