set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'davidhalter/jedi-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'bitc/vim-hdevtools'
Bundle 'a.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'jpalardy/vim-slime'
Bundle 'godlygeek/tabular'
Bundle "scrooloose/nerdcommenter"
Bundle "bronson/vim-trailing-whitespace"
Bundle "airblade/vim-gitgutter"
Bundle "tpope/vim-fugitive"
Bundle "altercation/vim-colors-solarized"
Bundle "pangloss/vim-javascript"
Bundle "briancollins/vim-jst"
Bundle 'christoomey/vim-tmux-navigator'
" Clojure
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'guns/vim-clojure-static'
Bundle 'guns/vim-sexp'
Bundle "tpope/vim-repeat"
Bundle 'tpope/vim-sexp-mappings-for-regular-people'



set t_Co=256
syntax enable
syntax on
set bg=dark
colorscheme solarized

autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesActivate
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadRound
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadSquare
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadBraces
autocmd BufEnter *.cljs,*.clj,*.cljs.hl setlocal iskeyword+=?,-,*,!,+,/,=,<,>,.,:
" -- Rainbow parenthesis options
let g:rbpt_colorpairs = [
    \ ['darkyellow',  'RoyalBlue3'],
    \ ['darkgreen',   'SeaGreen3'],
    \ ['darkcyan',    'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['DarkMagenta', 'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkyellow',  'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['DarkMagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkyellow',  'DarkOrchid3'],
    \ ['darkred',     'firebrick3'],
    \ ]


filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

runtime! ftplugin/man.vim

let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

autocmd BufRead,BufNewFile *.cljs setlocal filetype=clojure

nmap <F8> :TagbarToggle<CR>

au FileType haskell nnoremap <buffer> <F4> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F5> :HdevtoolsClear<CR>

function! FindCabalSandboxRoot()
    return finddir('.cabal-sandbox', './;')
endfunction

function! FindCabalSandboxRootPackageConf()
    return glob(FindCabalSandboxRoot().'/*-packages.conf.d')
endfunction

let g:hdevtools_options = '-g-ilib -g-isrc -g-i. -g-idist/build/autogen -g-Wall -g-package-conf='.FindCabalSandboxRootPackageConf()

function! SetgHdevtools()
    if !exists("g:hdevtools_options")
         let g:hdevtools_options = '-g-ilib -g-isrc -g-i. -g-idist/build/autogen -g-Wall -g-package-conf='.FindCabalSandboxRootPackageConf()
    else
        unlet g:hdevtools_options
    endif
endfunction

nnoremap <silent> <F6> = :call SetgHdevtools()<CR>

nnoremap <silent> <F2> :NERDTreeToggle<CR>

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

set laststatus=2

let mapleader=","

