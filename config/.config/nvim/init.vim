" --- General configuration ---
set confirm " confirmation on failed saves
set number " line numbers
set relativenumber " numbers displayed relatively
set laststatus=2 " always display the status line
set ruler " cursor position
set cc=91
set scrolloff=2 " start scrolling before cursor reaches last line
set smarttab
set list
set listchars=tab:>-
syntax on " syntax highlighting
set wrap!  " turn off word wrap
set mouse=a " mouse everywhere
set directory^=$HOME/.config/nvim/swap// " place swp files in central folder
augroup stripwhitespace
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e " remove trailing whitespace when saving files
augroup END
set backspace=indent,eol,start " allow deleting past insert, line breaks and autoindent
"set path+=/usr/local/include,include/**,src/**,modules/**/include
set path+=/usr/local/include,include/**,src/**
set shortmess=a
set exrc " enable per-directory nvim/init.vim files
set secure " disable unsafe commands in local nvim/init.vim files
set autoread " reload changed files
set nofoldenable " Don't fold by default"
set clipboard=unnamed " Use the system clipboard with default register
set grepprg=rg\ --vimgrep\ $*
set switchbuf=usetab " Jump to already open buffers (in any tab) when switching buffers
set matchpairs+=<:>


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
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'gmoe/vim-faust', {'for': 'faust'}
Plug 'jceb/vim-orgmode', {'for': 'org'}
Plug 'kelan/gyp.vim', {'for': 'gyp'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'sheerun/vim-polyglot'
Plug 'tell-k/vim-autopep8', {'for': 'python'}
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


" Code navigation + completion
Plug 'honza/vim-snippets'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neomake/neomake'
Plug 'skywind3000/asyncrun.vim'
Plug 'rizzatti/dash.vim'

let g:dash_map = {
      \ 'cpp' : ['cpp', 'boost', 'juce', 'dsp'],
      \ }

let g:neomake_open_list = 2

" Colors
Plug 'altercation/vim-colors-solarized'


" Vim Extensions
Plug 'junegunn/goyo.vim'
Plug 'ktonga/vim-follow-my-lead'
Plug 'mhinz/vim-startify'
Plug 'reedes/vim-pencil'
Plug 'suan/vim-instant-markdown'
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
set background=light
colorscheme solarized


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
set completeopt=menu,menuone,longest " Complete options (disable preview scratch window)
set pumheight=15 " Limit popup menu height


" --- 2 space tabs by default ---
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

augroup filetypes
  autocmd!

  " Some languages should have 4 space tabs
  autocmd FileType gyp,rust setlocal shiftwidth=4 softtabstop=4 tabstop=4

  autocmd FileType rust compiler cargo
augroup END

augroup python
  autocmd!
  " PEP8 formatting for python
  autocmd FileType python setlocal
        \ tabstop=4
        \ softtabstop=4
        \ shiftwidth=4
        \ textwidth=79
        \ cc=80
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

" From: http://vim.wikia.com/wiki/Automatically_open_the_quickfix_window_on_:make
" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
" Note: The quickfix window will also automatically close in case the quickfix
" list becomes empty. If instead you always want to open the quickfix window,
" replace the cwindow with copen.
"autocmd QuickFixCmdPost [^l]* nested botright copen
"autocmd QuickFixCmdPost    l* nested botright lwindow
"autocmd QuickFixCmdPost * botright copen 8

" word wrap in quickfix
augroup quickfix
  autocmd!
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
  let makeprg_old = &l:makeprg
  try
    set makeprg=$MAKEPRG
    Neomake!
  finally
    let &l:makeprg = makeprg_old
    redraw!
  endtry
endfunction

let $TESTPRG="make -j8 && make test"
function! DoTest()
  let makeprg_old = &l:makeprg
  try
    set makeprg=$TESTPRG
    Neomake!
  finally
    let &l:makeprg = makeprg_old
    redraw!
  endtry
endfunction



" --- Leader ---
" set leader to space
let mapleader = "\<Space>"
" ,1 - write all and make
nmap <leader>1 ;wa<CR>;call DoMake()<CR>
" ,! - make test
nmap <leader>! ;wa<CR>;call DoTest()<CR>
" ,2 -  previous error
nmap <leader>2 ;wa<CR>;lprev<CR>
" ,3 - next error
nmap <leader>3 ;wa<CR>;lnext<CR>
" ,4 - list errors
nmap <leader>4 ;cl<CR>

" ,5 - next location
nmap <leader>5 ;wa<CR>;lp<CR>
" ,6 - next location
nmap <leader>6 ;wa<CR>;ln<CR>


" 0 - stop async job
nmap <leader>0 ;AsyncStop<CR>

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

" s - vertical split
nmap <leader>s ;vsp<cr>

" p - reformat paragraph
nmap <leader>p gqip<cr>

" Q - open quickfix, scroll to end, and return focus
nmap <leader>Q ;botright copen<cr>G<c-w><c-p>

" w - save all
nmap <leader>w ;wa<cr>

" t - new tab
nmap <leader>t ;tabnew<cr>

" x - close tab
nmap <leader>x ;tabclose<cr>

" c - auto format
nmap <leader>c ;Neoformat<cr>

" d - insert date
nmap <leader>d a<c-r>=strftime('%Y-%m-%d')<cr><esc>

" D - insert timestamp
nmap <leader>D a<c-r>=strftime('%Y-%m-%d %H:%M')<cr><esc>

" T - insert empty TODO
nmap <leader>T i- [ ] <esc>hhxla

" g - open gitv
nmap <leader>g ;Gitv<cr>

" h - search for current word in Dash according to filetype
nmap <leader>h <Plug>DashSearch

" H - search for current word in Dash, globally
nmap <leader>H <Plug>DashGlobalSearch

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
augroup reload_nvim_init " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


" --- Highlighting ---
au BufNewFile,BufRead *.h,*.hpp,*.cpp,*.h++ set syntax=cpp

" GLSL highlighting
command! SetGLSLFileType call SetGLSLFileType()
function! SetGLSLFileType()
  for item in getline(1,10)
    if item =~ "#version 400"
      execute ':set filetype=glsl400'
      break
    endif
    if item =~ "#version 330"
      execute ':set filetype=glsl330'
      break
    endif
    execute ':set filetype=glsl'
  endfor
endfunction
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl SetGLSLFileType

" JSON highlighting
au BufNewFile,BufRead *.json set filetype=json

" Objective c++ highlighting for .mm files
au BufNewFile,BufRead *.mm set filetype=objcpp

" Scala worksheets
au BufNewFile,BufRead *.sc set filetype=scala

