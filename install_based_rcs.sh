#!/bin/sh
set -e

cd ~/.config

echo 'set runtimepath+=~/.config/nvim/.vim_runtime
let &packpath=&runtimepath

source ~/.config/nvim/.vim_runtime/vimrcs/basic.vim
source ~/.config/nvim/.vim_runtime/vimrcs/extended.vim
source ~/.config/nvim/.vim_runtime/vimrcs/filetypes.vim
source ~/.config/nvim/.vim_runtime/vimrcs/plugins_config.vim
source ~/.config/nvim/.vim_runtime/vimrcs/vimplugrc.vim
' > ~/.config/nvim/init.vim

# install onedark colorscheme
# mkdir -p ~/.config/nvim/colors
# cp ~/.config/nvim/.vim_runtime/vim_plug_plugins/onedark.vim/colors/onedark.vim ~/.config/nvim/colors

echo "Installed the whoislewys extremely based Vim configuration successfully! :)"
