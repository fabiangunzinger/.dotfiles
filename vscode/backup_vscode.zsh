#!/bin/zsh

# Define the source and target directories
SOURCE_DIR="$HOME/Library/Application Support/Code/User"
TARGET_DIR="$HOME/.dotfiles/vscode"

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Copy the VSCode settings and keybindings to the target directory
cp "$SOURCE_DIR/settings.json" "$TARGET_DIR/settings.json"
cp "$SOURCE_DIR/keybindings.json" "$TARGET_DIR/keybindings.json"

# Copy the list of installed extensions to the target directory
code --list-extensions > "$TARGET_DIR/extensions.txt"

echo "VSCode settings, keybindings, and extensions list have been copied to $TARGET_DIR"
