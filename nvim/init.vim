" load vim configs
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

inoremap jk <esc>

" use this for python3 executatble
 let g:python3_host_prog = '/usr/local/bin/python3'

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/shortcuts.vim
source ~/.config/nvim/writing.vim


" lsp specific config
lua<<EOF
   require'lspconfig'
   require'lspconfig'.tsserver.setup{}
  
  print('lua loaded')
EOF

" Example config
autocmd Filetype typescript,typescript.tsx setlocal omnifunc=v:lua.vim.lsp.omnifunc
nnoremap <silent> ;dc <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ;df <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> ;h  <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> ;i  <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> ;s  <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> ;td <cmd>lua vim.lsp.buf.type_definition()<CR>

"let g:completion_enable_snippet = 'UltiSnips'
"let g:completion_enable_fuzzy_match = 1
"let g:diagnostic_enable_virtual_text = 1

" fix conflict between completion-nvim and autopairs
"let g:completion_confirm_key = ""
