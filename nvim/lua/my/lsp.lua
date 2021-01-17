local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'

-- npm install -g typescript typescript-language-server
lspconfig.tsserver.setup{ 
  on_attach=require'completion'.on_attach 
}
