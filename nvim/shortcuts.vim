" I always accidently enter recording mode
"noremap <Leader>q q
"noremap q <Nop>

" Turn off setting visual selected text to lowercase
" I always do this accidently when I didn't mean to
vnoremap u <Nop>

" <tab> switches to last used buffer
nmap <tab> :b#<cr>

" Press Space to turn off highlighting and clear any message already
" displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" ------------ Moving ---------------------------------------
" move to beginning/end of line
nnoremap B ^
nnoremap E $

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

" End conflict resolution
nnoremap <leader>go :only

" Edit config files
:nnoremap <leader>s :source % 
:nnoremap <leader>ev :vsplit ~/.vimrc
:nnoremap <leader>ei :vsplit ~/.config/nvim/init.vim
:nnoremap <leader>es :vsplit ~/.config/nvim/shortcuts.vim
:nnoremap <leader>ep :vsplit ~/.config/nvim/plugins.vim
:nnoremap <leader>ew :vsplit ~/.config/nvim/writing.vim

:nnoremap <leader>ec :vsplit ~/.config/nvim/after/plugin/coc.vim

" Plug
:nnoremap <leader>pi :PlugInstall

" change to my favorite dark colorscheme
:nnoremap <leader>cd :colo molokai<CR>
" usee solarize colorscheme
" function is defined in .vimrc
:nnoremap <leader>so :call Solarize()<CR>


" moving next and prev error
:nnoremap <leader>cn :cn<CR>
:nnoremap <leader>cp :cp<CR>
:nnoremap <leader>cc :cc<CR>


" Add writing options pack
:nnoremap <leader>wm :packadd writing

" Open dash
:nnoremap <leader>da :Dash 
