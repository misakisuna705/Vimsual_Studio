#!/usr/bin/env bash

setup() {
    bash "$HOME/.dotfiles/src/env.sh"
    bash "$HOME/.dotfiles/src/brew.sh"
    bash "$HOME/.dotfiles/src/symlink.sh"
    bash "$HOME/.dotfiles/src/yarn.sh"
    bash "$HOME/.dotfiles/src/pip.sh"
}

setup
