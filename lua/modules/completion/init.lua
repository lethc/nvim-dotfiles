local completion_config = require("modules.completion.configs")
local modules = {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-buffer",
            -- "hrsh7th/cmp-path",
            "https://codeberg.org/FelipeLema/cmp-async-path",
            "hrsh7th/cmp-cmdline",
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
        "kdheepak/cmp-latex-symbols",
        ft = "tex",
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
    -- { "bullets-vim/bullets.vim", ft = "markdown" },
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
        "supermaven-inc/supermaven-nvim",
        cmd = { "SupermavenStart", "SupermavenToggle" },
        config = function()
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_suggestion = "<A-g>",
                    clear_suggestion = "<C-]>",
                    accept_word = "<C-j>",
                },
            })
        end,
    },
    {
        "preservim/vim-pencil",
        init = function()
            vim.g["pencil#wrapModeDefault"] = "hard"
            vim.g["pencil#textwidth"] = 116
            -- vim.g["pencil#textwidth"] = 90
            vim.g["pencil#autoformat"] = 1 -- Enable autoformat by default (1) or disable (0)
        end,
    },
}

return modules
