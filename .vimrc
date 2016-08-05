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

" NeoBundle
set runtimepath+=$dotvim/bundle/neobundle.vim/
call neobundle#begin($dotvim . '/bundle/')

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-surround'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'airblade/vim-gitgutter'

NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'fatih/vim-go'

call neobundle#end()
filetype plugin indent on

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

autocmd BufNewFile,BufRead *.adoc setlocal filetype=asciidoc
autocmd BufNewFile,BufRead *.gradle setlocal filetype=groovy

" Remember cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

