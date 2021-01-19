lua require('./my/lsp')

autocmd Filetype typescript,typescript.tsx,typescriptreact setlocal omnifunc=v:lua.vim.lsp.omnifunc

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gc     <cmd>lua vim.lsp.buf.completion()<CR>
nnoremap <silent> gH    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-d> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>

autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

