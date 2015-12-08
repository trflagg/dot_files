" from https://gist.github.com/gosukiwi/080d1d3f87f861a15c44
"
" ---------------------- USABILITY CONFIGURATION ----------------------
"  Basic and pretty much needed settings to provide a solid base for
"  source code editting

" don't make vim compatible with vi 
set nocompatible

" turn on syntax highlighting
syntax on
" and show line numbers
set number

" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

" reload files changed outside vim
:set autoread         

" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8

" enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

" by default, in insert mode backspace won't delete over line breaks, or 
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start

" dont't unload buffers when they are abandoned, instead stay in the
" background
set hidden

" set unix line endings
set fileformat=unix
" when reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix,dos

" save up to 100 marks, enable capital marks
set viminfo='100,f1

" screen will not be redrawn while running macros, registers or other
" non-typed comments
set lazyredraw

" ------------ Usability ---------------------------------------
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

set showcmd             " show command in bottom bar
" set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu

" ----------- Searching ----------------------------------------
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" ------------ Moving ---------------------------------------
" move to beginning/end of line
nnoremap B ^
nnoremap E $

" --------- Shortcuts ---------------------------
" jk is escape
inoremap jk <esc>
" ---------------------- PLUGIN CONFIGURATION ----------------------
"  " initiate Vundle
let &runtimepath.=',$HOME/.vim/bundle/Vundle.vim'
call vundle#begin()
"  " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"  " start plugin defintion
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'sjl/gundo'

