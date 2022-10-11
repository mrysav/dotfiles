#shellcheck shell=bash

# One part bash_profile, one part bashrc... it's the mac customizations

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# this is annoying
GIT_COMPLETE_FILE="/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash"
[[ -r "$GIT_COMPLETE_FILE" ]] && . "$GIT_COMPLETE_FILE"

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

export PATH="/usr/local/sbin:$PATH"
