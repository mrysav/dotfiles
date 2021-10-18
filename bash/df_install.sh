#!/bin/bash

## df-install
# the dotfile companion nobody was asking for

function df_install {
    thing="${1-}"

    file="$DOTFILE_DIR/installer/$thing.sh"

    if ! [[ -f "$file" ]]; then
        echo -e "There is no installer for '$thing'"
        return 1
    fi

    bash "$file" 
}
alias df-install=df_install
alias dfi=df-install