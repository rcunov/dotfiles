#!/bin/sh

# Appends aliases to shell-specific config file such as .bashrc or .zshrc
read -p "What file holds your aliases? (ex. /home/user/.zshrc ): " RCFILE
printf "\n" >> $RCFILE
cat aliases.txt >> "$RCFILE"

# Moves vim colorscheme file to proper directory and sets it as default
mkdir -p ~/.vim/colors
cp jellybeans.vim ~/.vim/colors
echo "colorscheme jellybeans" >> ~/.vimrc

# Add my public keys to authorized_keys file
mkdir -p ~/.ssh
cat authorized_keys >> ~/.ssh/authorized_keys

# Add my tmux configuration
cp tmux.conf ~/.tmux.conf

# Install software I like
while true; do
	read -p "Do you have sudo and would you like to install software?: " yn
	case $yn in
		[Yy]* ) read -p "What package manager are you using? (ex. yum | apt ) : " PMGR
			sudo $PMGR update && sudo $PMGR install $(cat software.txt); break;;
		[Nn]* ) exit;;
		* ) echo "Yes or no answer, my guy.";;
	esac
done

