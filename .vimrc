" .vimrc
scriptencoding utf-8
set encoding=utf-8

let $dotvim=expand('~/.vim')

set backup
set backupdir=$dotvim/tmp/
set swapfile
set directory=$dotvim/tmp/
set undofile
set undodir=$dotvim/tmp/

" Appearance
set t_Co=256
syntax on

set number
set cursorline
set showmatch
set wildmenu
set laststatus=2

" Operability
set incsearch
set hlsearch

set textwidth=0
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab

" Remember cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
