local completion_config = require("modules.completion.configs")
local modules = {
    {
        -- "hrsh7th/nvim-cmp",
        "iguanacucumber/magazine.nvim", -- nvim-cmp fork with Performance Improvements
        -- name = "nvim-cmp", -- Otherwise highlighting gets messed up (Fo some reason it installs nvim-cmp and disables magazine.)
        dependencies = {
            -- "hrsh7th/cmp-nvim-lsp",
            "iguanacucumber/mag-nvim-lsp",
            "iguanacucumber/mag-nvim-lua",
            "saadparwaiz1/cmp_luasnip",
            -- "hrsh7th/cmp-buffer",
            "iguanacucumber/mag-buffer",
            -- "hrsh7th/cmp-path",
            "https://codeberg.org/FelipeLema/cmp-async-path",
            "kdheepak/cmp-latex-symbols",
            -- "hrsh7th/cmp-cmdline",
            "iguanacucumber/mag-cmdline",
            "rafamadriz/friendly-snippets",
            "chrisgrieser/cmp-nerdfont",
            "amarakon/nvim-cmp-fonts",
            "onsails/lspkind.nvim",
            "roobert/tailwindcss-colorizer-cmp.nvim",
        },
        event = { "InsertEnter" },
        keys = {
            { "/", mode = { "n" } },
        },
        config = completion_config.nvim_cmp,
    },
    {
        "L3MON4D3/LuaSnip",
        event = { "InsertEnter" },
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = completion_config.nvim_autopairs,
    },
    {
        "kylechui/nvim-surround",
        -- event = "VeryLazy",
        keys = {
            { "ysiw", mode = { "n" } },
            { "ysst", mode = { "n" } },
            { "ys$", mode = { "n" } },
            { "ds", mode = { "n" } },
            { "dst", mode = { "n" } },
            { "cs", mode = { "n" } },
            { "cst", mode = { "n" } },
            { "dsf", mode = { "n" } },
        },
        config = completion_config.nvim_surround,
    },
    -- {
    --     "jakewvincent/mkdnflow.nvim",
    --     ft = "markdown",
    --     config = completion_config.mkdnflow_nvim,
    -- },
    { "bullets-vim/bullets.vim", ft = "markdown" },
    -- {
    --     "lethc/clipboard-image.nvim", --forked from  "ekickx/clipboard-image.nvim",
    --     keys = { "<leader>wp", "<cmd>lua require('clipboard-image').setup()<CR>" },
    --     config = completion_config.clipboard_image,
    -- },
    {
        "HakonHarnes/img-clip.nvim",
        keys = {
            -- { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
            {
                "<A-p>",
                function()
                    require("img-clip").paste_image()
                end,
                desc = "Paste image from system clipboard",
            },
        },
        opts = {
            default = {
                dir_path = "assets/img",
            },
        },
    },
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        config = function() end,
    },
    {
        "Exafunction/codeium.nvim",
        -- event = { "InsertEnter" },
        keys = {
            {
                "<Leader>cc",
                function()
                    require("codeium").setup({})
                end,
                desc = "Codeium nvim",
            },
        },
    },
    {
        "Exafunction/codeium.vim",
        -- event = 'BufEnter',
        cmd = "CodeiumEnable",
        config = function()
            vim.keymap.set("i", "<A-g>", function()
                return vim.fn["codeium#Accept"]()
            end, { expr = true, silent = true })
            vim.keymap.set("i", "<c-,>", function()
                return vim.fn["codeium#CycleCompletions"](1)
            end, { expr = true, silent = true })
            vim.keymap.set("i", "<c-.>", function()
                return vim.fn["codeium#CycleCompletions"](-1)
            end, { expr = true, silent = true })
            vim.keymap.set("i", "<c-x>", function()
                return vim.fn["codeium#Clear"]()
            end, { expr = true, silent = true })
        end,
    },
    -- {
    --     "supermaven-inc/supermaven-nvim",
    --     event = "BufReadPost",
    --     config = function()
    --         require("supermaven-nvim").setup({
    --             keymaps = {
    --                 accept_suggestion = "<A-g>",
    --                 clear_suggestion = "<C-]>",
    --                 accept_word = "<C-j>",
    --             },
    --         })
    --     end,
    -- },
    {
        "preservim/vim-pencil",
        init = function()
            vim.g["pencil#wrapModeDefault"] = "hard"
            vim.g["pencil#textwidth"] = 116
            vim.g["pencil#autoformat"] = 1 -- Enable autoformat by default (1) or disable (0)
        end,
    },
}

return modules
