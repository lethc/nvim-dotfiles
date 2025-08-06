local ui_config = require("modules.ui.configs")
local modules = {
    {
        "nyoom-engineering/oxocarbon.nvim",
        priority = 1000,
        -- config = function()
        --     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        --     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        --     vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        -- end,
    },
    {
        "zenbones-theme/zenbones.nvim",
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
        -- you can set set configuration options here
        -- config = function()
        --     vim.g.zenbones_darken_comments = 45
        --     vim.cmd.colorscheme('zenbones')
        -- end
    },
    {
        "ficcdaf/ashen.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "https://gitlab.com/bartekjaszczak/finale-nvim",

        priority = 1000,
        config = function()
            -- Activate the theme
            -- vim.cmd.colorscheme("finale")
        end,
    },
    { "akinsho/horizon.nvim", version = "*" },
    {
        "lancewilhelm/horizon-extended.nvim",
        config = function()
            require("horizon-extended").setup({
                style = "neo",
            })
        end,
    },
    {
        "comfysage/evergarden",
        opts = {
            transparent_background = false,
            contrast_dark = "medium", -- 'hard'|'medium'|'soft'
            overrides = {}, -- add custom overrides
        },
    },
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
                transparent = false, -- Enable this to disable setting the background color
            })
        end,
    },
    -- { "folke/tokyonight.nvim", enabled = true },
    -- {
    --     "catppuccin/nvim",
    --     priority = 150,
    --     name = "catppuccin",
    --     config = ui_config.catppuccin,
    -- },
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
        priority = 1000,
        config = function()
            vim.g.canon_transparent = true
            vim.g.canon_italic_comments = true
            vim.g.canon_italic_functions = false
            vim.g.canon_bold_functions = false
            vim.g.canon_bold_keywords = false
            vim.g.canon_italic_keywords = false

            -- Onedark
            vim.g.canon_onedark_transparent = false
            vim.g.canon_onedark_italic_comments = true
            vim.g.canon_onedark_italic_functions = true
            vim.g.canon_onedark_bold_functions = true
            vim.g.canon_onedark_bold_keywords = false
            vim.g.canon_onedark_italic_keywords = true
            vim.g.canon_onedark_bold_booleans = true
            vim.g.canon_onedark_italic_booleans = false
            vim.g.canon_onedark_bold_variables = false
            vim.g.canon_onedark_italic_variables = false
        end,
    },
    {
        "mellow-theme/mellow.nvim",
        config = function()
            vim.g.mellow_italic_comments = true
            vim.g.mellow_italic_functions = false
            vim.g.mellow_bold_functions = false
            vim.g.mellow_transparent = false
            vim.g.mellow_bold_keywords = false
            vim.g.mellow_italic_keywords = false
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
        -- event = "VeryLazy",
        config = ui_config.themery,
    },
    {
        "nvim-lualine/lualine.nvim",
        -- dependencies = { "linrongbin16/lsp-progress.nvim" },
        -- event = { "VeryLazy" },
        event = { "BufRead" },
        dependencies = {
            {
                "Bekaboo/dropbar.nvim",
                opts = {
                    menu = {
                        win_configs = {
                            border = "rounded",
                        },
                    },
                    bar = {
                        enable = false,
                        padding = { left = 0, right = 0 },
                    },
                },
            },
        },
        config = ui_config.lualine,
    },
    {
        "yavorski/lualine-macro-recording.nvim",
        event = "RecordingEnter",
    },
    {
        "folke/noice.nvim",
        dependencies = {
            {
                "rcarriga/nvim-notify",
                config = ui_config.nvim_notify,
            },
        },
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
        "kevinhwang91/nvim-ufo",
        event = "BufReadPost",
        -- event = { "BufRead", "BufNewFile" },
        dependencies = {
            "kevinhwang91/promise-async",
        },
        config = ui_config.nvim_ufo,
    },
    -- {
    --     "luukvbaal/statuscol.nvim",
    --     -- config = function()
    --     --     local builtin = require("statuscol.builtin")
    --     --     require("statuscol").setup({
    --     --         relculright = true,
    --     --         segments = {
    --     --             { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
    --     --             { text = { "%s" }, click = "v:lua.ScSa" },
    --     --             { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
    --     --         },
    --     --     })
    --     -- end,
    --     opts = function()
    --         local builtin = require("statuscol.builtin")
    --         return {
    --             ft_ignore = {
    --                 "neo-tree",
    --                 "neo-tree-popup",
    --                 "alpha",
    --                 "lazy",
    --                 "mason",
    --                 "dashboard",
    --                 "help",
    --                 "vim",
    --                 "alpha",
    --                 "toggleterm",
    --                 "noice",
    --                 "Trouble",
    --             },
    --             relculright = true,
    --             segments = {
    --                 { text = { "  " }, click = "v:lua.ScSa" },
    --                 { text = { builtin.foldfunc, "" }, click = "v:lua.ScFa" },
    --                 { text = { builtin.lnumfunc, "  " }, click = "v:lua.ScLa" },
    --                 {
    --                     text = { "%s" },
    --                     click = "v:lua.ScSa",
    --                     auto = false,
    --                 },
    --                 -- {
    --                 --     -- Dap Breakpoints
    --                 --     sign = { name = { "Dap" }, maxwidth = 1, colwidth = 2, auto = true, fillchars = "" },
    --                 --     click = "v:lua.ScSa",
    --                 -- },
    --                 -- {
    --                 --     sign = { namespace = { "gitsign+" }, maxwidth = 1, colwidth = 1, auto = false, fillchar = " " },
    --                 --     click = "v:lua.ScSa",
    --                 -- },
    --             },
    --         }
    --     end,
    --     config = function(_, opts)
    --         require("statuscol").setup(opts)
    --     end,
    -- },
    -- Not updated since a long while, there's an issue at the moment of toggle off the ataraxis mode
    -- {
    --     "Pocco81/true-zen.nvim",
    --     dependencies = {
    --         "folke/twilight.nvim",
    --     },
    --     keys = {
    --         { "<leader>j", "<cmd>TZAtaraxis<cr>", desc = "Zen" },
    --     },
    --     config = ui_config.true_zen,
    -- },
    {
        "folke/zen-mode.nvim",
        dependencies = {
            "folke/twilight.nvim",
        },
        keys = {
            { "<leader><leader>jk", "<cmd>ZenMode<cr>", desc = "Zen" },
        },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below

            window = {
                backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                -- height and width can be:
                -- * an absolute number of cells when > 1
                -- * a percentage of the width / height of the editor when <= 1
                -- * a function that returns the width or the height
                width = 120, -- width of the Zen window
                height = 1, -- height of the Zen window
                -- by default, no options are changed for the Zen window
                -- uncomment any of the options below, or add other vim.wo options you want to apply
                options = {
                    signcolumn = "no", -- disable signcolumn
                    number = false, -- disable number column
                    relativenumber = false, -- disable relative numbers
                    cursorline = false, -- disable cursorline
                    cursorcolumn = false, -- disable cursor column
                    foldcolumn = "0", -- disable fold column
                    list = false, -- disable whitespace characters
                },
            },
            plugins = {
                -- disable some global vim options (vim.o...)
                -- comment the lines to not apply the options
                options = {
                    enabled = true,
                    ruler = false, -- disables the ruler text in the cmd line area
                    showcmd = false, -- disables the command in the last line of the screen
                    -- you may turn on/off statusline in zen mode by setting 'laststatus'
                    -- statusline will be shown only if 'laststatus' == 3
                    laststatus = 0, -- turn off the statusline in zen mode
                },
                twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
                gitsigns = { enabled = false }, -- disables git signs
                tmux = { enabled = true }, -- disables the tmux statusline
                -- this will change the font size on kitty when in zen mode
                -- to make this work, you need to set the following kitty options:
                -- - allow_remote_control socket-only
                -- - listen_on unix:/tmp/kitty
                kitty = {
                    enabled = false,
                    font = "+4", -- font size increment
                },
                -- this will change the font size on alacritty when in zen mode
                -- requires  Alacritty Version 0.10.0 or higher
                -- uses `alacritty msg` subcommand to change font size
                alacritty = {
                    enabled = false,
                    font = "14", -- font size
                },
                -- this will change the font size on wezterm when in zen mode
                -- See alse also the Plugins/Wezterm section in this projects README
                wezterm = {
                    enabled = false,
                    -- can be either an absolute font size or the number of incremental steps
                    font = "+4", -- (10% increase per step)
                },
            },
            -- callback where you can add custom code when the Zen window opens
            on_open = function(win) end,
            -- callback where you can add custom code when the Zen window closes
            on_close = function() end,
        },
    },
    {
        "xiyaowong/transparent.nvim",
        -- event = "BufReadPre",
        keys = { "<leader>w" },
        config = ui_config.transparent,
    },
    -- {
    --     "goolord/alpha-nvim",
    --     event = "VimEnter",
    --     config = ui_config.alpha,
    -- },
    {
        "wfxr/minimap.vim",
        cmd = { "MinimapToggle" },
        config = function()
            vim.g.minimap_width = 20
            vim.g.minimap_auto_start = 1
            vim.g.minimap_auto_start_win_enter = 1
        end,
    },
    {
        "jake-stewart/normal-cmdline.nvim",
        event = "CmdlineEnter",
        config = function()
            -- make the cmdline insert mode a beam
            vim.opt.guicursor:append("ci:ver1,c:ver1")

            local cmd = require("normal-cmdline")
            cmd.setup({
                -- key to hit within cmdline to enter normal mode:
                key = "<esc>",
                -- the cmdline text highlight when in normal mode:
                hl = "Normal",
                -- these mappings only apply to normal mode in cmdline:
                mappings = {
                    ["k"] = cmd.history.prev,
                    ["j"] = cmd.history.next,
                    ["<cr>"] = cmd.accept,
                    ["<esc>"] = cmd.cancel,
                    ["<c-c>"] = cmd.cancel,
                    [":"] = cmd.reset,
                },
            })
        end,
    },
}

return modules
