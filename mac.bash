# One part bash_profile, one part bashrc... it's the mac customizations

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export PS1="\[\033[1;32m\]@\u:\033[34m\w\033[32m$\\[\033[0m\] "

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"