# .dotfiles

## dotfile management

- I manage my dotfiles with [stow](https://alexpearce.me/2016/02/managing-dotfiles-with-stow/), inspired by the setup of [Jannis Buhr](https://github.com/jmbuhr/.dotfiles).

- I store my dotfiles in `~/.dotfiles`.

- To create a symlink for each dotfile to my home directory, I simply run `~/.dotfiles/install`.

- Not all folders in `.dotfiles` contain dotfiles I want to symlink to my home directory. Those who do are added to `$STOW_FOLDERS` in the installation script. Hence, if I add a new folder with dotfiles I want to link, I have to change said script accordingly.


## Terminal setup

- I use zsh as my shell and [oh my zsh](https://ohmyz.sh) for configuration.

- I use the [starship](https://starship.rs) prompt.







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

- [Jannik Buhr](https://github.com/jmbuhr) has a top-notch dotfiles setup and vim/tmux/Python worklow, for which he's written the awesome [`quarto-nvim`](https://github.com/quarto-dev/quarto-nvim) plugin. His work was a goldmine for what I was looking for.
