# shellcheck shell=bash

alias h="cd ~"
alias tmux="tmux -2"
alias tm="tmux attach || tmux"
alias nmu="net-mounts-up"
alias nmd="net-mounts-down"

function update_shellcheck() {
    cd ~/Downloads || exit 1
    scversion="stable" # or "v0.4.7", or "latest"
    wget -qO- "https://storage.googleapis.com/shellcheck/shellcheck-${scversion?}.linux.x86_64.tar.xz" | tar -xJv
    wget -qO- "https://github.com/koalaman/shellcheck/releases/download/${scversion?}/shellcheck-${scversion?}.linux.x86_64.tar.xz" | tar -xJv
    cp "shellcheck-${scversion}/shellcheck" ~/bin/
    shellcheck --version
    rm "shellcheck-${scversion}"/*
    rmdir "shellcheck-${scversion}"
    cd - || exit 1
}
alias update-shellcheck=update_shellcheck

function update_mc_launcher() {
    cd ~/Downloads || exit 1
    wget "https://launcher.mojang.com/download/Minecraft.deb"
    sudo dpkg -i Minecraft.deb && rm Minecraft.deb
    cd - || exit 1
}
alias update-minecraft-launcher=update_mc_launcher

