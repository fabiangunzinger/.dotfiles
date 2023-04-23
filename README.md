# .dotfiles

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


## nvim setup

- I use [EditorConfig](https://editorconfig.org) for coding style configuration across projects. For my personal use, I store the default configuration in `~/.editorconfig`. Whenever I need different configs for a project, I add an editorconfig file with `root = true` in the project directory. (Nvim 0.9 has EditorConfig built in, so no plugin is needed for this.)

- I use `lazy.nvim` as my package manager.

- For `quarto` autocompletion to work, I need to select the kernel I want to use in the quarto doc, and I need to have the corresponding venv activated when I start nvim.

## Python setup 

- I manage Python versions with `pyenv`, virtual envs with `pyenv-virtualenvs`, and install packages with `pip`. I don't use Conda or Poetry because I find them too clunky, even though they both have useful features.

- I use `base` virtual environment as a Python host for nvim and Quarto, and also to run Jupyter from.


<!-- ## zsh plugins -->

<!-- - I use FZF as a file fuzzy finder. I usually use `**<tab>` or `<ctrl-T>` to search files in current directory (e.g. `vi **<tab>`). -->

<!-- - I use `zsh-z` to quickly navigate to frequently used directories (e.g. `z do` -->
<!--   gets me to `~/dev/projects/dotfiles` from anywhere). Combined with the -->
<!--   in-built fuzzy directory completion of zsh, and the fzt plugin, this makes -->
<!--   navigation extremely quick. -->


## Useful tools

- I use [`bat`](https://github.com/sharkdp/bat) (an improved version of cat) to
  quickly view files.



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
