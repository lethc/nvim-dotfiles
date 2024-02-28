local languages_config = require("modules.languages.configs")
local modules = {
    {
        "nvim-treesitter/nvim-treesitter",
        -- event = "BufEnter",
        -- event = "BufReadPre",
        -- cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        config = languages_config.nvim_treesitter,
    },
    -- { "luckasRanarison/tree-sitter-hypr" },
    {
        "RRethy/vim-illuminate",
        -- event = "VeryLazy",
        lazy = true,
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        cmd = "Mason",
        build = ":MasonUpdate",
        config = languages_config.mason_nvim,
    },
    {
        "neovim/nvim-lspconfig",
        -- event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        event = { "BufRead" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "glepnir/lspsaga.nvim",
                -- event = "LspAttach",
                config = languages_config.lsp_saga,
            },
        },
        -- lazy = true,
        -- config = languages_config.nvim_lspconfig,
    },
    {
        "SmiteshP/nvim-navbuddy",
        event = "LspAttach",
        config = languages_config.nvim_navbuddy,
    },
    {
        "SmiteshP/nvim-navic",
        event = "LspAttach",
        config = languages_config.nvim_navic,
    },
    {
        "folke/trouble.nvim",
        cmd = {
            "TroubleToggle",
            "TroubleToggle workspace_diagnostics",
            "TroubleToggle document_diagnostics",
            "TroubleToggle loclist",
            "TroubleToggle quickfix",
            "TroubleToggle lsp_references",
            "TroubleClose",
            "TroubleRefresh",
        },
        config = languages_config.trouble_nvim,
    },
    -- { --#### RUST LANGUAGE ####
    --   "simrat39/rust-tools.nvim",
    --   -- lazy = true,
    --   ft = { "rust" },
    --   config = languages_config.rust_tools,
    -- },
    { --#### RUST LANGUAGE ####
        "mrcjkb/rustaceanvim",
        version = "^3", -- Recommended
        ft = { "rust" },
    },
    {
        "Saecki/crates.nvim",
        ft = { "rust", "toml" },
        config = function()
            local crates = require("crates")
            crates.setup({
                src = {
                    cmp = { enabled = true },
                },
            })
            crates.show()
        end,
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            keys = {
                {
                    "<leader>du",
                    function()
                        require("dapui").toggle({})
                    end,
                    desc = "Dap UI",
                },
            },
        },
        lazy = true,
        config = languages_config.dap,
    },
    {
        "mfussenegger/nvim-jdtls",
        ft = "java",
        config = languages_config.nvim_jdtls,
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        -- event = "VeryLazy"
        lazy = true,
    },
    -- {
    --   "jose-elias-alvarez/null-ls.nvim",
    --   -- keys = "<space>l",
    --   event = "LspAttach",
    --   config = languages_config.null_ls,
    -- },
    {
        "stevearc/conform.nvim",
        event = "LspAttach",
        config = languages_config.conform_nvim,
    },
    {
        "mfussenegger/nvim-lint",
        event = "LspAttach",
        config = function ()
            local lint = require("lint");
            lint.linters_by_ft = {
                javascript = { "eslint_d" },
                typescript = { "eslint_d" },
                javascriptreact = { "eslint_d" },
                typescriptreact = { "eslint_d" },
                svelte = { "eslint_d" },
                python = { "pylint" },
            }
            local lint_autogroup = vim.api.nvim_create_autogroup("lint", { clear = true })
            vim.api.nvim_create_autocmd({ "BufWritePost"  }, {
                -- pattern = { "*.ts", "*.js" },
                group = lint_autogroup,
                callback = function ()
                    lint.try_lint()
                end,
            })
            vim.keymap.set("n", "<leader>L", function ()
                lint.try_lint()
            end, { desc = "Trigger linting for current file" })
        end
    },
    -- {
    --   "mhartington/formatter.nvim",
    --   config = languages_config.formatter_nvim,
    -- },
    {
        "MaximilianLloyd/tw-values.nvim",
        keys = {
            { "<leader>lv", "<cmd>TWValues<cr>", desc = "Show tailwind CSS values" },
        },
        opts = {
            border = "rounded", -- Valid window border style,
            show_unknown_classes = true, -- Shows the unknown classes popup
            focus_preview = true, -- Sets the preview as the current window
            copy_register = "", -- The register to copy values to,
            keymaps = {
                copy = "<C-y>", -- Normal mode keymap to copy the CSS values between {}
            },
        },
    },
}
return modules
