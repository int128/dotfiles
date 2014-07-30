" .vimrc

set nocompatible

set backup
set backupdir=~/.vim/tmp/
set swapfile
set directory=~/.vim/tmp/
set undofile
set undodir=~/.vim/tmp/

" Appearance
set t_Co=256
autocmd ColorScheme * highlight LineNr ctermfg=7 guifg=#888888
colorscheme default
syntax on

set number
set cursorline
set showmatch
set wildmenu

" Operability
set incsearch
set hlsearch

set textwidth=0
set tabstop=2
set expandtab
set smarttab

