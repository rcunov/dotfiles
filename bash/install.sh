#!/bin/bash

# Initialize yes/no dialog function
function ask {
  while true; do
    read -p "$* [y/N]: " yn
    case $yn in
      [Yy]*) return 0;;
      "" | [Nn]*) echo "Skipping that part."; # default option is no
        sleep 0.5;
        return 1;;
      *) echo "Yes or no answer, my guy.";
        sleep 1;;
  esac
  done
}

# Prepares for various installs
read -p "What package manager are you using? (ex. dnf | apt): " PMGR

# Links aliases to shell-specific config file to .bashrc
ask "Would you like to add aliases to ~/.bash_aliases?" &&
rm -f ~/.bash_aliases && ln $(readlink -f ./aliases.txt) ~/.bash_aliases

# Includes bashrc configs in the ~/.bashrc
ask "Would you like to set bashrc properties like the prompt? " &&
cat include-bashrc.txt >> $HOME/.bashrc

# Add my public keys to authorized_keys file
ask "Would you like to add public keys to ~/.ssh/authorized_keys?" &&
sudo $PMGR install ssh-import-id -y &&
ssh-import-id gh:rcunov

# Add tmux configuration
ask "Would you like to set the tmux config?" &&
sudo $PMGR install tmux -y &&
rm -f ~/.tmux.conf && ln $(readlink -f ./tmux.conf) ~/.tmux.conf
