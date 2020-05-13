"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Colorscheme
set background=dark
colorscheme onedark

" Italic comments (come after colorscheme to make sure colorscheme doesn't overwrite it)
highlight Comment cterm=italic gui=italic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Persistent undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Terminal mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go to normal mode with esc while in terminal mode
:tnoremap <Esc> <C-\><C-n>
