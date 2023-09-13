""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h')."/.."
call pathogen#infect(s:vim_runtime.'/vim_plug_plugins/{}')
call pathogen#helptags()

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
nmap <leader>ca  <Plug>(coc-codeaction)w
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
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

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
" => dashboard-nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set fuzzy search to fzf.vim, instead of default of clap (uses vim-clap)
let g:dashboard_default_executive ='fzf'


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

