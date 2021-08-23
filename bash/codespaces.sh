#shellcheck shell=bash

# For codespaces config, specifically...

# Eager load linux brew if it's there. It's just easier that way.
if [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi