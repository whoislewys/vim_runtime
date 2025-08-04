""""""""""""""""""""""""""""""
" VIM_PLUG | VIM-PLUG | VIM PLUG
""""""""""""""""""""""""""""""
call plug#begin()

" Prettiness
Plug 'navarasu/onedark.nvim'
Plug 'ericbn/vim-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Utilities
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
Plug 'vim-scripts/mru.vim'
" Plug 'github/copilot.vim'
" TODO: replace nerdtree with vifm
Plug 'scrooloose/nerdtree'
Plug 'ruanyl/vim-gh-line'
Plug 'aserebryakov/vim-todo-lists', {'commit': '5c7f7d5cd49770656c83669da4293a1eaae25913'}" use with `.todo` files
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'wakatime/vim-wakatime'

" Language stuff
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}

" this fails everytime :(: 'do': 'CocInstall coc-tsserver coc-json coc-html coc-css coc-prettier coc-python coc-eslint coc-snippets'
" ALSO for graphql-lsp, do: `npm i -g graphql-language-service-cli`
Plug 'dart-lang/dart-vim-plugin'
Plug 'tomlion/vim-solidity'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'tpope/vim-rails'
Plug 'lifepillar/pgsql.vim'
Plug 'jparise/vim-graphql'
Plug 'mustache/vim-mustache-handlebars'

" Dumb shit
Plug 'johngrib/vim-game-code-break'
Plug 'gbigwood/Clippo'

call plug#end()

""""""""""""""""""""""""""""""

" MISC VIM SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Saves views on leaving buffer, loads on enter
" For me, it's the persisting folds
" https://vi.stackexchange.com/a/13874
augroup AutoSaveGroup
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  " BufHidden for compatibility with `set hidden`
  autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

set viewoptions=folds,cursor
set sessionoptions+=folds " save folds, in addition to default sessionoptions (like saving open tabs)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
" Yeah but it's less badass - me
" set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Persistent clipboard across vim instances
" Pretty sure there is a plugin for it somewhere in this vimrc, but i can't find it easily and im done looking for it lmaooooooooozzzzzzzz
" set clipboard=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab = 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2


" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set number " Show line numbers
set relativenumber " Show relative line numbers (and makes set number show current line number)


