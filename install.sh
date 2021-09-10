#!/bin/bash

# Initialize yes/no dialog function
function ask_yes_no {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0  ;;  
            [Nn]*) echo "Exiting..." ; return  1 ;;
			* ) echo "Yes or no answer, my guy.";;
        esac
    done
}

# Appends aliases to shell-specific config file such as .bashrc or .zshrc
ask_yes_no "Would you like to add aliases to your shell config?" && 
read -p "What is your shell config file? (ex. .zshrc): " RCFILE &&
printf "\n" >> $HOME/$RCFILE && cat aliases.txt >> $HOME/$RCFILE;


# Moves vim colorscheme file to proper directory and sets it as default
ask_yes_no "Would you like to set the vim style?" &&
mkdir -p ~/.vim/colors &&
cp jellybeans.vim ~/.vim/colors &&
echo "colorscheme jellybeans" > ~/.vimrc

# Add my public keys to authorized_keys file
ask_yes_no "Would you like to add public keys to ~/.ssh/authorized_keys?" &&
mkdir -p ~/.ssh &&
cat authorized_keys >> ~/.ssh/authorized_keys

# Add my tmux configuration
ask_yes_no "Would you like to set the tmux config?" && cp tmux.conf ~/.tmux.conf

# Install software I like
ask_yes_no "Do you have sudo and would you like to install software?" &&
read -p "What package manager are you using? (ex. yum | apt ): " PMGR &&
sudo $PMGR update && sudo $PMGR install $(cat software.txt)
