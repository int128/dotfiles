" .vimrc
scriptencoding utf-8

if has('win32') || has('win64')
  let $dotvim=expand('~/dotfiles/.vim')
else
  let $dotvim=expand('~/.vim')
endif

set backup
set backupdir=$dotvim/tmp/
set swapfile
set directory=$dotvim/tmp/
set undofile
set undodir=$dotvim/tmp/

" NeoBundle
set runtimepath+=$dotvim/bundle/neobundle.vim/
call neobundle#begin($dotvim . '/bundle/')

NeoBundle 'https://github.com/Shougo/neobundle.vim'
NeoBundle 'https://github.com/scrooloose/nerdtree'
NeoBundle 'https://github.com/tpope/vim-surround'
NeoBundle 'https://github.com/itchyny/lightline.vim'
NeoBundle 'https://github.com/airblade/vim-gitgutter'

NeoBundle 'https://github.com/kchmck/vim-coffee-script'

call neobundle#end()
filetype plugin indent on

" Appearance
set t_Co=256
autocmd ColorScheme * highlight LineNr ctermfg=8 guifg=#888888
colorscheme slate
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

