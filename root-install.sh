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
cat aliases.txt > /root/.bash_aliases

cat minimal-install.txt >> /root/.bashrc
mkdir -p /root/.vim/colors
read -p "What is the user you want to copy from?: " USR

ln -s /home/$USR/.tmux.conf /root/.tmux.conf
ln -s /home/$USR/.vim/colors/jellybeans.vim /root/.vim/colors/jellybeans.vim

