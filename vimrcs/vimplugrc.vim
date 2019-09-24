if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vim_runtime/vimrcs/vimplugrc.vim
endif

call plug#begin('~/.vim_runtime/vim_plug_plugins')

Plug 'git@github.com:yuttie/comfortable-motion.vim.git'
Plug 'dart-lang/dart-vim-plugin'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/mru.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'amix/vim-zenroom2'
Plug 'git@github.com:HerringtonDarkholme/yats.vim'
Plug 'git@github.com:whoislewys/onedark.vim'
Plug 'git@github.com:johngrib/vim-game-code-break'
Plug 'git@github.com:davidhalter/jedi-vim'
Plug 'git@github.com:MaxMEllon/vim-jsx-pretty'
Plug 'git@github.com:junegunn/fzf.vim.git'
Plug 'git@github.com:junegunn/limelight.vim'
Plug 'git@github.com:dart-lang/dart-vim-plugin.git'
Plug 'git@github.com:neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'git@github.com:cohama/lexima.vim'
Plug 'git@github.com:machakann/vim-highlightedyank.git'
Plug 'git@github.com:RRethy/vim-hexokinase', {'do': 'make hexokinase'}
Plug 'git@github.com:raghur/vim-ghost'

call plug#end()
