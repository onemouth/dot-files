set grepprg=ack\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m

syntax on
set bg=dark
set nobackup
set nowritebackup
set noswapfile
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smarttab
set nu
set expandtab
highlight LineNr ctermfg=grey 
filetype indent on
filetype on
filetype plugin on

set statusline=
set statusline +=%1*\ %n\ %* "buffer number
set statusline +=%5*%{&ff}%* "file format
set statusline +=%3*%y%* "file type
set statusline +=%4*\ %<%F%* "full path
set statusline +=%2*%m%* "modified flag
set statusline +=%1*%=%5l%* "current line
set statusline +=%2*/%L%* "total lines
set statusline +=%1*%4v\ %* "virtual column number
set statusline +=%2*0x%04B\ %* "character under cursor
hi User1 guifg=#eea040 guibg=#222222
hi User2 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222
set laststatus=2

 
