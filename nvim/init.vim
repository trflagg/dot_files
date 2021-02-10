" Graciously stolen from
" https://github.com/David-Kunz/vim/blob/master/init.vim

set nocompatible
set noswapfile
syntax on
set omnifunc=syntaxcomplete#Complete
set scrolloff=5
set autoread
set encoding=utf-8
set fileencoding=utf-8
runtime macros/matchit.vim
set backspace=indent,eol,start
set fileformat=unix
set fileformats=unix,dos
set viminfo='100,f1
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
set showcmd
set wildmenu
set incsearch
"set path+=**


set completeopt=menuone,noinsert,noselect
set mouse=a
set splitright
set splitbelow
if (has("termguicolors"))
  set termguicolors
endif
set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set number relativenumber
set smartcase
set diffopt+=vertical
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes
set background=dark

set statusline=%f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\%p%%
set statusline+=\ %l:%c
set statusline+=%#Directory#
set statusline+=\ %y

let mapleader = " "
inoremap jk <esc>
inoremap kk <esc>

filetype on
filetype plugin on
filetype indent on


" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx


lua require('my/utils')

source ~/.config/nvim/plugins.vim
colorscheme palenight
source ~/.config/nvim/highlights.vim
source ~/.config/nvim/lsp.vim
source ~/.config/nvim/shortcuts.vim



let g:python3_host_prog = '/usr/local/bin/python3'
let g:netrw_banner=0
" " Enter Terminal-mode (insert) automatically
autocmd TermOpen * startinsert


" strip trailing whitespace from specific file types
autocmd FileType javascript,ruby,scss,bash,typescript autocmd BufWritePre <buffer> :%s/\s\+$//e

" set .ejs to html filetype
au BufRead,BufNewFile *.ejs setfiletype html

" Format json with a simple function
" (will format entire file)
com! FormatJSON %!python -m json.tool

" filetypes for jsx, tsx
"autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=reacttypescript

" Highlight current line but on current window only
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END


" only show relative on current buffer
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Remove hidden fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

