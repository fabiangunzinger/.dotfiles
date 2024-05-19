#!/bin/zsh

# Define the Python version and virtual environment directory
PYTHON_VERSION="3.10"
VENV_NAME="nvim-quarto"
VENV_DIR="$HOME/.venvs/$VENV_NAME"

# Check if Python 3.10 is installed
if ! python3.10 --version &>/dev/null; then
    echo "Python 3.10 is not installed. Please install Python 3.10 first."
    exit 1
fi

# Create the virtual environment directory if it doesn't exist
mkdir -p ~/.venvs

# Create the virtual environment
echo "Creating virtual environment for Quarto in Neovim..."
python3.10 -m venv "$VENV_DIR"

# Activate the virtual environment
source "$VENV_DIR/bin/activate"

# Upgrade pip and install necessary packages for Quarto and Neovim
pip install --upgrade pip
pip install pynvim jupyterlab

# Deactivate the virtual environment
deactivate

echo "Python virtual environment 'nvim-quarto' created successfully at $VENV_DIR."

