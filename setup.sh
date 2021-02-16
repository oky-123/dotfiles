#!/bin/sh
# -*- coding: utf-8 -*-

# Create symbolic links
IFS=$'\n'
files=(`cat ./files`)

for file in "${files[@]}"; do
	rm -rf ~/$file
	ln -fs ~/dotfiles/$file ~/$file
done
