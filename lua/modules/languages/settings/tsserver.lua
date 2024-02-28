return {
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = function()
        return vim.loop.cwd()
    end,
    -- root_dir = require("lspconfig").util.root_pattern("package.json"),
}
