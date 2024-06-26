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

ask "Would you like to source bash_aliases from bashrc?" && cat minimal-install.txt >> /root/.bashrc
read -p "What is the user you want to copy from?: " USR

rm -f /root/.bash_aliases && ln -s /home/$USR/.bash_aliases /root/.bash_aliases
rm -f /root/.tmux.conf && ln -s /home/$USR/.tmux.conf /root/.tmux.conf

