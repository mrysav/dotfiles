#!/bin/bash

if [[ "$0" != "${BASH_SOURCE[0]}" ]]; then
    echo -e "You should not be sourcing this installer script! Call it directly."
    return
fi

if [[ -z "$(which git)" ]]; then
    echo -e "Git is not installed! Please install it and rerun this installer."
fi

git config --global include.path "$DOTFILE_DIR/git/gitconfig.ini"

echo -e "Added include for gitconfig."
