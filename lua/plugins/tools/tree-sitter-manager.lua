return {
    "romus204/tree-sitter-manager.nvim",
    enabled = true,
    cond = not vim.g.vscode,
    dependencies = {},
    config = function()
        local parsers = {
            "awk",
            "bash",
            "c",
            "cmake",
            "comment",
            "cpp",
            "css",
            "csv",
            "diff",
            "dockerfile",
            "dot",
            "editorconfig",
            "embedded_template",
            "git_config",
            "git_rebase",
            "gitcommit",
            "gitignore",
            "go",
            "gomod",
            "graphql",
            "hcl",
            "hjson",
            "html",
            "http",
            "ini",
            "java",
            "javascript",
            "jq",
            "jsdoc",
            "json",
            "json5",
            "lua",
            "luadoc",
            "make",
            "markdown",
            "markdown_inline",
            "ninja",
            "nix",
            "perl",
            "php",
            "powershell",
            "proto",
            "python",
            "regex",
            "rst",
            "ron",
            "ruby",
            "rust",
            "scss",
            "sql",
            "ssh_config",
            "starlark",
            "tmux",
            "toml",
            "typescript",
            "vim",
            "vue",
            "xml",
            "yaml",
            "zig",
        }

        require("tree-sitter-manager").setup({
            -- Default Options
            ensure_installed = parsers,
            -- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
            auto_install = true, -- if enabled, install missing parsers when editing a new file
            highlight = true, -- treesitter highlighting is enabled by default
            languages = {
                -- python = {
                --   install_info = {
                --     use_repo_queries = true,
                --   },
                -- },
            }, -- override or add new parser sources
            -- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
            -- query_dir = vim.fn.stdpath("data") .. "/site/queries",
        })

        -- vim.api.nvim_create_autocmd("FileType", {
        --   pattern = languages,
        --   callback = function()
        --     vim.treesitter.start()
        --   end,
        -- })
    end,
}
