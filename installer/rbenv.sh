#!/bin/bash

if [[ "$0" != "${BASH_SOURCE[0]}" ]]; then
    echo -e "You should not be sourcing this installer script! Call it directly."
    return
fi

if [[ -n "$(which rbenv)" ]]; then
    echo -e "rbenv is already installed; nothing to do here"
    exit 0
fi

echo -e "Installing rbenv..."

if [[ -n "$(which brew)" ]]; then
    brew install rbenv ruby-build
else
    echo -e "Installing prereqs for rbenv..."

    # Install prereqs... hopefully works
    # https://github.com/rbenv/ruby-build/wiki#suggested-build-environment

    # debian
    if [ -x "$(command -v apt-get)" ]; then
        sudo apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev
    # rhel, fedora, alinux
    elif [ -x "$(command -v yum)" ]; then
        sudo yum install -y gcc-6 bzip2 openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel
    else
        echo -e "Could not determine a good build environment for rbenv prereqs; just assuming you already have the right stuff installed!"
    fi

    echo -e "Cloning rbenv repo..."

    git clone https://github.com/rbenv/rbenv.git "$HOME/.rbenv"
    mkdir -p "$HOME/.rbenv/plugins"
    git clone https://github.com/rbenv/ruby-build.git "$HOME/.rbenv/plugins/ruby-build"
    git clone https://github.com/rkh/rbenv-update.git "$HOME/.rbenv/plugins/rbenv-update"
fi
