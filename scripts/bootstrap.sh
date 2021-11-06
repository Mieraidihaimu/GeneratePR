#!/bin/sh -xe

brew_install() {
        echo "Installing $1..."
        brew list $1 > /dev/null || brew install $1
        brew outdated $1 || brew upgrade $1
}

brew_install gh
