#!/usr/bin/env bash

cd ~ && mkdir repos && cd repos

git clone https://github.com/ajaymahar/dotfiles.git dotfiles

if [ "$(uname)" == "Darwin" ]; then
    echo "Running on OSX"

    echo "Brewing all the things"
    source bin/.config/bin/bi.sh
fi

echo "Configuring zsh as default shell"
chsh -s $(which zsh)

echo "Done."
