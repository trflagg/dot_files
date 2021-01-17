local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'

-- npm install -g typescript typescript-language-server
lspconfig.tsserver.setup{ 
  on_attach=require'completion'.on_attach 
}

-- nvim-lsputils
vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

-- my diagnostic overrides
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
 vim.lsp.diagnostic.on_publish_diagnostics, {
   -- Enable underline, use default values
   underline = true,
   -- Enable virtual text, override spacing to 4
   virtual_text = {
     spacing = 2,
     severity_limit = "Warning",
   },
   -- Use a function to dynamically turn signs off
   -- and on, using buffer local variables
   --signs = function(bufnr, client_id)
     --return vim.bo[bufnr].show_signs == false
   --end,
 }
)
