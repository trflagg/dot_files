" Turn off setting visual selected text to lowercase
" I always do this accidently when I didn't mean to
vnoremap u <Nop>


" <`> switches to last used buffer
nmap ` :b#<cr>

" Maps ESC to exit terminal's insert mode
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" Press Space to turn off highlighting and clear any message
:nnoremap ; :nohlsearch<Bar>:echo<CR>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" manage tabs
map <leader>tt :tabnew<cr>
"map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tr :tabn<cr>
map <leader>tp :tabp<cr>

map <leader>tm :tabmove

" Plugins
nnoremap <leader>x :!npm run fix
"nnoremap <leader>e :Http<CR>
nnoremap <leader>F :Neoformat prettier<CR>
nnoremap <leader><leader> :GFiles<CR>
nnoremap <leader>b :Buffers<CR>

" End conflict resolution
nnoremap <leader>go :only

:nnoremap <leader>s :source %<CR>
:nnoremap <leader>ev :vsplit ~/.vimrc<CR>
:nnoremap <leader>ei :vsplit ~/.config/nvim/init.vim<CR>
:nnoremap <leader>es :vsplit ~/.config/nvim/shortcuts.vim<CR>
:nnoremap <leader>ep :vsplit ~/.config/nvim/plugins.vim<CR>
:nnoremap <leader>el :vsplit ~/.config/nvim/lua/my/lsp.lua<CR>
:nnoremap <leader>eh :vsplit ~/.config/nvim/highlights.vim<CR>
:nnoremap <leader>ew :vsplit ~/.config/nvim/writing.vim<CR>

:nnoremap <leader>pi :PlugInstall<CR>
:nnoremap <leader>pc :PlugClean<CR>

" change to my favorite dark colorscheme
":nnoremap <leader>cd :colo molokai<CR>
" usee solarize colorscheme
" function is defined in .vimrc
":nnoremap <leader>so :call Solarize()<CR>


" moving next and prev error
"
:nnoremap <leader>cn :cn<CR>
:nnoremap <leader>cp :cp<CR>
:nnoremap <leader>cc :cc<CR>


" Add writing options pack
:nnoremap <leader>wm :source $HOME/.config/nvim/writing.vim<CR>

" FZF
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>ff :GFiles<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fa :Ag<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>fc :Colors<CR>

nnoremap <leader>a :Ag<Space>

" Debugger remaps


