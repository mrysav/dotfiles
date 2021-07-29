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

# Setup instructions:
# https://gist.github.com/bmhatfield/cc21ec0a3a2df963bffa3c1f884b676b

# In order for gpg to find gpg-agent, gpg-agent must be running, and there must be an env
# variable pointing GPG to the gpg-agent socket. This little script, which must be sourced
# in your shell's init script (ie, .bash_profile, .zshrc, whatever), will either start
# gpg-agent or set up the GPG_AGENT_INFO variable if it's already running.

# Add the following to your shell init to set up gpg-agent automatically for every shell
if [ -n "$(pgrep gpg-agent)" ]; then
    export GPG_AGENT_INFO
    export GPG_TTY="$(tty)"
else
    eval "$(gpg-agent --daemon)"
fi

# Homebrew stuff
export HOMEBREW_GITHUB_API_TOKEN="$GITHUB_ACCESS_TOKEN"
export PATH="/usr/local/sbin:$PATH"


