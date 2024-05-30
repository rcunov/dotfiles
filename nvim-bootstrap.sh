#!/bin/bash

# install
sudo apt install neovim

# add config file
mkdir -p ~/.config/nvim
ln $(readlink -f ./init.vim) ~/.config/nvim/init.vim

# make colors dir
mkdir -p ~/.config/nvim/colors
ln $(readlink -f ./jellybeans.vim) ~/.config/nvim/colors/jellybeans.vim

# make package dir
mkdir -p ~/.config/nvim/pack

# add rainbow csv to "csv" package folder
mkdir -p ~/.config/nvim/pack/csv/{opt,start}
git clone https://github.com/mechatroner/rainbow_csv ~/.config/nvim/pack/csv/start/rainbow_csv