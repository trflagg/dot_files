" from https://gist.github.com/gosukiwi/080d1d3f87f861a15c44
"
" ---------------------- USABILITY CONFIGURATION ----------------------
"  Basic and pretty much needed settings to provide a solid base for
"  source code editting

" don't make vim compatible with vi 
set nocompatible

set noswapfile

" turn on syntax highlighting
syntax on
" and show line numbers
set number

" always show 5 lines around the cursor
set scrolloff=5 

" open vsplits to the right
set splitright

" Highlight current line but on current window only
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

" reload files changed outside vim
set autoread         

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

" move backup and swaps to /tmp
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" ------------ Usability ---------------------------------------
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces

set shiftwidth=2

set showcmd             " show command in bottom bar
" set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu

" strip trailing whitespace from specific file types
autocmd FileType javascript,ruby,scss,bash,typescript autocmd BufWritePre <buffer> :%s/\s\+$//e


" Fastfile is used by fastlane. Let vim know it's a ruby file
autocmd BufNewFile,BufRead Fastfile set syntax=ruby

" Set the filetype based on the file's extension, but only if
" " 'filetype' has not already been set
au BufRead,BufNewFile *.ejs setfiletype html

" Disable comments continuing when hit enter for new line
set formatoptions-=cro

" Remove hidden fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" ----------- Searching ----------------------------------------
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" Taylor = split diffs vertically
:set diffopt+=vertical

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


" Format json with a simple function
" (will format entire file)
com! FormatJSON %!python -m json.tool

" filetypes for jsx, tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

let g:syntastic_typescript_checkers = ['tslint', 'tsuquyomi']

" Taylor - colorscheme
" for truecolor:
"set termguicolors
colo molokai

" set path to search based on current directory with gf
:set path+=**

" toggle line numbers based on mode
:set number relativenumber

function Solarize()
  set background=light
  colorscheme solarized
endfunction

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
