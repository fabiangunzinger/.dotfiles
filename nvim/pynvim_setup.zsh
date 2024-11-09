#!/bin/zsh

# Define the Python version and virtual environment directory
PYTHON_VERSION="3.13.0"
VENV_NAME="nvim"
VENV_DIR="$HOME/.venvs/$VENV_NAME"

# Check if Python version is installed
if ! python3.13 --version &>/dev/null; then
    echo "Python version is not installed. Please install Python first."
    exit 1
fi

# Create the virtual environment directory if it doesn't exist
mkdir -p ~/.venvs

# Create the virtual environment
echo "Creating virtual environment for Neovim..."
python3.13 -m venv "$VENV_DIR"

# Activate the virtual environment
source "$VENV_DIR/bin/activate"

# Upgrade pip and install necessary packages for Neovim
pip install --upgrade pip
pip install pynvim

# Deactivate the virtual environment
deactivate

echo "Python virtual environment for nvim created successfully at $VENV_DIR."

