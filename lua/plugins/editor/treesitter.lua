return {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        -- branch = "main",
        event = "BufRead",
        build = ":TSUpdate",
        -- event = { "BufReadPost", "BufNewFile" },
        -- config = languages_config.nvim_treesitter,
        opts = {
            -- custom handling of parsers
            ensure_installed = {},
        },
        init = function()
            local ensureInstalled = {
                "astro",
                "bash",
                "c",
                "css",
                "diff",
                "go",
                "gomod",
                "gowork",
                "gosum",
                "graphql",
                "html",
                "javascript",
                "jsdoc",
                "json",
                "json5",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "toml",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
                "ruby",
            }
            local alreadyInstalled = require("nvim-treesitter.config").get_installed()
            local parsersToInstall = vim.iter(ensureInstalled)
                :filter(function(parser)
                    return not vim.tbl_contains(alreadyInstalled, parser)
                end)
                :totable()
            require("nvim-treesitter").install(parsersToInstall)
        end,
    }
