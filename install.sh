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
ask "Would you like to add aliases to your shell config?" && 
read -p "What is your shell alias file? (ex. .zshrc): " RCFILE &&
printf "\n" >> $HOME/$RCFILE && cat aliases.txt >> $HOME/$RCFILE;

ask "Would you like a fancy color prompt?" &&
read -p "What is your shell profile file? (ex. .bash_profile): " PROFILE &&
if [ $USER = "root" ]
then
	printf "\n" >> $HOME/$PROFILE &&
	echo "PS1='\[\033[01;34m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[00m\]\# '" >> $HOME/$PROFILE
	# might have to do some janky stuff with sed to make that hash mark insert properly. todo
else
	printf "\n" >> $HOME/$PROFILE &&
	echo "PS1='\[\033[01;34m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[00m\]$ '" >> $HOME/$PROFILE
fi

# Moves vim colorscheme file to proper directory and sets it as default
ask "Would you like to set the vim style?" &&
mkdir -p ~/.vim/colors &&
cp jellybeans.vim ~/.vim/colors &&
echo "colorscheme jellybeans" > ~/.vimrc

# Add my public keys to authorized_keys file
ask "Would you like to add public keys to ~/.ssh/authorized_keys?" &&
mkdir -p ~/.ssh &&
cat authorized_keys >> ~/.ssh/authorized_keys

# Add my tmux configuration
ask "Would you like to set the tmux config?" && cp tmux.conf ~/.tmux.conf

# Install software I like
ask "Do you have sudo and would you like to install software?" &&
read -p "What package manager are you using? (ex. yum | apt): " PMGR &&
sudo $PMGR update && sudo $PMGR install $(cat software.txt)
