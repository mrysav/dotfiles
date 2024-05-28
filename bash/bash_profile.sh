# shellcheck shell=bash

if ! [[ "$DOTFILE_BASHRC_SOURCED" -eq "1" ]]; then
   # shellcheck disable=SC1091
   source "$DOTFILE_DIR/bash/bashrc.sh"
fi

if which ssh-agent >/dev/null && [ -z "$SSH_AUTH_SOCK" ]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="$(ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]')"
   if [ "$RUNNING_AGENT" = "0" ]; then
        echo "Starting ssh-agent"
        # Launch a new instance of the agent
        ssh-agent -s &> "$HOME/.ssh/ssh-agent"
   fi
   eval "$(cat "$HOME/.ssh/ssh-agent")"
fi