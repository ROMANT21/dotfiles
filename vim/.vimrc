" Create var for vim data dir
let data_dir = expand('~/.vim')

" Turn off vi compatibility
set nocompatible

" My epic leader key
let mapleader = " "

" Turn off for later when I turn it back on
filetype off

" Reload buffers when files change from outside
set autoread
au FocusGained, BufEnter * silent! checktime

" Get rid of nasty back ups
set nobackup
set nowb
set noswapfile

" Decoration and looks
syntax on
set wildmenu
set number
set relativenumber
set cursorline

" Search Settings
set incsearch        " Search highlights as you type
set hlsearch         " Highlight search matches
set ignorecase       " Search case insensitive
set smartcase        " ...unless search contains capitals
nnoremap <leader>nh :noh<CR>

" Tab Settings
set tabstop=4       " Tab key indents 4 spaces 
set shiftwidth=4    " Auto-indent indents 4 spaces
set expandtab       " Converts tabs to spaces
set smartindent
set smarttab

" Filetype Settings
filetype plugin indent on
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd BufRead,BufNewFile *.tsx set filetype=tsx
autocmd FileType tsx setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab

autocmd BufNewFile,BufRead *.jsx set filetype=jsx
autocmd FileType jsx setlocal shiftwidth=2 softtabstop=2 expandtab
