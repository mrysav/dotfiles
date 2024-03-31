# shellcheck shell=bash

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