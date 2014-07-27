" .vimrc

set nocompatible

set backup
set backupdir=~/.vim/
set swapfile
set directory=~/.vim/
set noundofile

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

