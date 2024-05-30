#!/bin/bash

# install
sudo apt install neovim

# add config file
mkdir -p ~/.config/nvim
ln -s init.vim ~/.config/nvim/init.vim

# make colors dir
mkdir -p ~/.config/nvim/colors
ln -s jellybeans.vim ~/.config/nvim/colors/jellybeans.vim

# make package dir
mkdir -p ~/.config/nvim/pack

# add rainbow csv
mkdir -p ~/.config/nvim/pack/csv/{opt,start}
git clone https://github.com/mechatroner/rainbow_csv ~/.config/nvim/pack/csv/start
