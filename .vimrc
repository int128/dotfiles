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

" NeoBundle
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'https://github.com/Shougo/neobundle.vim'
NeoBundle 'https://github.com/scrooloose/nerdtree.git'
NeoBundle 'https://github.com/tpope/vim-surround'
NeoBundle 'https://github.com/airblade/vim-gitgutter'
NeoBundle 'https://github.com/kchmck/vim-coffee-script'

call neobundle#end()
filetype plugin indent on

