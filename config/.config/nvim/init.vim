" Load .nvimrc files from $HOME to current directory
" From https://vim.fandom.com/wiki/Source_vimrc_and_use_tags_in_a_parent_directory
let local_vimrc = ".nvimrc"
let local_tags = "tags"
let local_path = "/"
let current_path = getcwd()
" If the current path is a child of $HOME directory, start from $HOME
if current_path =~ $HOME
    let local_path = $HOME . local_path
    let current_path = substitute(current_path, $HOME, '', "g")
endif
let path_parts = split(current_path, "/")
for path_part in path_parts
    let local_path = local_path . path_part . "/"
    if filereadable(local_path . local_vimrc)
        exe ":so " . local_path . local_vimrc
    endif
endfor
unlet local_vimrc local_tags local_path current_path path_parts

" --- General configuration ---
set autoread " reload changed files
set backspace=indent,eol,start " allow deleting past insert, line breaks and autoindent
set cc=91
set clipboard=unnamed " Use the system clipboard with default register
set confirm " confirmation on failed saves
set directory^=$HOME/.config/nvim/swap// " place swp files in central folder
set exrc " enable per-directory nvim/init.vim files
set grepprg=rg\ --vimgrep\ $*
" set hidden " Enable hidden buffers
set laststatus=2 " always display the status line
set list
set listchars=tab:>-
set matchpairs+=<:>
set mouse=a " mouse everywhere
set nobackup
set nowritebackup
set nofoldenable " Don't fold by default"
set noshowcmd
set number " line numbers
set nrformats-=octal
set path+=/usr/local/include,include/**,src/**
set noruler " cursor position
set scrolloff=2 " start scrolling before cursor reaches last line
set secure " disable unsafe commands in local nvim/init.vim files
set shortmess+=c
set signcolumn=yes
set splitbelow " get preview window to show below rather than above
set smarttab
set switchbuf=usetab " Jump to already open buffers (in any tab) when switching buffers
set wrap!  " turn off word wrap
set diffopt+=vertical

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
" Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'sbdchd/neoformat'
" Plug 'terryma/vim-multiple-cursors'
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
Plug 'antoinemadec/coc-fzf'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Valloric/ListToggle'
Plug 'vim-scripts/a.vim'
Plug 'tpope/vim-vinegar'

let g:alternateNoDefaultAlternate = 1
let g:alternateExtensions_hpp = "ipp,cpp"
let g:alternateExtensions_cpp = "h,hh,H,HPP,hpp,ipp"
let g:alternateExtensions_ipp = "hpp,cpp"
let g:alternateSearchPath = 'wdr:include,wdr:src,sfr:../source,sfr:../src,sfr:../include,sfr:../inc'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

let g:ackprg = 'rg --vimgrep'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
nnoremap <c-p> :GFiles<cr>
nnoremap <c-s> :CocFzfList symbols<cr>


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
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dag/vim-fish'
Plug 'gmoe/vim-faust', {'for': 'faust'}
Plug 'jceb/vim-orgmode', {'for': 'org'}
Plug 'kelan/gyp.vim', {'for': 'gyp'}
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'leafo/moonscript-vim', {'for': 'moon'}
Plug 'pest-parser/pest.vim', {'for': 'pest'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'thyrgle/vim-dyon', {'for': 'dyon'}
Plug 'tikhomirov/vim-glsl'
Plug 'valloric/MatchTagAlways', {'for': ['html', 'javascript.jsx']}

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
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-python',
  \ 'coc-tsserver',
  \ 'coc-rust-analyzer',
  \ ]

" Code navigation + completion
Plug 'honza/vim-snippets'
Plug 'ludovicchabant/vim-gutentags', {'for': 'cpp'}
Plug 'SirVer/ultisnips'
Plug 'skywind3000/asyncrun.vim'
Plug 'rizzatti/dash.vim'

let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:dash_map = {
      \ 'cpp' : ['cpp', 'boost', 'juce', 'dsp'],
      \ }

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
Plug 'AndrewRadev/bufferize.vim'
Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-startify'
Plug 'reedes/vim-pencil'
Plug 'vimwiki/vimwiki'

let g:goyo_width = 101
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
set statusline+=%#LineNr#
set statusline+=\ %f   " file
set statusline+=\ %m   " modified
set statusline+=%=     " separator
set statusline+=%#CursorColumn#
set statusline+=\ %y  " file type


" --- netrw ---
let g:netrw_banner = 0 " Turn off the banner
let g:netrw_browse_split = 4 " Open files in previous window
let g:netrw_winsize = 25 " 25% width
let g:netrw_liststyle = 3 " Tree view


" --- 80 column limit for git commit messages and text files
augroup gitsetup
  autocmd!
  autocmd FileType gitcommit,markdown set textwidth=80
  autocmd FileType gitcommit,markdown setlocal colorcolumn=81
augroup END


" --- background colour of signs gutter
highlight clear SignColumn

" --- highlight colour for matching parentheses
highlight MatchParen ctermbg=blue ctermfg=white guibg=yellow

" --- popup menu colors
highlight Pmenu ctermbg=grey ctermfg=black


" --- Command completion ---
set wildmenu
set wildmode=longest,list
set wildignore+=.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.vcproj,*.dll,*.zip
set wildignorecase


" coc setup
inoremap <silent><expr> <c-space> coc#refresh()

set updatetime=300

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
hi link CocFloating markdown
hi CocFloat ctermbg=white ctermfg=red


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)


" --- 2 space tabs by default ---
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

augroup filetypes
  autocmd!

  " Some languages should have 4 space tabs
  autocmd FileType gyp,lua,rust,swift,typescript
    \ setlocal shiftwidth=4 softtabstop=4 tabstop=4

  autocmd FileType rust compiler cargo
  autocmd FileType rust setlocal cc=101

  autocmd FileType lua setlocal cc=121

  autocmd FileType objcpp set ft=objc " Hack for neoformat
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


" --- Macros ---

" From https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
" Executes a macro for each line in a visual selection
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction


" --- Quickfix ---

augroup quickfix
  autocmd!

  " Open quickfix when new output is added, and return cursor to previous location
  autocmd QuickFixCmdPost [^l]* nested botright copen | wincmd p

  " Enable wrapping for long quickfix lines
  autocmd FileType qf
        \ setlocal wrap |
        \ setlocal linebreak
augroup END

let g:asyncrun_status = "stopped"
augroup QuickfixStatus
  au! BufWinEnter quickfix setlocal
    \ statusline=%#LineNr#%{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ [%{g:asyncrun_status}]\ %=\%#CursorColumn#\ %y\ %#PmenuSel#\ %p%%\ %l:%c\ "
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
if has("nvim")
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au FileType fzf tunmap <buffer> <Esc>
endif
au TermOpen * setlocal listchars= nonumber norelativenumber
au TermOpen * startinsert
au BufEnter,BufWinEnter,WinEnter term://* startinsert
au BufLeave term://* stopinsert


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
nmap <F16> ;set makeprg=$TESTPRG<CR>;wa<CR>;AsyncRun -program=make<CR>
nmap <F17> ;set makeprg=$MAKEPRG<CR>;wa<CR>;AsyncRun -program=make<CR>
nmap <F18> ;
nmap <F19> ;wa<CR>;cnext<CR>
nmap <F20> ;wa<CR>;cprev<CR>


" --- Leader ---
" set leader to space
let mapleader = "\<Space>"
" ,1 - write all and make
nmap <leader>1 ;wa<CR><F17><CR>
" ,! - make test
nmap <leader>! ;wa<CR><F16><CR>
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
nmap <leader>0 ;AsyncStop<CR>

" e - fzf coc symbols
nmap <leader>e ;CocFzfList symbols<cr>

" o - fzf coc outline
nmap <leader>o ;CocFzfList outline<cr>

" f - fzf files
nmap <leader>f ;GFiles<cr>

" j - jump to tag
nmap <leader>j <C-]>
" J - jump to previous tag
nmap <leader>J <C-t>

" " n - toggle NERDTree
nmap <leader>n ;NERDTreeToggle<cr>
" " N - find current buffer in NERDTree
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

