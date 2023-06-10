# macbook setup
# fabian gunzinger
#
# todo
# - look into xcape to automatically configure modifier keys

# Xcode
echo "Installing Xcode..."
xcode-select --install

# Homebrew
echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Neovim
# Install `nvim` and `pynvim` (into env used for nvim) to enable use of Python plugins.
# Python interpreter is set in init.vim.
echo "Installing Neovim..."
brew install nvim
pip3 install pynvim

# GitHub
echo "Authenticate GitHub accounts..."
## Install GitHub CLI
brew install gh
## Create ssh keys and authenticate with GitHub accounts
## Specify appropriate comment and file path and provide empty
## (new) passphrase to disable passphrase option
cd
## Personal account
echo "Authenticate personal account..."
ssh-keygen -t ed25519 -C "personal_gh" -f ".ssh/personal_gh" -N ""
gh auth login -h "github.com" -w
## Work account
ssh-keygen -t ed25519 -C "jet_gh" -f ".ssh/jet_gh" -N ""
gh auth login -h "github.je-labs.com" -w

# Configuration files
## Clone .dotfiles to ~/ and run install to create symlinks


# Python

# Virtual environments
# Go to ~/.venvs, and get requirements.tex for each one so I can reproduce on new machine
## todo: configure Jupyter environment
## todo: save all virtualenv configs somewhere so I can share across machines

# Latex and xelatex so I can download as pdf from Jupyter
# from here: https://gist.github.com/peterhurford/75957ba9335e755013b87254ec85fab1


# Dependency management
## Currently trying both pip and poetry

## Poetry installation
# curl -sSL https://install.python-poetry.org | python3 -
# Don't use poetry for virtualenv mgt
# poetry config virtualenvs.create false
# poetry completions bash > $(brew --prefix)/etc/bash_completion.d/poetry.bash-completion

# Terminal

## Install iterm2
brew install --cask iterm2

## Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Install 'hack' nerd font using Homebrew
## Manually select desired font in iTerm (currently 'Hack Nerd Font')
## TODO: select font automatically in iTerm2
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

## Manually import iterm2-profiles.json (iterm2/Profiles/Other actions)
## todo: automatically import iterm2-profiles.json

## Install starwhip prompt
brew install starship

# Install autocompletions extension
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

## Install fuzzy finder (FZF)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

## Install ripgrep
brew install ripgrep

## Install zsh-z for directory jumping
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

## Install bat - the better cat
brew install bat

## Install tmux
## reattach-to-user-namespace utility allows scrolling in tmux (see
## here: https://thoughtbot.com/blog/tmux-copy-paste-on-os-x-a-better-future)
brew install tmux
brew install reattach-to-user-namespace


## Install battery
brew tap Goles/battery
brew install battery

## Misc. terminal utilities
brew install htop
brew install rename

## exa
## Using zsh plugin for handy aliases: https://github.com/MohamedElashri/exa-zsh
brew install exa


# Docker
# Useful guide: https://www.cprime.com/resources/blog/docker-for-mac-with-homebrew-a-step-by-step-tutorial/
brew install --cask docker


# macOS applications
brew install pandoc
brew install --cask quarto
brew install --cask mactex
brew install --cask skype
brew install --cask spotify
brew install --cask skim
brew install --cask chrome
brew install --cask whatsapp
brew install --cask flux
brew install --cask firefox



# Stuff I might not need any longer

brew tap hashicorp/tap
brew install hashicorp/tap/terraform
# Latex


brew install fzf
$(brew --prefix)/opt/fzf/install

# miniconda install (check that it contains python version you want)
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-latest-MacOSX-x86_64.sh
rm Miniconda3-latest-MacOSX-x86_64.sh