"""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Leave cursor where it is after yanking in visual mode
" (By default it will move back to beginning of block)
vmap y ygv<Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clear highlight when <leader><carriage return> is pressed (helpful for clearing search highlight)
nnoremap <leader><CR> :noh<CR>:<backspace>

" Easier navigating between methods
nnoremap gM [m
nnoremap gm ]m

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go to normal mode with <Esc> while in Terminal mode
:tnoremap <Esc> <C-\><C-n>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Persistent undo
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
set background=dark
colorscheme onedark

" Color scheme based on OS default
" let theme = system('defaults read -g AppleInterfaceStyle')
" if theme =~ 'Dark'
"  set background=dark
"  colorscheme one-dark
" else
" set background=light
"  colorscheme solarized
" endif

" Italic comments (come after colorscheme to make sure colorscheme doesn't overwrite it)
highlight Comment cterm=italic gui=italic

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

" Run dartanalyzer on save
" autocmd FileType dart setlocal makeprg=dartanalyzer\ ./
" autocmd FileType python setlocal makeprg=pylint\ --output-format=parseable
" autocmd BufWritePost *.dart silent make! <afile> | silent redraw!


""""""""""""""""""""""""""""""
" PLUGINS CONFIG
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>r :MRU<CR>

""""""""""""""""""""""""""""""
" => FZF 
""""""""""""""""""""""""""""""
set rtp+=~/fzf
set rtp+=~/.fzf
nnoremap <leader>f :FZF<CR>
nnoremap <leader>b :Buffers<cr>

""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'

""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated .node_modules'
set grepprg=rg\ --color=always


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:lightline = {
"      \ 'colorscheme': 'onedark',
"      \ }
"

" NOTE: Getting current function in lightline to update requires coc-settings.json entry: `"coc.preferences.currentFunctionSymbolAutoUpdate": true`
let g:lightline = {
      \ 'colorscheme': 'one', 
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'gitbranch', 'filename', 'cocCurrentFunction', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'cocCurrentFunction': 'CocCurrentFunction'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>:Limelight!!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=1
set updatetime=100
nnoremap <silent> <leader>d :GitGutterToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Hexokinase (Show color squares next to hex & rgb colors)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable for all filetypes
let g:Hexokinase_ftAutoload = ['*']

" Show color square in the left gutter (aka 'sign_column')
let g:Hexokinase_highlighters = ['sign_column']

" To make it almost live
" This may cause some lag if there are a lot of colours in the file
let g:Hexokinase_refreshEvents = ['BufWritePost']

" Explicitly enable all builtin patterns
let g:Hexokinase_optInPatterns = ['full_hex', 'triple_hex', 'rgb', 'rgba', 'colour_names']

" Turn on termguicolors (used for Hexokinase to display color block next to color codes)
set termguicolors

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc (intellisense for vim)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Add coc statusline
set statusline^=%{coc#status()}

" Use <tab> and <S-tab> to navigate completion list:
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  " Insert <tab> when previous text is space, refresh completion if not.
  inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1):
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"


" coc-yank extension
" install with: :CocInstall coc-yank
" -A means auto preview, and --normal means open list on normal mode.
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr> 

" List Code actions (such as 'wrap with widget' for flutter)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ca  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <Alt-CR> to trigger completion
inoremap <silent><expr> <M-CR> coc#refresh()
" Trigger argument suggestions
inoremap <silent><C-P> <C-\><C-O>:call CocActionAsync('showSignatureHelp')<cr>

" Use <CR> to confirm completion, use: >
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocActionAsync('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Add `:Format` command for formatting
command! -nargs=0 Format :call CocAction('format')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')


" coc-prettier
" use :Prettier to format current buffer.
" or <leader>fmt
" config overrides (for example, preferring single quotes) should be done via project level files only, see here https://prettier.io/docs/en/configuration.html
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>fmt <Plug>(coc-format-selected)
nmap <leader>fmt  <Plug>(coc-format-selected)

" coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Make <tab> jump to next snippet arg
let g:coc_snippet_next = '<tab>'

" Determine the path to Python interpreter dynamically
" (prevents coc from causing nvim to hang when searching for python)
let python_executable = substitute(system('which -a python'), '\n', '', '')
let python3_executable = substitute(system('which -a python3'), '\n', '', '')

" Set the Python interpreter paths in Vim configuration
if !empty(python_executable)
    let g:python_host_prog = python_executable
endif

if !empty(python3_executable)
    let g:python3_host_prog = python3_executable
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Limelight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sometimes Limelight can't calculate dimming color for current colorscheme
let g:limelight_conceal_ctermfg = 220
let g:limelight_conceal_guifg = '#777777'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

nmap <silent> <leader>l :Limelight!!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set diffopt+=vertical

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-markdown-preview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

nmap <leader>m :MarkdownPreview<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim presence (discord presence)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General options
let g:presence_auto_update         = 1 " Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
let g:presence_neovim_image_text   = "The One True Text Editor" " Text displayed when hovered over the Neovim image
let g:presence_main_image          = "neovim" " Main image display (either 'neovim' | 'file' )
let g:presence_client_id           = "793271441293967371" " Use your own Discord application client id (not recommended)
let g:presence_log_level           = "error" " Log messages at or above this level (one of the following: 'debug' | 'info' | 'warn' | 'error')
let g:presence_debounce_timeout    = 10 " Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
let g:presence_enable_line_number  = 1 " Displays the current line number instead of the current project
let g:presence_blacklist           = [] " A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
let g:presence_buttons             = 1 " Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
let g:presence_file_assets         = {} " Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
let g:presence_show_time           = 1 " Show the timer

" Rich Presence text options
let g:presence_editing_text        = "Editing [redacted]" " Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
let g:presence_file_explorer_text  = "Browsing %s" " Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
let g:presence_git_commit_text     = "Committing changes" " Format string rendered when committing changes in git (either string or function(filename: string): string)
let g:presence_plugin_manager_text = "Managing plugins" " Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
let g:presence_reading_text        = "Reading %s" " Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
let g:presence_workspace_text      = "Working on %s" " Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
let g:presence_line_number_text    = "Line %s out of %s" " Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => github copilot
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tpope suggested mapping:
" imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
" let g:copilot_no_tab_map = v:true
" let g:copilot_node_command = '~/.asdf/installs/nodejs/18.12.1/bin/node'

