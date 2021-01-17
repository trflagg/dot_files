" ----------------------- Plugin Config ---------------------

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

" remove default thesaurus query maps
let g:tq_map_keys = 0
nnoremap <Leader>ts :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap <Leader>ty y:ThesaurusQueryReplace <C-r>"<CR>
let g:tq_openoffice_en_file="/usr/local/share/myspell/dict/th_en_US_new"

" ale
let g:ale_fixers = {
 \ 'javascript': ['prettier', 'eslint'],
 \ 'typescript': ['prettier']
 \ }

let g:ale_cursor_detail = 0 
let g:ale_echo_delay = 500
let g:ale_lint_delay = 1000
let g:ale_lint_in_text_change = 'never'
let g:ale_lint_on_insert_leave = 1
 
let g:ale_set_highlights = 0
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:ale_fix_on_save = 1

" markdown preview opens automatically
let g:mkdp_auto_start = 1

" ---------------------- PLUGIN Installation ----------------------
" Helper for Plug conditionals
" e.g: Plug 'benekastah/neomake', Cond(has('nvim'))
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" PLUG
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"
" Taylor - colorscheme
colo molokai

call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sjl/gundo.vim'
Plug 'itchyny/lightline.vim'
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'aaronj1335/underscore-templates.vim'
Plug 'w0rp/ale'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sbdchd/neoformat'
Plug 'chrisbra/Colorizer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'
"Plug 'Quramy/tsuquyomi'
Plug 'ianks/vim-tsx'
Plug 'hail2u/vim-css3-syntax'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'matveyt/vim-modest'

Plug 'tpope/vim-abolish'

Plug 'tpope/vim-rails'

" COC
"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
"Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-tslint-plugin', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff

" Writing mode
Plug 'junegunn/goyo.vim', { 'on': 'Goyo', 'dir': '~/.config/nvim/pack/writing/opt/goyo' }
Plug 'junegunn/limelight.vim', { 'dir': '~/.config/nvim/pack/writing/opt/limelight' }
Plug 'dpelle/vim-LanguageTool', { 'on': 'LanguageToolCheck', 'dir': '~/.config/nvim/pack/writing/opt/languagetool' }
Plug 'reedes/vim-pencil'
Plug 'ron89/thesaurus_query.vim'

Plug 'rizzatti/dash.vim'

Plug 'neovim/nvim-lspconfig'

Plug 'nvim-lua/diagnostic-nvim'
Plug 'senran101604/neotrix.vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()

