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

# Prepares for various installs
read -p "What package manager are you using? (ex. dnf | apt): " PMGR

# Appends aliases to shell-specific config file such as .bashrc or .zshrc
ask "Would you like to add aliases to ~/.bash_aliases?" && 
cat aliases.txt > $HOME/.bash_aliases

ask "Would you like to set the bash prompt?" &&
cat bashrc >> $HOME/.bashrc

# Moves vim colorscheme file to proper directory and sets it as default
ask "Would you like to set the vim style?" &&
sudo $PMGR install vim python3-pip -y &&
mkdir -p ~/.vim/colors &&
cp jellybeans.vim ~/.vim/colors &&
# Adds vim config to user's vimrc
OPTIONS_PATH=$(readlink -f vim-options.txt) &&
printf "\nif filereadable(\"$OPTIONS_PATH\")""\n  source $OPTIONS_PATH""\nendif" >> ~/.vimrc &&
# Installs vim plugins, requires vim 7.3 or newer
mkdir -p ~/.vim/pack/git-plugins/start &&
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/git-plugins/start/ale &&
git clone https://github.com/Yggdroot/indentLine.git ~/.vim/pack/vendor/start/indentLine &&
vim -u NONE -c "helptags  ~/.vim/pack/vendor/start/indentLine/doc" -c "q" &&
pip install --user yamllint

# Add my public keys to authorized_keys file
ask "Would you like to add public keys to ~/.ssh/authorized_keys?" &&
sudo $PMGR install ssh-import-id -y &&
ssh-import-id gh:rcunov

# Add tmux configuration
ask "Would you like to set the tmux config?" && 
sudo $PMGR install tmux -y &&
cp tmux.conf ~/.tmux.conf

# Install software I like
ask "Would you like to install optional software?" &&
sudo $PMGR update && sudo $PMGR install $(cat software.txt)
