#!/bin/bash

# WIP

if [[ ! -d "$HOME/.config/dotfiles" ]]; then
		mkdir -p "$HOME/.config/dotfiles"
fi

# backup current default dotfiles:
if [[ -f "$HOME/.vimrc" ]]; then
		mv "$HOME/.vimrc" "$HOME/.vimrc.backup"
fi

if [[ -f "$HOME/.zshrc" ]]; then
		mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

DOTFILES_DIR="$HOME/.config/dotfiles"

ln -sf "$DOTFILES_DIR/vimrc" "$HOME/.vimrc"
ln -sf "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"

