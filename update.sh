#!/bin/bash

# Appends aliases to shell-specific config file such as .bashrc or .zshrc
cat aliases.txt > $HOME/.bash_aliases

# Moves vim colorscheme file to proper directory and sets it as default
mkdir -p ~/.vim/colors &&
cp jellybeans.vim ~/.vim/colors &&
echo "colorscheme jellybeans" > ~/.vimrc

# Add my tmux configuration
cp tmux.conf ~/.tmux.conf
