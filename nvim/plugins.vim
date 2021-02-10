
call plug#begin('~/.vim/plugged')
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(1) } }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'larsbs/vimterial_dark'
Plug 'janko/vim-test'
Plug 'rakr/vim-one'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'
Plug 'zxqfl/tabnine-vim'
" :VimspectorInstall vscode-node-debug2
" :VimspectorInstall debugger-for-chrome
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-fugitive'
Plug 'nicwest/vim-http'
Plug 'Lenovsky/nuake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Iron-E/nvim-highlite'
"Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" or
"Plug 'yuezk/vim-js'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
" or
Plug 'jparise/vim-graphql'        " GraphQL syntax
" :TSIntall typescript
" :TSIntall javascript
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'ervandew/supertab'
Plug 'mhinz/vim-startify'
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'css', 'json', 'graphql', 'markdown', 'yaml', 'html'] }
"Plug 'itomasr/molokai'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'alexaandru/nvim-lspupdate'
Plug 'kosayoda/nvim-lightbulb'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'dpelle/vim-LanguageTool'



call plug#end()

"
" vim-completion
" Use <Tab> and <S-Tab> to navigate through popup menu
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
"set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
"set shortmess+=c
"g:
"let g:completion_matching_smart_case = 1
"let g:completion_matching_strategy_list = ['fuzzy', 'substring', 'exact', 'all']
"let g:completion_sorting =  "length"

"
" Neoformat
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
let g:neoformat_basic_format_trim = 1
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1

" luarocks install --local formatter
let g:neoformat_enabled_lua = ["luaformatter"]
" npm i -g prettier-eslint-cli
let g:neoformat_enabled_javascript = ["prettier"]
let g:neoformat_enabled_typescript = ["tslint"]
let g:neoformat_enabled_typescriptreact = ["tslint"]
" npm i -g prettier
let g:neoformat_enabled_css = ["prettier"]
let g:neoformat_enabled_json = ["prettier"]

"
" Nuake
let g:nuake_position = "bottom"
let g:nuake_start_insert = 0
nnoremap <leader>n :Nuake<CR>
tnoremap jk <C-\><C-n>

"
" Fugitive
nnoremap <leader>gs :G<cr>
nnoremap <leader>gb :G branch<cr>
nnoremap <leader>gd :G diff<cr>
nnoremap <leader>gl :G log -100<cr>

"
" startify
" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
  let files = systemlist('git ls-files -m 2>/dev/null')
  return map(files, "{'line': v:val, 'path': v:val}")
endfunction
" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
  let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
  return map(files, "{'line': v:val, 'path': v:val}")
endfunction
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
      \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
let g:startify_skiplist = ['potter']

"
" vimspector
fun! GotoWindow(id)
  :call win_gotoid(a:id)
endfun
func! AddToWatch()
  let word = expand("<cexpr>")
  call vimspector#AddWatch(word)
endfunction
let g:vimspector_base_dir = expand('$HOME/.config/vimspector-config')
let g:vimspector_sidebar_width = 120
let g:vimspector_bottombar_height = 0
nnoremap <leader>da :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>d? :call AddToWatch()<CR>
nnoremap <leader>dx :call vimspector#Reset()<CR>
nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>
nnoremap <S-k> :call vimspector#StepOut()<CR>
nnoremap <S-l> :call vimspector#StepInto()<CR>
nnoremap <S-j> :call vimspector#StepOver()<CR>
nnoremap <leader>d_ :call vimspector#Restart()<CR>
nnoremap <leader>dn :call vimspector#Continue()<CR>
nnoremap <leader>drc :call vimspector#RunToCursor()<CR>
nnoremap <leader>dh :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>de :call vimspector#ToggleConditionalBreakpoint()<CR>
let g:vimspector_sign_priority = {
      \    'vimspectorBP':         998,
      \    'vimspectorBPCond':     997,
      \    'vimspectorBPDisabled': 996,
      \    'vimspectorPC':         999,
      \ }

" vim-test
"
let test#strategy = "neovim"
let test#neovim#term_position = "vertical"
let g:test#javascript#runner = 'jest'
nmap <silent> tn :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> ts :TestSuite<CR>
nmap <silent> tl :TestLast<CR>

"
" vim_http
let g:vim_http_split_vertically=1
