#!/bin/zsh

# Define the target directory for storing the list
DOTFILES_DIR="/Users/$(whoami)/.dotfiles/homebrew"

# Create the target directory if it doesn't exist
mkdir -p "$DOTFILES_DIR"

# Store the list of installed formulae
brew list > "$DOTFILES_DIR/brew_list.txt"

# Store the list of installed casks
brew list --cask > "$DOTFILES_DIR/brew_cask_list.txt"

echo "List of installed Homebrew packages has been saved to $DOTFILES_DIR"
