# .dotfiles

Setting up a development machine can be painful. Here I want to collect what I do, why I do it, and how I use my setup.

## Before a reset

- Run the below for auto backups

```{bash}
\Users\$(whoami)\.dotfiles\backup.zsh
```
- Backup to external drive

- Ensure there are no unpushed changes in git repositories

- Ensure iCloud Drive is up to date (photos, docs, etc.)

- Deactivate/sign out of accounts (iTunes, iCloud)

## Xcode

```{bash}
xcode-select --install
```

## Homebrew

```{bash}
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew doctor
```

## GitHub CLI

```{bash}
brew install gh
```

## SSH

```{bash}
mkdir -p ~/.ssh
cd ~/.ssh

echo "Authenticate personal account..."
ssh-keygen -t rsa -C "personal_gh" -f "personal_gh" -N ""
ssh-add ~/.ssh/personal_gh
gh auth login -h "github.com" -w

echo "Authenticate work account..."
ssh-keygen -t ed25519 -C "work_gh" -f ".ssh/work_gh" -N ""
ssh-add ~/.ssh/work_gh
gh auth login -h "github.je-labs.com" -w

echo "Create config file..."

```

Notes:

- I want access to work and personal GitHub projects on all my machines, and I want Github to automatically use my personal and work credentials depending on what directory I'm in. I use `.gitconfig` files to make this all work smoothly.

- In `ssh-keygen`, the `-t` flag allows me to specify the type of key I want to generate, the `-C` flag to add a comment, the `-f` flag to add a file name, and the `-N` flag to add a passphrase. `""` means no passphrase.



## Dotfiles

```{bash}
cd ~
git clone git@github.com:fabiangunzinger/.dotfiles.git
~/.dotfiles/install
```

Notes:

