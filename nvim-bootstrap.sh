#!/bin/bash

# make sure neovim is installed
if ! command -v nvim &> /dev/null
then
  echo "nvim does not exist - attempting to install"
  sleep 0.5
  read -p "What package manager are you using? (ex. dnf | apt): " PMGR
  sudo $PMGR install neovim
fi

# reset config file
mkdir -p ~/.config/nvim
rm -f ~/.config/nvim/init.vim
ln $(readlink -f ./init.vim) ~/.config/nvim/init.vim

# make colors dir
mkdir -p ~/.config/nvim/colors

# reset jellybeans
rm -f ~/.config/nvim/colors/jellybeans.vim
ln $(readlink -f ./jellybeans.vim) ~/.config/nvim/colors/jellybeans.vim

# make package dir
mkdir -p ~/.config/nvim/pack

# add rainbow csv to "csv" package folder
mkdir -p ~/.config/nvim/pack/csv/{opt,start}
RepoSrc=https://github.com/mechatroner/rainbow_csv
RepoDst=~/.config/nvim/pack/csv/start/rainbow_csv
git clone "$RepoSrc" "$RepoDst" 2> /dev/null || git -C "$RepoDst" pull

## add tabline plugin - ignored for now because of issue with jellybeans colorscheme and highlight when buff is changed
#mkdir -p ~/.config/nvim/pack/tabs/{opt,start}
#RepoSrc=https://github.com/romgrk/barbar.nvim
#RepoDst=~/.config/nvim/pack/tabs/start/barbar-tabline
#git clone "$RepoSrc" "$RepoDst" 2> /dev/null || git -C "$RepoDst" pull
