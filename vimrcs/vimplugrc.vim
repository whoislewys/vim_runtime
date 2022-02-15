if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vim_runtime/vimrcs/vimplugrc.vim
endif

call plug#begin('~/.config/nvim/.vim_runtime/vim_plug_plugins')

" Prettiness
Plug 'whoislewys/onedark.vim'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'RRethy/vim-hexokinase', {'do': 'make hexokinase'}
Plug 'itchyny/lightline.vim'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/tagbar'
Plug 'morhetz/gruvbox'

" Utilities
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
Plug 'vim-scripts/mru.vim'
Plug 'scrooloose/nerdtree'
Plug 'cohama/lexima.vim'
Plug 'ruanyl/vim-gh-line'
Plug 'aserebryakov/vim-todo-lists', {'commit': '5c7f7d5cd49770656c83669da4293a1eaae25913'}" use with `.todo` files
Plug 'jceb/vim-orgmode' " use with `.org` files
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}
Plug 'dense-analysis/ale'
" Plug 'wakatime/vim-wakatime'

" Language stuff
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
" Plug 'git@github.com:neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
" this fails everytime :(: 'do': 'CocInstall coc-tsserver coc-json coc-html coc-css coc-prettier coc-python coc-eslint'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'git@github.com:MaxMEllon/vim-jsx-pretty'
" Plug 'git@github.com:HerringtonDarkholme/yats.vim'
Plug 'fatih/vim-go'
Plug 'aklt/plantuml-syntax'
Plug 'scrooloose/vim-slumlord' " inline plantuml preview
Plug 'tpope/vim-rails'
Plug 'lifepillar/pgsql.vim'
" Plug 'luisgomez-wk/frugal.vim'
Plug 'TovarishFin/vim-solidity'

" Dumb shit
Plug 'johngrib/vim-game-code-break'
Plug 'gbigwood/Clippo'
" Plug 'glepnir/dashboard-nvim'

call plug#end()
