#!/bin/bash

function check_prereqs {
    if [[ -z "$(which git)" ]]; then
        echo -e "git is required but not found!"
    fi
}

function create_if_not_exist {
    FILE="$1"
    if [[ ! -f "$FILE" ]]; then
        echo -e "Creating $FILE"
        touch "$FILE"
    fi
}

function add_line_if_not_present {
    FILE="$1"
    LINE="$2"

    if ! grep -q "$LINE" "$FILE"; then
        echo "$LINE" >> "$FILE"
    fi
}

function install_bashrc {
    BASHRC_FILE="$HOME/.bashrc"
    if [[ "$DARWIN" == "1" ]]; then
        BASHRC_FILE="$HOME/.bash_profile"
    fi

    create_if_not_exist "$BASHRC_FILE"

    add_line_if_not_present "$BASHRC_FILE" "export DOTFILE_DIR=$DOTFILE_DIR"
    add_line_if_not_present "$BASHRC_FILE" "source \"\$DOTFILE_DIR/bash/bashrc.sh\""

    if [[ "$DARWIN" == "1" ]]; then
        add_line_if_not_present "$BASHRC_FILE" "source \"\$DOTFILE_DIR/bash/mac.sh\""
    fi
}

function install_tmuxconf {
    if [[ -z "$(which tmux)" ]]; then
        echo -e "tmux is not found."
        return
    fi

    TMUXRC_FILE="$HOME/.tmux.conf"
    TMUXRC_SRC_LINE="source-file \"\$DOTFILE_DIR/tmux/tmux.conf\""

    create_if_not_exist "$TMUXRC_FILE"
    add_line_if_not_present "$TMUXRC_FILE" "$TMUXRC_SRC_LINE"

    if [[ ! -d ~/.tmux ]]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi
}

function install_vimrc {
    return
}

check_prereqs

# As always, props to
# https://stackoverflow.com/questions/59895/how-can-i-get-the-source-directory-of-a-bash-script-from-within-the-script-itsel
DOTFILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo -e "We appear to be running from $DOTFILE_DIR..."

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo -e "Mac detected!"
    DARWIN=1
else
    DARWIN=0
fi

install_bashrc
install_tmuxconf
install_vimrc
