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

" show relative line numbers too
"set relativenumber

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

" I always accidently enter recording mode
noremap <Leader>q q
noremap q <Nop>

" Turn off setting visual selected text to lowercase
" I always do this accidently when I didn't mean to
vnoremap u <Nop>

" <tab> switches to last used buffer
nmap <tab> :b#<cr>

" Fastfile is used by fastlane. Let vim know it's a ruby file
autocmd BufNewFile,BufRead Fastfile set syntax=ruby

" Set the filetype based on the file's extension, but only if
" " 'filetype' has not already been set
au BufRead,BufNewFile *.ejs setfiletype html

" Disable comments continuing when hit enter for new line
set formatoptions-=cro

" Remove hidden fugitive buffers
"autocmd BufReadPost fugitive://* set bufhidden=delete

" ----------- Searching ----------------------------------------
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" Press Space to turn off highlighting and clear any message already
" displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" ------------ Moving ---------------------------------------
" move to beginning/end of line
nnoremap B ^
nnoremap E $

" --------- CntrlP ---------------------
" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden --ignore ".git"  -g ""'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = { 
  \ 'dir': '\v[\/](\.git|node_modules|\.sass-cache|bower_components)$'
  \ }
" CtrlP to leader p
noremap <leader>p :CtrlP<cr>
"
" ---------- lightline -----------
set laststatus=2
" show relative filepath
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ }
      \ }
function! LightLineFilename()
    return expand('%')
  endfunction

" --------- Shortcuts ---------------------------
" jk is escape
inoremap jk <esc>

" leader is a comma
let mapleader="," 

" manage tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" toggle gundo
nnoremap <leader>u :GundoToggle<CR> 

" open ag.vim
nnoremap <leader>a :Ag

" Taylor - npm run fix
nnoremap <leader>f :!npm run fix

" Taylor - git fugitive
" Gdiff for conflict resolution
nnoremap <leader>ge :Gedit
nnoremap <leader>gs :Gstatus
nnoremap <leader>gb :Gbrowse
nnoremap <leader>gd :Gdiff

" Taylor = split diffs vertically
:set diffopt+=vertical

" End conflict resolution
nnoremap <leader>go :only

" open NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinPos = "right"
" close nerdtree if its the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nerdcommenter
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
"
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Colorizer
" Don't highlight color names
let g:colorizer_colornames = 0

" neoformat
" Run prettier format when saving .js
" autocmd BufWritePre *.js Neoformat

" This allows jsx syntax highlighting in js files
let g:jsx_ext_required = 0

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

" vim-tslint told me this would integrate vim-tslint and tsyquyomi
augroup tslint
  function! s:typescript_after(ch, msg)
    let cnt = len(getqflist())
    if cnt > 0
      echomsg printf('[Tslint] %s errors', cnt)
    endif
  endfunction
  let g:tslint_callbacks = {
        \ 'after_run': function('s:typescript_after')
        \ }

"  let g:tsuquyomi_disable_quickfix = 1

  function! s:ts_quickfix()
    let winid = win_getid()
    execute ':TsuquyomiGeterr'
    call tslint#run('a', winid)
  endfunction

  autocmd BufWritePost *.ts,*.tsx silent! call s:ts_quickfix()
"  autocmd InsertLeave *.ts,*.tsx silent! call s:ts_quickfix()
augroup END

" filetypes for jsx, tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" Taylor - colorscheme
colo molokai
