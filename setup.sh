#!/bin/sh
# -*- coding: utf-8 -*-

# HomeBrewがなければインストール
xcode-select --install > /dev/null

which brew > /dev/null
if [ $? == 1 ]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# iTerm2
# brew install --cask iterm2

# NeoVim

# Python
## neovim(python)

# java

# Docker

# Google Chrome

# Create symbolic links
OLDIFS=$IFS
IFS=$'\n'
files=(`cat ./files`)

for file in "${files[@]}"; do
	rm -rf ~/$file
	ln -fs ~/dotfiles/$file ~/$file
done
IFS=$OLDIFS
