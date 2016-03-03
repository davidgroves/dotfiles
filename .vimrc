" Set utf8 as standard encoding
set encoding=utf8

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set sensible number of tabs
set tabstop=4

" Dont actually insert a <tab> when you press it, put 4 spaces instead
set smarttab
set expandtab
set softtabstop=4

" When using << or >> to indent lines, do it by 4 characters
set shiftwidth=4

" Show linenumbers
set number	

" Show commands in the bottom
set showcmd

" Highlight current line
set nocursorline

" Highlight bracers for C like languages
set showmatch

" Search as you type, ignore case and show everything
set ignorecase
set incsearch
set hlsearch

" Dont worry about wierd old vi compatiblity
set nocompatible

" Autocomplete
set wildmenu

" Redraw the screen less frantically. Makes pasting MUCH faster
set lazyredraw

" Handles file indentation better for languages like Python
filetype indent on

" Write backups into tmp directories rather that polluting filesystem
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Use , for custom commands
let mapleader = ","
let g:mapleader = ","

" Pressing ,pp will toggle paste mode
map <leader>pp :setlocal paste!<cr>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
