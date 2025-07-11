local languages_config = require("modules.languages.configs")
local modules = {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            -- "nvim-treesitter/nvim-treesitter-context",
        },
        event = { "BufReadPost", "BufNewFile" },
        config = languages_config.nvim_treesitter,
    },
    {
        "echasnovski/mini.ai",
        event = "CursorMoved",
        version = "*",
        config = languages_config.mini_ai,
    },
    {
        "RRethy/vim-illuminate",
        -- event = "VeryLazy",
        lazy = true,
    },
    {
        "nvim-java/nvim-java",
        -- dependencies = {
        --     "nvim-java/nvim-java-core",
        --     url = "https://github.com/Kabil777/nvim-java-core.git",
        --     branch = "fix/mason-api-update",
        -- },
        ft = { "java" },
        config = function()
            require("java").setup({
                -- jdtls = {
                --     version = "v1.46.1",
                -- },
            })
            -- require("lspconfig").jdtls.setup({})
        end,
    },
    {
        "mason-org/mason.nvim",
        version = "1.11.0",
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        cmd = "Mason",
        config = languages_config.mason_nvim,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        version = "1.32.0",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason-org/mason.nvim",
        },
        config = languages_config.mason_lspconfig,
    },
    {
        "neovim/nvim-lspconfig",
        -- event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        event = { "BufRead" },
        dependencies = {
            {
                "glepnir/lspsaga.nvim",
                -- event = "LspAttach",
                config = languages_config.lsp_saga,
            },
        },
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
        cmd = "Trouble",
        dependencies = {
            {
                "folke/todo-comments.nvim",
                opts = {
                    keywords = {
                        FIX = {
                            icon = " ", -- icon used for the sign, and in search results
                            color = "#db4b4b", -- can be a hex color, or a named color (see below)
                            alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "DELAYED" }, -- a set of other keywords that all map to this FIX keywords
                            -- signs = false, -- configure signs for some keywords individually
                        },
                        TODO = { icon = " ", color = "#0db9d7" },
                        HACK = { icon = " ", color = "#ff9e64", alt = { "WEEK" } },
                        WARN = { icon = " ", color = "#e0af68", alt = { "WARNING", "XXX", "MEDIUM" } },
                        PERF = {
                            icon = " ",
                            color = "#9d7cd8",
                            alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "MONTH" },
                        },
                        NOTE = { icon = " ", color = "#1abc9c", alt = { "INFO", "LOW" } },
                        TEST = { icon = "⏲ ", color = "#3d59a1", alt = { "TESTING", "PASSED", "FAILED", "TODAY" } },
                    },
                },
            },
        },
        -- keys = {
        --     {
        --         "<leader>xx",
        --         "<cmd>Trouble diagnostics toggle<cr>",
        --         desc = "Diagnostics (Trouble)",
        --     },
        --     {
        --         "<leader>xX",
        --         "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        --         desc = "Buffer Diagnostics (Trouble)",
        --     },
        --     {
        --         "<leader>cs",
        --         "<cmd>Trouble symbols toggle focus=false<cr>",
        --         desc = "Symbols (Trouble)",
        --     },
        --     {
        --         "<leader>cl",
        --         "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        --         desc = "LSP Definitions / references / ... (Trouble)",
        --     },
        --     {
        --         "<leader>xL",
        --         "<cmd>Trouble loclist toggle<cr>",
        --         desc = "Location List (Trouble)",
        --     },
        --     {
        --         "<leader>xQ",
        --         "<cmd>Trouble qflist toggle<cr>",
        --         desc = "Quickfix List (Trouble)",
        --     },
        -- },
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
        -- version = "^6",
        ft = { "rust" },
        config = function()
            vim.g.rustaceanvim = {
                server = {
                    default_settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                allFeatures = true,
                            },
                        },
                    },
                },
            }
        end,
    },
    {
        "Saecki/crates.nvim",
        ft = { "rust", "toml" },
        tag = "stable",
        config = function()
            local crates = require("crates")
            crates.setup({
                -- src = {
                --     cmp = { enabled = true },
                -- },
            })
            crates.show()
        end,
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            dependencies = {
                "nvim-neotest/nvim-nio",
            },
            keys = {
                {
                    "<leader>ddu",
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
    -- {
    --     "mfussenegger/nvim-jdtls",
    --     ft = "java",
    --     config = languages_config.nvim_jdtls,
    -- },
    {
        "eatgrass/maven.nvim",
        cmd = { "Maven", "MavenExec" },
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("maven").setup({
                executable = "./mvnw",
            })
        end,
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
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require("lint")
            lint.linters_by_ft = {
                javascript = { "eslint_d" },
                typescript = { "eslint_d" },
                javascriptreact = { "eslint_d" },
                typescriptreact = { "eslint_d" },
                svelte = { "eslint_d" },
                python = { "pylint" },
            }
            local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
                pattern = { "*.ts", "*.js" },
                group = lint_augroup,
                callback = function()
                    lint.try_lint()
                end,
            })
            vim.keymap.set("n", "<leader>L", function()
                lint.try_lint()
            end, { desc = "Trigger linting for current file" })
        end,
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
