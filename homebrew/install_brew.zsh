#!/bin/zsh

# Define the source directory for the list of packages
DOTFILES_DIR="/Users/$(whoami)/.dotfiles/homebrew"

# Check if the files exist
if [ ! -f "$DOTFILES_DIR/brew_list.txt" ] || [ ! -f "$DOTFILES_DIR/brew_cask_list.txt" ]; then
  echo "Package list files not found in $DOTFILES_DIR"
  exit 1
fi

# Read and install each formula
echo "Installing Homebrew formulae..."
while IFS= read -r formula; do
  if ! brew list --formula | grep -q "^${formula}\$"; then
    brew install "$formula"
  else
    echo "$formula is already installed."
  fi
done < "$DOTFILES_DIR/brew_list.txt"

# Read and install each cask
echo "Installing Homebrew casks..."
while IFS= read -r cask; do
  if ! brew list --cask | grep -q "^${cask}\$"; then
    brew install --cask "$cask"
  else
    echo "$cask is already installed."
  fi
done < "$DOTFILES_DIR/brew_cask_list.txt"

echo "Homebrew packages installation complete."
