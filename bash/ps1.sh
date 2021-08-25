# shellcheck shell=bash

# Teach your kids bash before somebody else does
# http://bashrcgenerator.com/
# https://ss64.com/osx/syntax-prompt.html

reset="$(tput sgr0)"
bold="$(tput bold)"
bold_green="\e[1;32m"
bold_blue="\e[1;34m"

if [[ "$CODESPACES" == "true" && -n $CODESPACE_NAME ]]; then
    PSUSR="$(echo "$CODESPACE_NAME" | sed 's/\-/ /g' | awk '{ print $1 }')"
    PSHOST=""
elif [[ -n "$REMOTE_CONTAINERS_IPC" ]]; then
    # This is probably not foolproof, but if you're using a vscode devcontainer,
    # (not on codespaces) this will probably work fine?
    PSUSR="\u"
    PSHOST=""
else
    PSUSR="\u"
    PSHOST="@\h"
fi

export PS1="\[$bold_green\]$PSUSR$PSHOST\[$reset\]\[$bold\]:\[$reset\]\[$bold_blue\]\w\[$reset\]\[$bold\]\$\[$reset\] "
