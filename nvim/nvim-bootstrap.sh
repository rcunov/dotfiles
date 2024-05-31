#!/bin/bash

# deletes old config file and creates new one with hardlink to local file
# $1 = local file
# $2 = target file
reset() {
  rm -f "$2"
  ln $(readlink -f "$1") "$2"
}

# make sure neovim is installed
if ! command -v nvim &> /dev/null
then
  echo "nvim does not exist - attempting to install"
  cd /tmp
  curl -sSLO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
  sudo tar -C /opt -xzf nvim-linux64.tar.gz
  rm nvim-linux64.tar.gz
  cd -
  echo export PATH="$PATH:/opt/nvim-linux64/bin" >> ~/.bashrc
  echo "may need to source ~/.bashrc"
fi

# reset config file
mkdir -p ~/.config/nvim
reset ./init.lua ~/.config/nvim/init.lua

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
