return {
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- or 'event = "VeryLazy"'
    config = function()
        -- require("nvim-treesitter.configs").setup({
        --     ensure_installed = {
        --         "markdown",
        --         "markdown_inline", --[[ other parsers you need ]]
        --     },
        --     markdown = {
        --         enable = true,
        --         -- configuration here or nothing for defaults
        --     },
        -- })
    end,
}
