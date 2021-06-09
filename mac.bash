# One part bash_profile, one part bashrc... it's the mac customizations

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Teach your kids bash before somebody else does
# http://bashrcgenerator.com/
# https://ss64.com/osx/syntax-prompt.html

reset="$(tput sgr0)"
bold="$(tput bold)"
bold_green="\e[1;32m"
bold_blue="\e[1;34m"
export PS1="\[$bold_green\]@\u\[$reset\]\[$bold\]:\[$reset\]\[$bold_blue\]\w\[$reset\]\[$bold\]\$\[$reset\] "

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
