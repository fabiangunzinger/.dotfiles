#!/bin/zsh

# Define the Python version and virtual environment directory
PYTHON_VERSION="3.10.13"
VENV_NAME="nvim3.10"
VENV_DIR="$HOME/.venvs/$VENV_NAME"

# Check if Python 3.10 is installed
if ! python3.10 --version &>/dev/null; then
    echo "Python 3.10 is not installed. Please install Python 3.10 first."
    exit 1
fi

# Create the virtual environment directory if it doesn't exist
mkdir -p ~/.venvs

# Create the virtual environment
echo "Creating virtual environment for Neovim..."
python3.10 -m venv "$VENV_DIR"

# Activate the virtual environment
source "$VENV_DIR/bin/activate"

# Upgrade pip and install necessary packages for Neovim
pip install --upgrade pip
pip install pynvim

# Deactivate the virtual environment
deactivate

echo "Python 3.10 virtual environment 'nvim3.10' created successfully at $VENV_DIR."

