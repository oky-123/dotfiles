#!/bin/sh
# -*- coding: utf-8 -*-

# Create symbolic links
OLDIFS=$IFS
IFS=$'\n'
files=(`cat ./dotfiles`)

for file in "${files[@]}"; do
	rm -rf ~/$file
	ln -fs ~/dotfiles/$file ~/$file
done
IFS=$OLDIFS


xcode-select --install > /dev/null

# HomeBrewがなければインストール
which brew > /dev/null
if [ $? == 1 ]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi


# git
brew install git

# zsh
brew install zsh
sudo sh -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# iTerm2
brew install --cask iterm2

# NeoVim
brew install neovim

# Setup Pyenv
which pyenv > /dev/null
if [ $? == 1 ]; then
	git clone https://github.com/pyenv/pyenv.git ~/.pyenv
fi
~/.pyenv/bin/pyenv install 3.8.3
~/.pyenv/bin/pyenv install 2.7.18
# CFLAGS="-I$(brew --prefix openssl)/include" LDFLAGS="-L$(brew --prefix openssl)/lib" pyenv install -v 2.7.18
pyenv rehash

# Install virtualenv, Create virtualenv for neovim_python
~/.pyenv/bin/pyenv global 3.8.3
pip install --upgrade pip
pip install virtualenv
virtualenv -p python3 ~/nvim_python3
source ~/nvim_python3/bin/activate
pip install -r ~/dotfiles/nvim_python3_requirements.txt
deactivate

# Install neovim_python2
~/.pyenv/bin/pyenv global 2.7.18
pip install --upgrade pip
pip install virtualenv
virtualenv -p python ~/nvim_python2
source ~/nvim_python2/bin/activate
pip install -r ~/dotfiles/nvim_python2_requirements.txt
deactivate

~/.pyenv/bin/pyenv global 3.8.3

# java
brew install java java11
brew tap homebrew/cask-versions
brew install --cask corretto8
sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
sudo ln -sfn /usr/local/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk

# Docker
brew install docker
brew install --cask docker

# Google Chrome
brew install --cask google-chrome

# IME
brew install --cask google-japanese-ime

# tmux
brew install tmux

# fzf
brew install fzf

# gsed
brew install gsed

# reattach-to-user-namespace
brew install reattach-to-user-namespace

# etc...
brew install --cask deepl
brew install --cask slack
brew install --cask zoom
brew install --cask discord
brew install --cask dropbox
brew install --cask spectacle
brew install --cask karabiner-elements

ssh-keygen -t rsa -b 4096 -C "oky123.ia@gmail.com"
echo "Setup finidhed."
