local edit_config = require("modules.utils.configs")
local modules = {
    {
        "nvim-telescope/telescope.nvim",
        -- tag = '0.1.4',
        cmd = "Telescope",
        keys = {
            -- { "<leader>b" , "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({sort_lastused = true, previewer = false}))<CR>", desc = "Buffers"},
            {
                "<leader>b",
                "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({previewer = false}))<CR>",
                desc = "Buffers",
            },
            {
                "<leader>sf",
                "<Cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>",
                desc = "Telescope find files",
            },
            { "<leader>si", "<Cmd>Telescope notify<CR>", desc = "Telescope Notify" },
            { "<leader>sF", "<Cmd>Telescope live_grep<CR>", desc = "Telescope live grep" },
            { "<leader>n", "<Cmd>Telescope file_browser<CR>", desc = "Telescope file browser" },
            { "<leader>sb", "<Cmd>Telescope buffers<CR>", desc = "Telescope buffers" },
            { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Telescope old files" },
        },
        dependencies = {
            "nvim-telescope/telescope-file-browser.nvim",
            {
                "danielfalk/smart-open.nvim",
                branch = "0.2.x",
                "kkharji/sqlite.lua",
                -- Only required if using match_algorithm fzf
                { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            },
            {
                "tiagovla/scope.nvim",
                -- event = "VimEnter",
                config = function()
                    require("scope").setup({ restore_state = true })
                end,
            },
        },
        config = edit_config.telescope_nvim,
    },
    -- {
    --   'LukasPietzschmann/telescope-tabs',
    --   dependencies = {
    --     'nvim-telescope/telescope.nvim',
    --   },
    --   config = function()
    --     require'telescope-tabs'.setup{
    --       -- Your custom config :^)
    --     }
    --  end
    -- },
    {
        "folke/which-key.nvim",
        -- event = "VeryLazy",
        keys = {
            { "z", mode = { "n" } },
            { "'", mode = { "n" } },
            "<leader>",
        },
        config = edit_config.which_key,
    },
    {
        "echasnovski/mini.files",
        keys = {
            {
                "<Leader>e",
                function()
                    -- require("mini.files").open()
                    require("mini.files").open(vim.api.nvim_buf_get_name(0))
                end,
                desc = "Mini files Current Directory",
            },
            {
                "<Leader>E",
                function()
                    -- require("mini.files").open()
                    require("mini.files").open()
                end,
                desc = "Mini files Project Directory",
            },
        },
        config = edit_config.mini_files,
    },
    -- {
    --   'echasnovski/mini.clue',
    --   version = '*',
    --   config = edit_config.mini_clue,
    -- },
    { "HampusHauffman/block.nvim", cmd = { "Block", "BlockOn" }, config = edit_config.block },
    {
        "roobert/search-replace.nvim",
        cmd = {
            "SearchReplaceSingleBufferCExpr",
            "SearchReplaceSingleBufferCFile",
            "SearchReplaceSingleBufferOpen",
            "SearchReplaceSingleBufferSelections",
            "SearchReplaceSingleBufferCWord",
            "SearchReplaceSingleBufferCWORD",
        },
        config = edit_config.search_replace,
    },
    { "uga-rosa/ccc.nvim", cmd = "CccPick" }, --Colorpicker
    {
        "NvChad/nvim-colorizer.lua",
        ft = { "vim", "html", "css", "python", "vue", "js", "ts" }, --"markdown"
        cmd = "ColorizerToggle",
        config = edit_config.nvim_colorizer,
    }, --Display colors
    {
        "numToStr/Comment.nvim",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
        config = edit_config.comment,
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        -- keys = {
        --   { "<leader>am", [[<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]], desc = "Toggle Menu" },
        --   { "<leader>aa", [[<cmd>lua require("harpoon.mark").add_file()<CR>]],        desc = "Add File" },
        --   { "<leader>aq", [[<cmd>lua require("harpoon.ui").nav_file(1)<CR>]],         desc = "Add File" },
        --   { "<leader>aw", [[<cmd>lua require("harpoon.ui").nav_file(2)<CR>]],         desc = "Add File" },
        --   { "<leader>ae", [[<cmd>lua require("harpoon.ui").nav_file(3)<CR>]],         desc = "Add File" },
        --   { "<leader>ar", [[<cmd>lua require("harpoon.ui").nav_file(4)<CR>]],         desc = "Add File" },
        --   { "<leader>at", [[<cmd>lua require("harpoon.ui").nav_file(5)<CR>]],         desc = "Add File" },
        --   { "<leader>ay", [[<cmd>lua require("harpoon.ui").nav_file(6)<CR>]],         desc = "Add File" },
        --   { "<leader>au", [[<cmd>lua require("harpoon.ui").nav_file(7)<CR>]],         desc = "Add File" },
        --   { "<leader>ai", [[<cmd>lua require("harpoon.ui").nav_file(8)<CR>]],         desc = "Add File" },
        --   { "<leader>ao", [[<cmd>lua require("harpoon.ui").nav_file(9)<CR>]],         desc = "Add File" },
        -- },
        config = edit_config.harpoon,
    },
    {
        "folke/flash.nvim",
        event = { "InsertEnter" },
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump({
                        search = { forward = true, wrap = false, multi_window = false },
                    })
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump({
                        search = { forward = false, wrap = false, multi_window = false },
                    })
                end,
                desc = "Flash Treesitter",
            },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash",
            },
            {
                "R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Treesitter Search",
            },
            {
                "<c-s>",
                mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search",
            },
            { "/", mode = { "n" } },
            { "f", mode = { "n" } },
            { "F", mode = { "n" } },
            { "t", mode = { "n" } },
            { "T", mode = { "n" } },
        },
        config = edit_config.flash_nvim,
    },
    -- {
    --   "ecthelionvi/NeoComposer.nvim",
    --   event = { "BufReadPre" },
    --   branch = "main",
    --   -- commit = "d1d17ebef4d5824517076c4c94fe479ba28b2d56",
    --   -- keys = {
    --   --   { "m", mode = { "n" } }
    --   -- },
    --   config = edit_config.NeoComposer_nvim,
    -- },
    -- {
    --  "chrisgrieser/nvim-recorder",
    --   keys = {
    --     -- these must match the keys in the mapping config below
    --     { "q", desc = " Start Recording" },
    --     { "Q", desc = " Play Recording" },
    --   },
    --   config = edit_config.nvim_recorder,
    -- },
    {
        "epwalsh/obsidian.nvim",
        -- cmd = { "ObsidianSearch", "ObsidianQuickSwitch", "ObsidianOpen", "PeekOpen", "PeekClose", "ObsidianTemplate", "ObsidianFollowLink", "ObsidianToday", "ObsidianYesterday" },
        version = "*", -- recommended, use latest release instead of latest commit
        event = {
            "BufReadPre " .. vim.fn.expand("~") .. "/Home/**.md",
            "BufNewFile " .. vim.fn.expand("~") .. "/Home/**.md",
        },
        -- keys = { "<Leader>o" },
        -- dependencies = {
        --   'junegunn/fzf.vim'
        -- },
        config = edit_config.obsidian_nvim,
    },
    {
        "xorid/asciitree.nvim",
        keys = { "<leader>ca", "<cmd>lua require('asciitree').setup()<CR>" },
        config = edit_config.asciitree_nvim,
    },
    {
        -- "turbio/bracey.vim",
        "lethc/bracey.vim",
        ft = "html",
        build = "npm install --prefix server",
        config = function()
            vim.cmd([[
        let g:bracey_browser_command='naver-whale-stable --new-window'
      ]])
        end,
    },
    {
        "samjwill/nvim-unception", --Open files from Neovim's terminal
        event = "VeryLazy",
        init = function()
            -- Optional settings go here!
            -- vim.g.unception_open_buffer_in_new_tab = true
            vim.g.unception_enable_flavor_text = true
            vim.g.unception_delete_replaced_buffer = false
            vim.api.nvim_create_autocmd("User", {
                pattern = "UnceptionEditRequestReceived",
                callback = function()
                    -- Toggle the terminal off.
                    require("FTerm").toggle()
                    -- require("FTerm").close()
                end,
            })
        end,
    },
    {
        "numToStr/FTerm.nvim",
        keys = {
            "<leader>",
            { "<A-g>", "<cmd><cr>", desc = "Gitui" },
            { "<A-c>", "<cmd><cr>", desc = "ncdu" },
            { "<A-y>", "<cmd><cr>", desc = "Yazi" },
            -- { "<A-d>",           "<cmd>FTermToggle<cr>", desc = "FTerm" },
            -- { "<leader>tf",      "<cmd>FTermToggle<cr>", desc = "Toggle Terminal" },
            { "<leader><Enter>", "<cmd>FTermEnter<cr>", desc = "Execute in Terminal" },
        },
        config = edit_config.fterm,
    },
    {
        "DreamMaoMao/yazi.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        keys = {
            "<leader>",
            -- { "<leader>ty", "<cmd>Yazi<CR>", desc = "Toggle Yazi" },
        },
    },
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        build = "cd app && yarn install",
        -- build = function()
        --   vim.fn["mkdp#util#install"]()
        -- end,
        -- build = "cd app && npm install && git reset --hard",
        config = edit_config.markdown_preview,
    },
    { -- Compiler
        "Zeioth/compiler.nvim",
        cmd = { "CompilerOpen", "CompilerToggleResults" },
        dependencies = { "stevearc/overseer.nvim" },
        config = function(_, opts)
            require("compiler").setup(opts)
        end,
    },
    { -- The framework that compiler use to run tasks
        "stevearc/overseer.nvim",
        commit = "19aac0426710c8fc0510e54b7a6466a03a1a7377",
        cmd = { "CompilerOpen", "CompilerToggleResults" },
        opts = {
            -- Tasks are disposed 5 minutes after running to free resources.
            -- If you need to close a task inmediatelly:
            -- press ENTER in the menu you see after compiling on the task you want to close.
            task_list = {
                direction = "bottom",
                min_height = 25,
                max_height = 25,
                default_detail = 1,
                bindings = {
                    ["q"] = function()
                        vim.cmd("OverseerClose")
                    end,
                },
            },
        },
    },
    {
        "CRAG666/code_runner.nvim",
        config = true,
        cmd = { "RunCode", "RunFile", "RunProject", "CompilerOpen" },
        -- keys = { "<Leader>r" },
    },
    -- {
    --   "kndndrj/nvim-dbee",
    --   -- dependencies = {
    --   --   "MunifTanjim/nui.nvim",
    --   -- },
    --   lazy = true,
    --   build = function()
    --     -- Install tries to automatically detect the install method.
    --     -- if it fails, try calling it with one of these parameters:
    --     --    "curl", "wget", "bitsadmin", "go"
    --     require("dbee").install()
    --   end,
    --   config = function()
    --     require("dbee").setup({ --[[optional config]]
    --       sources = {
    --         require("dbee.sources").MemorySource:new({
    --           {
    --             name = "testdb",
    --             url = "mysql://user:passwd@localhost:3306",
    --             type = "mysql",
    --           },
    --           -- ...
    --         }),
    --
    --       }
    --     })
    --   end,
    -- },
    -- Database connections
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
            "tpope/vim-dadbod",
            "kristijanhusak/vim-dadbod-completion",
            "tpope/vim-dotenv",
        },
        keys = { { "<leader><leader>wd", ":DBUIToggle<cr>", desc = "Open Database client" } },
        init = function()
            vim.g.db_ui_use_nerd_fonts = 1
            vim.g.db_ui_show_database_icon = 1
            vim.g.db_ui_force_echo_notifications = 1
            vim.g.db_ui_win_position = "left"
            vim.g.db_ui_winwidth = 40

            vim.g.db_ui_table_helpers = {
                mysql = {
                    Count = "select count(1) from {optional_schema}{table}",
                    Explain = "EXPLAIN {last_query}",
                },
                sqlite = {
                    Describe = "PRAGMA table_info({table})",
                },
            }

            vim.g.db_ui_icons = {
                expanded = {
                    db = "▾ 󰆼",
                    buffers = "▾ ",
                    saved_queries = "▾ ",
                    schemas = "▾ ",
                    schema = "▾ 󰙅",
                    tables = "▾ 󰓱",
                    table = "▾ ",
                },
                collapsed = {
                    db = "▸ 󰆼",
                    buffers = "▸ ",
                    saved_queries = "▸ ",
                    schemas = "▸ ",
                    schema = "▸ 󰙅",
                    tables = "▸ 󰓱",
                    table = "▸ ",
                },
                saved_query = "",
                new_query = "󰓰",
                tables = "󰓫",
                buffers = "󱈛",
                add_connection = "󰆺",
                connection_ok = "✓",
                connection_error = "✕",
            }
        end,
    },
    {
        "backdround/global-note.nvim",
        config = function()
            local global_note = require("global-note")
            global_note.setup({
                filename = "Today.md",
                -- directory = vim.fn.stdpath("data") .. "/global-note/",
                directory = os.getenv("HOME") .. "/Home/Templates/",
                title = "Today List",
            })

            vim.keymap.set("n", "<leader>k", global_note.toggle_note, {
                desc = "Toggle global note",
            })
        end,
    },
    {
        "rolv-apneseth/tfm.nvim",
        lazy = false,
        opts = {
            -- TFM to use
            -- Possible choices: "ranger" | "nnn" | "lf" | "vifm" | "yazi" (default)
            file_manager = "yazi",
            -- Replace netrw entirely
            -- Default: false
            replace_netrw = false,
            -- Enable creation of commands
            -- Default: false
            -- Commands:
            --   Tfm: selected file(s) will be opened in the current window
            --   TfmSplit: selected file(s) will be opened in a horizontal split
            --   TfmVsplit: selected file(s) will be opened in a vertical split
            --   TfmTabedit: selected file(s) will be opened in a new tab page
            enable_cmds = false,
            -- Custom keybindings only applied within the TFM buffer
            -- Default: {}
            keybindings = {
                ["<ESC>"] = "q"
            },
            -- Customise UI. The below options are the default
            ui = {
                border = "rounded",
                height = 1,
                width = 1,
                x = 0.5,
                y = 0.5,
            },
        },
        keys = {
            {
                "<leader>y",
                function()
                    require("tfm").open()
                end,
                desc = "TFM",
            },
            {
                "<leader>es",
                function()
                    local tfm = require("tfm")
                    tfm.open(nil, tfm.OPEN_MODE.split)
                end,
                desc = "TFM - horizonal split",
            },
            {
                "<leader>ev",
                function()
                    local tfm = require("tfm")
                    tfm.open(nil, tfm.OPEN_MODE.vsplit)
                end,
                desc = "TFM - vertical split",
            },
            {
                "<leader>et",
                function()
                    local tfm = require("tfm")
                    tfm.open(nil, tfm.OPEN_MODE.tabedit)
                end,
                desc = "TFM - new tab",
            },
        },
    }
}
return modules