- I store my dotfiles in `~/.dotfiles` and manage them with [`stow`](https://alexpearce.me/2016/02/managing-dotfiles-with-stow/).

- To create a symlink for each dotfile to my home directory, I simply run `~/.dotfiles/install`.

- Not all folders in `.dotfiles` contain dotfiles I want to symlink to my home directory. Those I want to add are listed in `$STOW_FOLDERS` in the installation script. Hence, if I add a new folder with files I want to link, I have to change said script accordingly.


## Terminal

Install iterm2, oh my zsh, and coreutils:

```
echo "Install iterm2"
brew install --cask iterm2

echo "Install oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "GNU Install coreutils"
brew install coreutils
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"

echo "Install nerd font"
brew install --cask font-hack-nerd-font
brew install --cask font-source-code-pro

echo "Install autocomplete extensions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Install syntax highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Install zsh-z"
<!-- git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z -->
brew install z

echo "Install fzf"
<!-- git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf -->
<!-- ~/.fzf/install -->
brew install fzf
$(brew --prefix)/opt/fzf/install

echo "Install ack"
brew install ack

echo "Install ripgrep"
brew install ripgrep

echo "Install bat"
brew install bat

echo "Install battery"
brew tap Goles/battery
brew install battery

## Misc. terminal utilities
brew install htop
brew install rename


## exa
## Using zsh plugin for handy aliases: https://github.com/MohamedElashri/exa-zsh
brew install exa

## Make iterm config script executable
chmod +x /Users/$(whoami)/iterm2/.dotfiles/configure_iterm2.zsh

## Run iterm config script
/Users/$(whoami)/iterm2/.dotfiles/configure_iterm2.zsh


```

Notes: 

- I use zsh as my shell and [oh my zsh](https://ohmyz.sh) for configuration.

- I use the [starship](https://starship.rs) prompt.

- I use `zsh-z` to quickly navigate to frequently used directories (e.g. `z do`
  gets me to `~/.dotfiles` from anywhere). Combined with the
  in-built fuzzy directory completion of zsh, and the fzf plugin, this makes
  navigation extremely quick.

- I use [`bat`](https://github.com/sharkdp/bat) (an improved version of cat) to
  quickly view files.

- I use GNU cor utilities, which I download and add to path in .zshrc.


## tmux

```{bash}
brew install tmux
brew install reattach-to-user-namespace
```

Notes:
- `reattach-to-user-namespace` utility allows scrolling in tmux (see [here](https://thoughtbot.com/blog/tmux-copy-paste-on-os-x-a-better-future))



## Neovim

```{bash}
cd ~
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install

# Create pynvim venv for neovim
chmod +x /Users/$(whoami)/iterm2/nvim/pynvim_setup.zsh
/Users/$(whoami)/iterm2/nvim/pynvim_setup.zsh

```

Notes:

- I use Neovim.

- To avoid unwanted updates from core neovim and plugins, I install Neovim from source and pin plugins to specific versions, tags, or commits. I only update when I have a specific reason to do so.

- To install Neovim from source, I followed [these](https://github.com/neovim/neovim/wiki/Building-Neovim) instructions. I clone repo into my home directory. After installing the dependencies via homebrew, the commands are the following:

- To completely uninstall neovim, I'd use:

```
sudo rm /usr/local/bin/nvim
sudo rm -r /usr/local/share/nvim/
```

- I use `lazy.nvim` as my package manager.

- To delete all packages (so they get newly installed on next startup) I use:

```
rm -r ~/.local/share/nvim/
```

<!-- - I follow [this](https://www.reddit.com/r/vim/comments/u1kppk/comment/i4ecygu/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button) suggestion and map the meta key to my left option key, so I can use `M` key bindings in vim. I do this by setting the mapping in iTerm: `ITerm2 -> Preferences -> Profiles -> keys -> General -> Choose "left Option key " as "Esc+"`. -->
<!---->

- For language-specific code completion to work (e.g. `np.` triggering all np functions), I need to open vim with an active venv with the required packages installed.


# Python

## Install `uv`

```{bash}
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Update the below for use with `uv` as I start using it.


```{bash}
mkdir -p ~/.venvs
```

# Virtual environments
# Go to ~/.venvs, and get requirements.tex for each one so I can reproduce on new machine
## todo: configure Jupyter environment
## todo: save all virtualenv configs somewhere so I can share across machines



Notes:

- I follow the advice from [Nobody has time for Python](https://bitecode.substack.com/p/relieving-your-python-packaging-pain) and stick to the basics.

- I install [stable](https://devguide.python.org/versions/) Python versions (i.e. not the latest ones) using the official universal2 installers from [python.org](https://www.python.org/downloads/macos/).

- After downloading and installing, I click `Install Certificates.command` in the finder window to complete the installation.

- I use `venv` to manage virtual environments.

- I create a virtual environment for each project, call it `.venv`, and save it in the project's root directory.

- I select the desired Python version explicitly (e.g. `python3.10 venv .venv`).

- I install stuff with `pip` and only pip, and only ever into a virtual environment.

- To recreate a virtual environment, I create a requirements.txt file (`python -m pip freeze > requirements.txt`) and then recreate the environment with `python -m pip install -r requirements.txt`). 

- I keep small scripts in a project called `sandbox` with its own virtual environment so that I don't need to create a separate virtual environment for each small script I write.

- Virtual environments that are required for specific applications (e.g. nvim, or quarto) are stored in `~/venvs` with an informative name (e.g. `nvim3.10`).

- I don't move virtual environments -- I recreate them instead.

- If I rename a folder that contains a virtual environment, I delete the environment and create a new one.

Benefits:

- It reduces the risk of anything going wrong.

- It fixes venv issues in nvim. When using pyenv, nvim would find mutliple versions of Python in the dedicated host environment. With this approach, it finds a single version.

- While not perfect (see below), the approach works well given my workflow, which is why I stick to it.

Disadvantages:

- I much prefer to install Python version programmaticall via pyenv.

- Python only provides installers for actively supported versions. This means that if I need to install an older version to be compatible with a project I'm working on, I can't install it in this same way.

- I prefer managing virtual envs with pyenv-virtualenv and give them names corresponding to the project.

Overview of virtual environment tools:

- [pyenv](https://github.com/pyenv/pyenv) is a Python version manager.

- [pipenv](https://pipenv.pypa.io/en/latest/) is a dependency manager for
  Python projects. Allows for using pip and virtualenv together.

- [virtualenv](https://github.com/pypa/virtualenv) is a tool to create isolated
  virtual Python environments.

- [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv) is a pyenv
  plugin that allows you to use pyenv to manage virtualenvs.

- [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/)
  provides a set of wrappers to work with virtualenvs.

- [poetry](https://python-poetry.org) is a packaging and dependency manager.


### Running code

- I run all Python commands with the `-m` flag (i.e. `python -m pip install`, `python -m black`, `python -m jupyter notebook`) to be as sure as possible that I use the correct Python version (I have created alias for all of them).

### Jupyter notebooks

- I work with notebooks in VSCode, which solves any issues with kernel management because VSCode just finds the project's virtual environment.

- To use notebooks in a browser, I found Ethan Rosenthal's [approach]](https://www.ethanrosenthal.com/2022/02/01/everything-gets-a-package/) useful.

### Startup script

- Inspired by [this](https://www.bitecode.dev/p/happiness-is-a-good-pythonstartup) post, I use a startup script to automatically load frequently used packages and set some configurations.

- Just like other scripts, the startup script is saved in `.dotfiles/scripts` and symlinked to a destination where Python can find it using `stow` (Python can find it because I set `PYTHONSTARTUP` to the respective path in my `zshrc`).




## Useful tools

```
brew install tldr               # example based documentation
```

- [Figlet](http://www.figlet.org/) creates font banners. To use, after brew install, do something like `figlet -f colossal "Hello world"`. 

- I use `raycast` (`brew install raycast`) as my secondary launcher in addition to spotlight. I access it with `cmd-shift-space`, and mostly use it as a convenient way to access ChatGPT. I export settings and installed extensions from the advanced settings tab and then import it on the new machine.


## Quarto

```{bash}
brew install --cask quarto
```

Notes:  

- For `quarto` autocompletion to work, I need to select the kernel I want to use in the quarto doc, and I need to have the corresponding venv activated when I start nvim.


## Latex

```{bash}
brew install --cask mactex
brew install pandoc
```

## Note taking

- I currently use Apple notes because it is leightweight and syncs seamlessly across all my devices.

- It has two major disadvantages: it requires context switching away from the terminal, which increasingly bothers me, and it doesn't allow for version control.

- I'm constantly tempted to switch to something like Obsidian and have played around with it, but I'd have to pay to sync notes across devices.



## Mac setup

- Remap caps look to control.

- Package management: I use [homebrew](https://brew.sh).

- Window manager: I'm not using any for now, but want to try [Amethyst](https://github.com/ianyh/Amethyst) (`brew install amethyst`).

## Mac applications

```{bash}
brew install --cask \
    appcleaner \            # app uninstaller
    caffeine \              # prevent mac from sleeping
    duckduckgo \            # browser
    flux \                  # screen color adjustment
    google-chrome \         # browser
    rectangle \             # window manager
    skype \                 # video calls
    spotify \               # music
    skim \                  # pdf viewer
    chrome \                # browser
    whatsapp \              # messaging
    visual-studio-code \    # code editor
```



## Acknowledgements

- [thoughtbot](https://thoughtbot.com/upcase) provides a series of useful
  courses on basic programming tools. Their
  [tmux](https://thoughtbot.com/upcase/tmux) course is phenomenal!

- [Chris Toomey](https://github.com/christoomey) produces many of the amazing thoughtbot videos and has inspired me to bring my dotfiles to the next level.

- [engineeringfordatascience.com](https://engineeringfordatascience.com/) has a
  few amazing posts on mac setup for data science.

- [Ethan
  Rosenthal](https://www.ethanrosenthal.com/2022/02/01/everything-gets-a-package/)
  has a useful post on his workflow.

- [Jannik Buhr](https://github.com/jmbuhr) has a top-notch dotfiles setup and vim/tmux/Python workflow, for which he's written the awesome [`quarto-nvim`](https://github.com/quarto-dev/quarto-nvim) plugin. His work was a goldmine for what I was looking for.

- [Christian Chiarulli](https://github.com/ChristianChiarulli/nvim) has an awesome nvim setup from which I have borrowed.

- [Price Hiller](https://gitlab.orion-technologies.io/philler) has inspired me to separate plugin loading and configuration, and provided a great template for my lualine configuration.

- The people at [Rocky Linux](https://docs.rockylinux.org/books/nvchad/), who provide the [NvChad](https://github.com/NvChad/NvChad) setup framework provide useful explanations on a number of plugins and setup steps (including the best documentation of useful Nvim-tree commands I could find).

- [macOS Setup Guide](https://sourabhbajaj.com/mac-setup/) is a great
resource for setting up a mac developmer machine.
