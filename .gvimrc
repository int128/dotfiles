" .gvimrc

set background=light
colorscheme solarized

set columns=120
set lines=40
set cmdheight=1

if has('win32') || has('win64')
  set guifont=MeiryoKe_Gothic:h14
elseif has('mac')
  set guifont=Menlo\ Regular:h14
else
  set guifont=Monospace\ 10.5
end
