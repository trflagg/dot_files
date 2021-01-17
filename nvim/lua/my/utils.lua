-- for inspecting contents of namespaces
-- e.g. dump(vim.lsp)
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end
