local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
    return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
M.on_attach = function(client)
    -- if client.name == "tsserver" then
    --     client.server_capabilities.documentFormattingProvider = false
    -- end
    -- if client.name == "jdt.ls" then
    -- 	client.server_capabilities.documentFormattingProvider = false
    -- end
    if client.name == "jdtls" then
        if JAVA_DAP_ACTIVE then
            require("jdtls").setup_dap({ hotcodereplace = "auto" })
            require("jdtls.dap").setup_dap_main_class_configs()
            -- vim.lsp.codelens.refresh()
        end
        -- client.server.documentFormattingProvider = false
        client.server_capabilities.documentFormattingProvider = false
        -- client.server.textDocument.completion.completionItem.snippetSupport = false
        -- client.server_capabilities.textDocument.completion.completionItem.snippetSupport = false
        -- vim.lsp.codelens.refresh()
    end
    if client.name == "lua_lua" then
        client.server_capabilities.documentFormattingProvider = false
    end
    -- if client.name == "rust_analyzer" then
    --
    -- end
    local status_ok, illuminate = pcall(require, "illuminate")
    if not status_ok then
        return
    end
    illuminate.on_attach(client)
end

return M
