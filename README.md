#r .dotfiles

## dotfile management

- I manage my dotfiles with [stow](https://alexpearce.me/2016/02/managing-dotfiles-with-stow/), inspired by the setup of [Jannis Buhr](https://github.com/jmbuhr/.dotfiles).

- I store my dotfiles in `~/.dotfiles`.

- To create a symlink for each dotfile to my home directory, I simply run `~/.dotfiles/install`.

- Not all folders in `.dotfiles` contain dotfiles I want to symlink to my home directory. Those who do are added to `$STOW_FOLDERS` in the installation script. Hence, if I add a new folder with dotfiles I want to link, I have to change said script accordingly.

## Mac setup

- I use [homebrew](https://brew.sh) for package management.

- I use [Amethyst](https://github.com/ianyh/Amethyst) for window management.


## Terminal setup

- I use zsh as my shell and [oh my zsh](https://ohmyz.sh) for configuration.

- I use the [starship](https://starship.rs) prompt.

- I use `zsh-z` to quickly navigate to frequently used directories (e.g. `z do`
  gets me to `~/.dotfiles` from anywhere). Combined with the
  in-built fuzzy directory completion of zsh, and the fzf plugin, this makes
  navigation extremely quick.

- I use [`bat`](https://github.com/sharkdp/bat) (an improved version of cat) to
  quickly view files.

- I follow [this](https://www.reddit.com/r/vim/comments/u1kppk/comment/i4ecygu/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button) suggestion and map the meta key to my left option key, so I can use `M` key bindings in vim. I do this by setting the mapping in iTerm: `ITerm2 -> Preferences -> Profiles -> keys -> General -> Choose "left Option key " as "Esc+"`.


## Python setup 

- I follow the advice from [Nobody has time for Python](https://bitecode.substack.com/p/relieving-your-python-packaging-pain).

Installation:

- I install [stable](https://devguide.python.org/versions/) Python versions (i.e. not the latest ones) using the official installers from [python.org](https://www.python.org/downloads/macos/) (the universal2 installers, to ensure compatibility with Apple silicon.

- After downloading and installing, I click `Install Certificates.command` in the finder window that opens to complete the installation.

Virtual environments:

- I use `venv` to manage virtual environments.

- I create a virtual environment for each project, call it `.venv`, and save it
  in the project's root directory.

- I select the desired Python version explicitly (e.g. `python3.10 venv .venv`).

- I install stuff with `pip` and only pip, and only ever into a virtual environment.

- To recreate a virtual environment, I create a requirements.txt file (`python -m pip freeze > requirements.txt`) and then recreate the environment with `python -m pip install -r requirements.txt`). 

- I keep small scripts in a project called `sandbox` with its own virtual environment so that I don't need to create a separate virtual environment for each small script I write.

- Virtual environments that are requried for specific applications (e.g. nvim, or quarto) are stored in my home directory with an informative name (e.g. `nvim3.10`).

Running code:

- I run all Python commands with the `-m` flag (i.e. `python -m pip install`, `python -m black`, `python -m jupyter notebook` to be as sure as possible that I use the correct Python version).

Remember:

- Don't move a virtual environment -- recreate it instead.

- Don't rename a directory containing a virtual environment -- recreate the environment in a new directory with the desired name and delete the old one.


## nvim

### Installation

- To avoid unwanted updates from core neovim and plugins, I install neovim from source and pin plugins to specific versions. I only update when I have a specific reason to do so.

- To install neovim from source, I followed [these](https://github.com/neovim/neovim/wiki/Building-Neovim) instructions. I clone the neovim repo into my home directory. After installing the dependencies via homebrew, the commands are the following:

```
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
```

- To uninstall neovim, I'd use (from [here](https://www.chrisatmachine.com/posts/00-install-neovim)):

```
sudo rm /usr/local/bin/nvim
sudo rm -r /usr/local/share/nvim/
```









- I use [EditorConfig](https://editorconfig.org) for coding style configuration across projects. For my personal use, I store the default configuration in `~/.editorconfig`. Whenever I need different configs for a project, I add an editorconfig file with `root = true` in the project directory. (Nvim 0.9 has EditorConfig built in, so no plugin is needed for this.)

- I use `lazy.nvim` as my package manager.

- For `quarto` autocompletion to work, I need to select the kernel I want to use in the quarto doc, and I need to have the corresponding venv activated when I start nvim.

## Useful stuff

- [Figlet](http://www.figlet.org/) creates font banners. To use, after brew install, do something like `figlet -f colossal "Hello world"`. 


## Quarto setup

- Install Quarto on mac `brew install -cask quarto`.

- 



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
