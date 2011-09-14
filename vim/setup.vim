" Look into getting the :make command set up.  It looks like it could save
" a lot of time, plus I would learn to use make.
"
" Here are some relevant help topics:
"   :h make
"   :h quickfix
" 
" Here are some relevant options:
"   makeprg
"   makeef
"   shellpipe

" Autocommands
" ============
" I might be able to use autocommands to automatically update my syntax files
" upon being opened.  (i.e. adding types)

set nocompatible

set nobackup
set cpoptions+=I
set backspace=indent,eol,start
set wildignore=*.swp,*.pyc,*.class

set formatoptions=tcrq
set guioptions=ic
set guifont=Monospace\ 10

set mouse=""
set mousehide

set ruler
set showcmd
set scrolloff=5

set nowrap
set textwidth=79

set gdefault
set incsearch
set nohlsearch

set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab

set spell
set spelllang=en_us

set autoread
set autowrite

set fileformat=unix
set fileformats=unix

set foldcolumn=0
set foldmethod=marker
set printdevice=GrayScale

map Y y$
map Q gq

map '' 'mzz
map == 1z=

map <F1> <Esc>
map! <F1> <Esc>
map K <Nop>

abbreviate {{{! {{{1

retab
filetype plugin indent on

let java_allow_cpp_keywords = 1
let python_highlight_exceptions = 1
let python_highlight_space_errors = 1
let python_no_builtin_highlight = 1

if has("gui_running")
    colorscheme light
else
    colorscheme dark
endif
