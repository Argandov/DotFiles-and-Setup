#!/bin/bash

# This script fetches this repository's .bashrc && .vimrc, and installs VIM plugins if passed in with --vimrc

function get_bashrc() {
		echo "Getting bashrc"
		cp ~/.bashrc ~/.bashrc.backup && echo "bashrc backed up to $HOME/.bashrc.backup" || echo "No .bashrc present. Proceeding to download remote Vimrc file"
		curl -s https://raw.githubusercontent.com/Argandov/my_dotfiles/master/.bashrc -o ~/.bashrc
}

function get_vimrc() {
		# Install Git (If not already installed)
		sudo apt-get install git -y
		# Fetch .vimrc
		cp ~/.vimrc ~/.vimrc.backup && echo ".vimrc backed up at $HOME/.vimrc.backup" || echo "No .vimrc present. Proceeding to download remote Vimrc file"
		curl -s https://raw.githubusercontent.com/Argandov/my_dotfiles/master/.vimrc -o .vimrc
		# Fetch vim-plug (Plugin manager)
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		# Install plugins (As specified in the .vimrc already downloaded)
		vim -C ":PlugInstall" -c ":qall" && echo "Ok. Vim Plugins Installed"
}

# Check if "--all" is passed as an argument
if [[ "$1" == "--vimrc" ]]; then
    get_vimrc && echo "[+] Vim set up correctly"

elif [[ "$1" == "--bashrc" ]]; then
    get_bashrc && echo "[+] Bashrc set up"
elif [[ "$1" == "--all" ]]; then
    get_bashrc && echo "[+] Bashrc set up"
    get_vimrc && echo "[+] Vim set up correctly"
else
    # Print a usage message if no valid argument is provided
    echo "Usage: $0 [--vimrc|--bashrc|--all]"
    exit 1
fi
