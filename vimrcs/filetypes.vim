""""""""""""""""""""""""""""""
" => Python
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self
" something was setting this to 4 and 8, wtf? some plugin somewhere probably
au FileType python set shiftwidth=2
au FileType python set tabstop=2
au FileType python set softtabstop=2

""""""""""""""""""""""""""""""
" => JavaScript
"""""""""""""""""""""""""""""""
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f // --- PH<esc>FP2xi

""""""""""""""""""""""""""""""
" => Shell
""""""""""""""""""""""""""""""
if exists('$TMUX') 
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color 
    endif
endif

""""""""""""""""""""""""""""""
" => Dart
""""""""""""""""""""""""""""""
" actual language server is being set up in ~/.config/nvim/coc-settings.json
" For dart-vim-plugin
let dart_html_in_string=v:true
let dart_corelib_highlight=v:false
let dart_style_guide = 2
let dart_format_on_save = 0
