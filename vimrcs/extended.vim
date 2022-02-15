"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF (only works on mac)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: make this work without being in extended.vim
set rtp+=~/.fzf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: make the colorscheme able to be applied in basic.vim
" Colorscheme
set background=dark
colorscheme onedark

" Italic comments (come after colorscheme to make sure colorscheme doesn't overwrite it)
highlight Comment cterm=italic gui=italic
