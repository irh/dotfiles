" --- General configuration ---
set autoread " reload changed files
set backspace=indent,eol,start " allow deleting past insert, line breaks and autoindent
set cc=91
set clipboard=unnamed " Use the system clipboard with default register
set confirm " confirmation on failed saves
set directory^=$HOME/.config/nvim/swap// " place swp files in central folder
set exrc " enable per-directory nvim/init.vim files
set grepprg=rg\ --vimgrep\ $*
set hidden " Enable hidden buffers
set laststatus=2 " always display the status line
set list
set listchars=tab:>-
set matchpairs+=<:>
set mouse=a " mouse everywhere
set nofoldenable " Don't fold by default"
set number " line numbers
set path+=/usr/local/include,include/**,src/**
set relativenumber " numbers displayed relatively
set ruler " cursor position
set scrolloff=2 " start scrolling before cursor reaches last line
set secure " disable unsafe commands in local nvim/init.vim files
set shortmess=a
set signcolumn=yes
set smarttab
set switchbuf=usetab " Jump to already open buffers (in any tab) when switching buffers
set wrap!  " turn off word wrap

syntax on " syntax highlighting
augroup stripwhitespace
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e " remove trailing whitespace when saving files
augroup END


" --- Plugins ---

call plug#begin('~/.vim/plugged')


" Motion
Plug 'christoomey/vim-sort-motion'
Plug 'Lokaltog/vim-easymotion'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/Auto-Pairs'
Plug 'vim-scripts/ConflictMotions'
Plug 'vim-scripts/CountJump'
Plug 'wellle/targets.vim'

let g:sort_motion_flags = "ui"


" Text formatting
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'sbdchd/neoformat'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/closetag.vim'

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx,*.js"
au FileType cpp setlocal commentstring=//\ %s
let g:neoformat_c_clangformat = {
  \ 'exe': 'clang-format',
  \ 'args': ['-style=file'],
  \ 'stdin': 1,
  \ }
let g:neoformat_cpp_clangformat = {
  \ 'exe': 'clang-format',
  \ 'args': ['-style=file'],
  \ 'stdin': 1,
  \ }

let g:neoformat_python_black = {
  \ 'exe': 'black',
  \ 'stdin': 1,
  \ 'args': ['--fast', '--line-length', '90', '-q', '-'],
  \ }


" Navigation
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Valloric/ListToggle'
Plug 'vim-scripts/a.vim'

let g:alternateNoDefaultAlternate = 1
let g:alternateExtensions_hpp = "ipp,cpp"
let g:alternateExtensions_cpp = "h,hh,H,HPP,hpp,ipp"
let g:alternateExtensions_ipp = "hpp,cpp"
let g:alternateSearchPath = 'wdr:include,wdr:src,sfr:../source,sfr:../src,sfr:../include,sfr:../inc'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

let g:ackprg = 'rg --vimgrep'
nnoremap <c-p> :GFiles<cr>


" Git
Plug 'airblade/vim-gitgutter'
Plug 'dbakker/vim-projectroot'
Plug 'gregsexton/gitv' " requires vim-fugitive
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

let g:gitgutter_sign_added = '·'
let g:gitgutter_sign_modified = '·'
let g:gitgutter_sign_removed = '·'
let g:gitgutter_sign_modified_removed = '·'


" Language support
Plug 'bumaociyuan/vim-swift', {'for': 'swift'}
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'gmoe/vim-faust', {'for': 'faust'}
Plug 'jceb/vim-orgmode', {'for': 'org'}
Plug 'kelan/gyp.vim', {'for': 'gyp'}
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'tell-k/vim-autopep8', {'for': 'python'}
Plug 'tikhomirov/vim-glsl'
Plug 'valloric/MatchTagAlways', {'for': ['html', 'javascript.jsx']}
Plug 'vim-scripts/indentpython.vim', {'for': 'python'}

let g:jsx_ext_required = 0
let g:mta_filetypes = {
      \ 'html' : 1,
      \ 'xhtml' : 1,
      \ 'xml' : 1,
      \ 'jinja' : 1,
      \ 'javascript.jsx' : 1,
      \}
let g:vim_markdown_initial_foldlevel=100
let g:markdown_enable_insert_mode_leader_mappings = 1


" Code navigation + completion
Plug 'honza/vim-snippets'
Plug 'ludovicchabant/vim-gutentags', {'for': ['cpp', 'rust']}
Plug 'neomake/neomake'
Plug 'skywind3000/asyncrun.vim'
Plug 'rizzatti/dash.vim'

let g:dash_map = {
      \ 'cpp' : ['cpp', 'boost', 'juce', 'dsp'],
      \ }

let g:neomake_error_sign = {'text': '❌', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {
  \   'text': '❓',
  \   'texthl': 'NeomakeWarningSign',
  \ }
let g:neomake_message_sign = {
  \   'text': '➤',
  \   'texthl': 'NeomakeMessageSign',
  \ }
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'luochen1990/rainbow'

let g:rainbow_active = 1
let g:rainbow_conf = {
    \    'guifgs': ['grey ', 'darkgrey'],
    \    'ctermfgs': ['grey ', 'darkgrey'],
    \    'operators': '_,_',
    \    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \    'separately': {
    \        '*': {},
    \        'tex': {
    \            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \        },
    \        'lisp': {
    \            'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \        },
    \        'vim': {
    \            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \        },
    \        'html': {
    \            'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \        },
    \        'css': 0,
    \    }
    \}


" Vim Extensions
Plug 'junegunn/goyo.vim'
Plug 'ktonga/vim-follow-my-lead'
Plug 'mhinz/vim-startify'
Plug 'reedes/vim-pencil'
Plug 'vimwiki/vimwiki'

let g:startify_change_to_dir = 0
let g:vimwiki_list = [{'path': '~/Dropbox/Docs/vimwiki'}]

" --- End of plugins ---
call plug#end()

" Bail out if plugins are not installed
if empty(glob('~/.vim/plugged'))
  finish
endif


" --- Color scheme ---
colorscheme solarized
set background=dark
let g:airline_theme="solarized"
let g:airline_solarized_bg='dark'



" --- Status line ---
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %f   " file
set statusline+=\ %m   " modified
set statusline+=%=     " separator
set statusline+=%#CursorColumn#
set statusline+=\ %y  " file type
set statusline+=\ %#PmenuSel#
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ "



" --- 80 column limit for git commit messages and text files
augroup gitsetup
  autocmd!
  autocmd FileType gitcommit,markdown set textwidth=80
  autocmd FileType gitcommit,markdown setlocal colorcolumn=81
augroup END


" --- background colour of signs gutter
highlight clear SignColumn

" --- highlight colour for matching parentheses
hi MatchParen ctermbg=blue ctermfg=white guibg=yellow


" --- Command completion ---
set wildmenu
set wildmode=longest,list
set wildignore+=.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.vcproj,*.dll,*.zip
set wildignorecase


" --- 2 space tabs by default ---
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

augroup filetypes
  autocmd!

  " Some languages should have 4 space tabs
  autocmd FileType gyp,rust,typescript setlocal shiftwidth=4 softtabstop=4 tabstop=4

  autocmd FileType rust compiler cargo
  autocmd FileType rust setlocal cc=101
augroup END

augroup python
  autocmd!
  " PEP8 formatting for python
  autocmd FileType python setlocal
        \ tabstop=4
        \ softtabstop=4
        \ shiftwidth=4
        \ textwidth=89
        \ cc=90
        \ autoindent
        \ fileformat=unix
        \ encoding=utf-8
augroup END
let python_highlight_all=1


" --- Search options ---
set incsearch
set ignorecase
set smartcase
set hlsearch " highlight search results


" --- Quickfix ---

augroup quickfix
  autocmd!

  autocmd QuickFixCmdPost [^l]* nested botright copen
  autocmd QuickFixCmdPost [^l]* nested cbottom | wincmd p

  autocmd FileType qf
        \ setlocal wrap |
        \ setlocal linebreak
augroup END

" --- Key mappings ---

" map ctrl+h/l to tab next/prev
nnoremap <C-h> :tabprev<CR>
nnoremap <C-l> :tabnext<CR>
" switch colon and semi-colon
noremap : ;
noremap ; :

" move lines up/down
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv"


" --- Terminal ---
:tnoremap <Esc> <C-\><C-n>

" --- Use Alt+{h,j,k,l} to navigate windows
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l


" --- Make / test ---

let $MAKEPRG="make -j8"
function! DoMake()
  cexpr [] " clear quickfix window
  let s:makeprg_old = &l:makeprg
  try
    set makeprg=$MAKEPRG
    call neomake#config#set('maker_defaults.buffer_output', 0)
    Neomake!
  finally
    let &l:makeprg = s:makeprg_old
  endtry
endfunction

let $TESTPRG="make -j8 && make test"
function! DoTest()
  cexpr [] " clear quickfix window
  let s:makeprg_old = &l:makeprg
  try
    set makeprg=$TESTPRG
    call neomake#config#set('maker_defaults.buffer_output', 0)
    Neomake!
  finally
    let &l:makeprg = s:makeprg_old
  endtry
endfunction

function! DoNeoformat()
  let s:current_dir = getcwd()
  echo $current_dir
  try
    " set the window's working directory to its file's location,
    " so that clang-format can correctly recurse the parent folders to find a
    " .clang-format file
    lcd %:p:h
    Neoformat
  finally
    " put the window's working directory to its original location
    execute 'lcd' fnameescape(s:current_dir)
  endtry
endfunction

" Wrappers for cnext et al to make them wrap
command! Cnext try | cnext | catch | cfirst | catch | endtry
command! Cprev try | cprev | catch | clast | catch | endtry

command! Lnext try | lnext | catch | lfirst | catch | endtry
command! Lprev try | lprev | catch | llast | catch | endtry

cabbrev cnext Cnext
cabbrev cprev Cprev
cabbrev lnext Lnext
cabbrev lprev Lprev


" --- Function Keys ---
nmap <F15> ;wa<CR>;call DoTest()<CR>
nmap <F16> ;wa<CR>;call DoMake()<CR>
nmap <F18> ;
nmap <F19> ;wa<CR>;cnext<CR>
nmap <F20> ;wa<CR>;cprev<CR>


" --- Leader ---
" set leader to space
let mapleader = "\<Space>"
" ,Tab - write all and build for Rust
nmap <leader><Tab> ;wa<CR>;Neomake! cargo<CR>
" ,1 - write all and make
nmap <leader>1 ;wa<CR>;call DoMake()<CR>
" ,! - make test
nmap <leader>! ;wa<CR>;call DoTest()<CR>
" ,2 -  previous error
nmap <leader>2 ;wa<CR>;cprev<CR>
" ,3 - next error
nmap <leader>3 ;wa<CR>;cnext<CR>
" ,4 - list errors
nmap <leader>4 ;cl<CR>

" ,5 - next location
nmap <leader>5 ;wa<CR>;lp<CR>
" ,6 - next location
nmap <leader>6 ;wa<CR>;ln<CR>


" 0 - stop async job
nmap <leader>0 ;NeomakeCancelJobs<CR>

" k - fzf ctags
nmap <leader>k ;Tags<cr>

" j - jump to tag
nmap <leader>j <C-]>
" J - jump to previous tag
nmap <leader>J <C-t>

" n - toggle NERDTree
nmap <leader>n ;NERDTreeToggle<cr>
" N - find current buffer in NERDTree
nmap <leader>N ;NERDTreeFind<cr>

" a - switch to counterpart
nmap <leader>a ;A<cr>

" s - save all
nmap <leader>s ;wa<cr>

" S - vertical split
nmap <leader>S ;vsp<cr>

" p - reformat paragraph
nmap <leader>p gqip<cr>

" Q - open quickfix, scroll to end, and return focus
nmap <leader>Q ;copen<cr>;cbottom<cr><c-w><c-p>

" t - new tab
nmap <leader>t ;tabnew<cr>

" x - close tab
nmap <leader>x ;tabclose<cr>

" c - auto format
nmap <leader>c ;call DoNeoformat()<cr>

" d - insert date
nmap <leader>d a<c-r>=strftime('%Y-%m-%d')<cr><esc>

" D - insert timestamp
nmap <leader>D a<c-r>=strftime('%Y-%m-%d %H:%M')<cr><esc>

" T - insert empty TODO, ensure correct formatting and enter insert via append
nmap <leader>T i- [ ] <esc>hhxla

" g - open gitv
nmap <leader>g ;Gitv<cr>

" h - search for current word in Dash according to filetype
nmap <leader>h <Plug>DashSearch

" H - search for current word in Dash, globally
nmap <leader>H <Plug>DashGlobalSearch

" m - enter Goyo mode with PencilSoft
nmap <leader>m ;Goyo<cr>;PencilSoft<cr>

" M - open a new markdown buffer and enter Goyo mode with PencilSoft
nmap <leader>M ;set filetype=markdown<cr><leader>m

" Unmap insert mode mappings from a.vim
augroup unmap-a-vim
  autocmd!
  autocmd VimEnter * iunmap <leader>ih
  autocmd VimEnter * iunmap <leader>is
  autocmd VimEnter * iunmap <leader>ihn
augroup END


" edit nvim/init.vim~
if has("unix") && strlen($MYVIMRC) < 1
  let $MYVIMRC=$HOME . '/.config/nvim/init.vim'
endif
nmap <leader>v ;edit $MYVIMRC<CR>

" --- Auto reload nvim/init.vim ---
augroup reload_nvim_init
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

