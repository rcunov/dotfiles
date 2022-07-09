#!/bin/bash

# Initialize yes/no dialog function
function ask {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0;;  
            [Nn]*) echo "Skipping that part."; 
				sleep 0.5;
				return 1;;
		*) echo "Yes or no answer, my guy.";
				sleep 1;;
        esac
    done
}

# Appends aliases to shell-specific config file such as .bashrc or .zshrc
ask "Would you like to add aliases to ~/.bash_aliases?" && 
cat aliases.txt > $HOME/.bash_aliases

ask "Would you like to set the bash prompt?" &&
cat bashrc >> $HOME/.bashrc

# Moves vim colorscheme file to proper directory and sets it as default
ask "Would you like to set the vim style?" &&
mkdir -p ~/.vim/colors &&
cp jellybeans.vim ~/.vim/colors &&
# Adds vim config to user's vimrc
OPTIONS_PATH=$(readlink -f vim-options.txt) &&
printf "if filereadable(\"$OPTIONS_PATH\")""\n  source $OPTIONS_PATH""\nendif" >> ~/.vimrc &&
# Installs vim plugins, requires vim 7.3 or newer
mkdir -p ~/.vim/pack/git-plugins/start &&
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/git-plugins/start/ale &&
git clone https://github.com/Yggdroot/indentLine.git ~/.vim/pack/vendor/start/indentLine &&
vim -u NONE -c "helptags  ~/.vim/pack/vendor/start/indentLine/doc" -c "q" &&
pip install --user yamllint

# Add my public keys to authorized_keys file
ask "Would you like to add public keys to ~/.ssh/authorized_keys?" &&
mkdir -p ~/.ssh &&
cat authorized_keys >> ~/.ssh/authorized_keys

# Add tmux configuration
ask "Would you like to set the tmux config?" && cp tmux.conf ~/.tmux.conf

# Install software I like
ask "Do you have sudo and would you like to install software?" &&
read -p "What package manager are you using? (ex. dnf | apt): " PMGR &&
sudo $PMGR update && sudo $PMGR install $(cat software.txt)
