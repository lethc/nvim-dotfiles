local ui_config = require("modules.ui.configs")
local modules = {
    {
        "preservim/vim-colors-pencil",
        -- config = function()
        --   vim.g.tex_conceal = ""
        --   vim.g['pencil#conceallevel'] = 0
        --   vim.g['pencil#wrapModeDefault'] = 'soft'
        -- end,
    },
    {
        "lethc/colorscheme-nvim",
        config = function()
            require("tokyonight").setup({
                transparent = true, -- Enable this to disable setting the background color
            })
        end,
    },
    -- { "folke/tokyonight.nvim", enabled = true },
    { "catppuccin/nvim", name = "catppuccin" },
    { "cryptomilk/nightcity.nvim", version = false, enabled = false },
    { "lvim-tech/lvim-colorscheme", enabled = false },
    { "edmondburnett/leeward.nvim", enabled = false },
    {
        "rockyzhang24/arctic.nvim",
        enabled = false,
        dependencies = { "rktjmp/lush.nvim" },
    },
    { "RaphaeleL/my_vivid", enabled = false },
    { "gantoreno/nvim-gabriel", enabled = false },
    {
        "lethc/Canon.nvim",
        config = function()
            vim.g.canon_italic_comments = true
            vim.g.canon_italic_functions = false
            vim.g.canon_bold_functions = false
            -- vim.g.canon_transparent = true
            vim.g.canon_bold_keywords = false
            vim.g.canon_italic_keywords = false
        end,
    },
    {
        "jadnw/aesthetic.nvim",
        enabled = false,
        config = function()
            require("aesthetic").setup({
                accent = "green", -- values: "orange", "teal", "white", "cyan", "green", "magenta", "purple", "red", "blue", "yellow"
                style = "hard", -- values: "default", "soft", "hard"
                options = {
                    transparent = false, -- if true, background is transparent
                    terminal_colors = true, -- if true, set terminal colors
                    -- set style: "NONE", "italic", "bold", "underline", "undercurl"
                    styles = {
                        attributes = "NONE",
                        booleans = "NONE",
                        comments = "italic",
                        functions = "italic,bold",
                        keywords = "bold",
                        numbers = "NONE",
                        parameters = "NONE",
                        strings = "NONE",
                        types = "NONE",
                        variables = "NONE",
                    },
                    -- set invert colors
                    inverse = {
                        match_paren = false,
                        visual = false,
                        search = false,
                    },
                    -- enable plugin highlightings
                    plugins = {
                        bufferline = true,
                        cmp = true,
                        dashboard = true,
                        diagnostic = {
                            enable = true,
                            background = true,
                        },
                        gitsigns = true,
                        illuminate = true,
                        lspsaga = true,
                        lsp_signature = true,
                        notify = true,
                        nvimtree = true,
                        scrollbar = true,
                        telescope = true,
                        treesitter = true,
                        trouble = true,
                        tsrainbow = true,
                        whichkey = true,
                    },
                },
            })
        end,
    },
    {
        "ramojus/mellifluous.nvim",
        enabled = false,
        config = function()
            require("mellifluous").setup({
                dim_inactive = true,
                color_set = "mellifluous",
                styles = { -- see :h attr-list for options. set {} for NONE, { option = true } for option
                    comments = { italic = true },
                    conditionals = {},
                    folds = {},
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                },
                transparent_background = {
                    enabled = false,
                    floating_windows = true,
                    telescope = true,
                    file_tree = true,
                    cursor_line = true,
                    status_line = false,
                },
                flat_background = {
                    line_numbers = false,
                    floating_windows = false,
                    file_tree = false,
                    cursor_line_number = false,
                },
                plugins = {
                    cmp = true,
                    gitsigns = true,
                    indent_blankline = true,
                    nvim_tree = {
                        enabled = true,
                        show_root = false,
                    },
                    telescope = {
                        enabled = true,
                        nvchad_like = true,
                    },
                    startify = true,
                },
            })
        end,
    },
    {
        "projekt0n/github-nvim-theme",
        enabled = false,
        config = function()
            require("github-theme").setup({
                options = {
                    styles = {
                        comments = "italic",
                        keywords = "bold",
                        types = "italic,bold",
                    },
                },
            })
        end,
    },
    {
        "AstroNvim/astrotheme",
        enabled = false,
        config = function()
            require("astrotheme").setup({
                style = {
                    transparent = false, -- Bool value, toggles transperency.
                    inactive = true, -- Bool value, toggles inactive window color.
                    float = true, -- Bool value, toggles floating windows background colors.
                    popup = true, -- Bool value, toggles popup background color.
                    neotree = true, -- Bool value, toggles neo-trees background color.
                    border = true, -- Bool value, toggles borders.
                    title_invert = true, -- Bool value, swaps text and background colors.
                    italic_comments = true, -- Bool value, toggles italic comments.
                    simple_syntax_colors = true, -- Bool value, simplifies the amounts of colors used for syntax highlighting.
                },
            })
        end,
    },
    {
        "EdenEast/nightfox.nvim",
        -- enable = false,
    },
    {
        "aktersnurra/no-clown-fiesta.nvim",
        config = function()
            require("no-clown-fiesta").setup({
                transparent = vim.g.transparent_enabled,
                styles = {
                    -- You can set any of the style values specified for `:h nvim_set_hl`
                    comments = { italic = true },
                    keywords = {},
                    functions = {},
                    variables = {},
                    type = { bold = true },
                    lsp = { underline = true },
                },
            })
        end,
    },
    {
        "Alexis12119/nightly.nvim",
        enabled = false,
        config = function()
            require("nightly").setup({
                transparent = vim.g.transparent_enabled,
                styles = {
                    comments = { italic = true },
                    functions = { italic = false },
                    keywords = { italic = false },
                    variables = { italic = false },
                },
                highlights = {
                    -- Normal = { bg = "#000000" }
                },
            })
        end,
    },
    {
        "zaldih/themery.nvim",
        keys = { "<leader>" },
        -- event = "VeryLazy",
        config = ui_config.themery,
    },
    {
        "nvim-lualine/lualine.nvim",
        -- dependencies = { "linrongbin16/lsp-progress.nvim" },
        -- event = { "VeryLazy" },
        event = "BufRead",
        config = ui_config.lualine,
    },
    {
        "rcarriga/nvim-notify",
        lazy = true,
        config = ui_config.nvim_notify,
    },
    {
        "folke/noice.nvim",
        event = "BufReadPre",
        -- event = "VeryLazy",
        -- lazy = true,
        config = ui_config.nvim_noice,
    },
    {
        "echasnovski/mini.indentscope",
        event = "BufReadPre",
        version = "*",
        config = ui_config.indetscope,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        dependencies = {
            { "HiPhish/rainbow-delimiters.nvim" },
        },
        enabled = false,
        main = "ibl",
        -- event = "BufEnter",
        event = "BufReadPre",
        -- event = { 'BufRead', 'BufNewFile' },
        config = ui_config.indent_blankline,
    },
    {
        "karb94/neoscroll.nvim",
        config = ui_config.neoscroll_nvim,
        keys = {
            { "<S-k>", mode = { "n", "v", "x" } },
            { "<S-j>", mode = { "n", "v", "x" } },
            { "<C-d>", mode = { "n", "v", "x" } },
            { "<C-u>", mode = { "n", "v", "x" } },
            { "<C-f>", mode = { "n", "v", "x" } },
            { "<C-b>", mode = { "n", "v", "x" } },
            { "<C-e>", mode = { "n", "v", "x" } },
            { "<C-y>", mode = { "n", "v", "x" } },
        },
    },
    {
        "kevinhwang91/nvim-ufo",
        -- event = "BufReadPre",
        event = { "BufRead", "BufNewFile" },
        dependencies = {
            "kevinhwang91/promise-async",
            {
                "luukvbaal/statuscol.nvim",
                config = function()
                    local builtin = require("statuscol.builtin")
                    require("statuscol").setup({
                        relculright = true,
                        segments = {
                            { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
                            { text = { "%s" }, click = "v:lua.ScSa" },
                            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
                        },
                    })
                end,
            },
        },
        config = ui_config.nvim_ufo,
    },
    {
        "Pocco81/true-zen.nvim",
        dependencies = {
            "folke/twilight.nvim",
        },
        keys = {
            { "<leader>j", "<cmd>TZAtaraxis<cr>", desc = "Zen" },
        },
        config = ui_config.true_zen,
    },
    {
        "xiyaowong/transparent.nvim",
        -- event = "BufReadPre",
        -- keys = { "<leader>" },
        config = ui_config.transparent,
    },
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = ui_config.alpha,
    },
    {
        "wfxr/minimap.vim",
        cmd = { "MinimapToggle" },
        config = function()
            vim.g.minimap_width = 20
            vim.g.minimap_auto_start = 1
            vim.g.minimap_auto_start_win_enter = 1
        end,
    },
}

return modules
