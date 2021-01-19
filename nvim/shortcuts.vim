" Turn off setting visual selected text to lowercase
" I always do this accidently when I didn't mean to
vnoremap u <Nop>


" <`> switches to last used buffer
nmap ` :b#<cr>

" Maps ESC to exit terminal's insert mode
"if has('nvim')
"tnoremap <Esc> <C-\><C-n>
"endif

" Press Space to turn off highlighting and clear any message
:nnoremap ; :nohlsearch<Bar>:echo<CR>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" manage tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Plugins
nnoremap <leader>x :!npm run fix
"nnoremap <leader>e :Http<CR>
nnoremap <leader>F :Neoformat prettier<CR>
nnoremap <leader><leader> :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
:nnoremap <leader>da :Dash

" End conflict resolution
nnoremap <leader>go :only

:nnoremap <leader>s :source %<CR>
:nnoremap <leader>ev :vsplit ~/.vimrc<CR>
:nnoremap <leader>ei :vsplit ~/.config/nvim/init.vim<CR>
:nnoremap <leader>es :vsplit ~/.config/nvim/shortcuts.vim<CR>
:nnoremap <leader>ep :vsplit ~/.config/nvim/plugins.vim<CR>
:nnoremap <leader>el :vsplit ~/.config/nvim/lua/my/lsp.lua<CR>
:nnoremap <leader>eh :vsplit ~/.config/nvim/highlights.vim<CR>
":nnoremap <leader>ew :vsplit ~/.config/nvim/writing.vim

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
":nnoremap <leader>wm :packadd writing

" FZF
nnoremap <C-p> :Files<CR>
nnoremap <leader>ff :GFiles<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fa :Ag<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>fc :Colors<CR>


" Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>da :call vimspector#Launch()<CR>
nnoremap <leader>dd :TestNearest -strategy=jest<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>d? :call AddToWatch()<CR>
nnoremap <leader>dx :call vimspector#Reset()<CR>
nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>

nmap <S-k> <Plug>VimspectorStepOut
nmap <S-l> <Plug>VimspectorStepInto
nmap <S-j> <Plug>VimspectorStepOver
nmap <leader>d_ <Plug>VimspectorRestart
nmap <leader>dn :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dh <Plug>VimspectorToggleBreakpoint
nmap <leader>de <Plug>VimspectorToggleConditionalBreakpoint


