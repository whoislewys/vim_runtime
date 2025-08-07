# H1

This is my vim config

There are many like it, but this one is mine

> It has been blessed by Terry A. Davis himself

## Install
1. Make sure you have neovim
1. Make sure you have `Go` and `make` for `vim-hexokinase` (plugin that shows color squares when detecting color name/code in a buffer)
1. `git clone git@github.com:whoislewys/vim_runtime ~/.config/nvim`
1. Open vim and do `:PlugInstall` to install all plugins
1. You're done 😀

## Notes
Intellisense is provided by `coc.nvim`

Issues I've run into with it:

* Don't install Flutter from snap. Install it from git. Otherwise, coc-flutter might break (my experience on a couple of ubuntu mahcines, versions 18, and 20 respectively)

* For Python analysis, do `:CocCommand` and fuzzy search

## How to uninstall
* `rm -r ~/.config/nvim`

__

*bottom text*
