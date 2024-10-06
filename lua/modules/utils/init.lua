local edit_config = require("modules.utils.configs")
local modules = {
    {
        "nvim-telescope/telescope.nvim",
        -- tag = '0.1.4',
        cmd = "Telescope",
        keys = {
            -- { "<leader>b" , "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({sort_lastused = true, previewer = false}))<CR>", desc = "Buffers"},
            -- {
            --     "<leader>b",
            --     "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({previewer = false}))<CR>",
            --     desc = "Buffers",
            -- },
            -- {
            --     "<leader>sf",
            --     "<Cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>",
            --     desc = "Telescope find files",
            -- },
            { "<leader>si", "<Cmd>Telescope notify<CR>", desc = "Telescope Notify" },
            -- { "<leader>sF", "<Cmd>Telescope live_grep<CR>", desc = "Telescope live grep" },
            -- { "<leader>n", "<Cmd>Telescope file_browser<CR>", desc = "Telescope file browser" },
            -- { "<leader>sb", "<Cmd>Telescope buffers<CR>", desc = "Telescope buffers" },
            -- { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Telescope old files" },
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
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            {
                "<Leader>sa",
                function()
                    vim.cmd("FzfLua")
                end,
                desc = "FzfLua",
            },
            {
                "<Leader>sf",
                function()
                    vim.cmd("FzfLua files")
                end,
                desc = "FzfLua files",
            },
            {
                "<Leader>sF",
                function()
                    vim.cmd("FzfLua live_grep")
                end,
                desc = "FzfLua search text (live grep)",
            },
            {
                "<Leader>sr",
                function()
                    vim.cmd("FzfLua oldfiles")
                end,
                desc = "FzfLua oldfiles",
            },
            {
                "<Leader>b",
                function()
                    vim.cmd("FzfLua buffers")
                end,
                desc = "FzfLua buffers",
            },
            -- {
            --     "<leader>b",
            --     "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({previewer = false}))<CR>",
            --     desc = "Buffers",
            -- },
            -- { "<leader>si", "<Cmd>Telescope notify<CR>", desc = "Telescope Notify" },
            -- { "<leader>n", "<Cmd>Telescope file_browser<CR>", desc = "Telescope file browser" },
            -- { "<leader>sb", "<Cmd>Telescope buffers<CR>", desc = "Telescope buffers" },
            -- { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Telescope old files" },
        },
        config = edit_config.fzf_lua,
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
    -- {
    --     "folke/which-key.nvim",
    --     -- event = "VeryLazy",
    -- },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        cmd = "WhichKey",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        -- keys = {
        --     {
        --         "<leader>",
        --         function()
        --             require("which-key").show({ global = true })
        --         end,
        --         desc = "Buffer Local Keymaps (which-key)",
        --     },
        -- },
        keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "g" },
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
    { --Colorpicker
        "uga-rosa/ccc.nvim",
        cmd = "CccPick",
        config = edit_config.ccc,
    },
    {
        "max397574/colortils.nvim",
        cmd = "Colortils",
        config = edit_config.colortils,
    },
    {
        "brenoprata10/nvim-highlight-colors",
        -- ft = { "vim", "html", "css", "python", "vue", "js", "ts" }, --"markdown"
        config = function()
            require("nvim-highlight-colors").setup({})
        end,
    },
    {
        "numToStr/Comment.nvim",
        keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
        config = edit_config.comment,
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = edit_config.context_commentstring,
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
        "Myzel394/easytables.nvim",
        ft = "markdown",
        config = function()
            require("easytables").setup({
                -- Your configuration comes here
            })
        end,
    },
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        ft = "markdown",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- Used by the code bloxks
        },

        config = function()
            require("markview").setup({
                modes = { "n", "i", "no", "c" },
                hybrid_modes = { "i" },

                -- This is nice to have
                callbacks = {
                    on_enable = function(_, win)
                        vim.wo[win].conceallevel = 2
                        vim.wo[win].concealcursor = "c"
                    end,
                },
                headings = {
                    enable = true,
                    shift_width = 0,
                    shift_char = "",
                    heading_1 = {
                        -- sign = "",
                        -- hl = "@markup.heading.1.markdown",
                        hl = "markdownH1",
                    },
                    heading_2 = {
                        -- sign = "",
                        hl = "markdownH2",
                    },
                    heading_3 = {
                        -- sign = "",
                        hl = "markdownH3",
                    },
                    heading_4 = {
                        -- sign = "",
                        hl = "markdownH4",
                    },
                    heading_5 = {
                        -- sign = "",
                        hl = "markdownH5",
                    },
                    heading_6 = {
                        -- sign = "",
                        hl = "markdownH6",
                    },
                },
                code_blocks = {
                    sign = "",
                },
            })
        end,
    },
    {
        "Bekaboo/deadcolumn.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            -- modes = { "i", "n" },
            blending = {
                colorcode = "#1F2430",
                hlgroup = { "NonText", "bg" },
            },
        },
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
        let g:bracey_browser_command='zen-browser --new-window'
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
            vim.g.unception_block_while_host_edits = true
            -- vim.api.nvim_create_autocmd("User", {
            --     pattern = "UnceptionEditRequestReceived",
            --     callback = function()
            --         -- Toggle the terminal off.
            --         require("FTerm").toggle()
            --         -- require("FTerm").close()
            --     end,
            -- })
        end,
    },
    {
        "numToStr/FTerm.nvim",
        keys = {
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
        opts = {
            filetype = {
                c = "cd $dir && clang $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt && rm $fileNameWithoutExt",
                java = "cd $dir && java -cp . $fileName",
                python = "python3 -u",
                typescript = "deno run",
                rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
                javascript = "cd $dir && node $fileName",
            },
            project = {
                ["~/Workspace/JavaDev/mavenproject/my-app"] = {
                    name = "my-app",
                    description = "test",
                    file_name = "src/main/java/com/mycompany/app/app.java",
                    command = "mvn clean package && java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App",
                },
            },
            startinsert = true,
        },
        keys = {
            { "<leader>r", "<esc><cmd>RunCode<CR>", mode = { "n" }, desc = "RunCode" },
        },
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
        config = edit_config.vim_dadbod_ui,
    },
    {
        "backdround/global-note.nvim",
        config = edit_config.global_note,
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
            enable_cmds = true,
            -- Custom keybindings only applied within the TFM buffer
            -- Default: {}
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
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
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
                PERF = { icon = " ", color = "#9d7cd8", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "MONTH" } },
                NOTE = { icon = " ", color = "#1abc9c", alt = { "INFO", "LOW" } },
                TEST = { icon = "⏲ ", color = "#3d59a1", alt = { "TESTING", "PASSED", "FAILED", "TODAY" } },
            },
        },
    },
    {
        "bloznelis/before.nvim",
        config = edit_config.before,
    },
    {
        "gcmt/vessel.nvim",
        config = function()
            require("vessel").setup({
                create_commands = true,
                commands = {
                    view_marks = "Marks", -- you can customize each command name
                    view_jumps = "Jumps",
                },
            })
            vim.keymap.set("n", "gl", "<Plug>(VesselViewLocalJumps)")
            vim.keymap.set("n", "gL", "<Plug>(VesselViewExternalJumps)")
            vim.keymap.set("n", "gm", "<plug>(VesselViewBufferMarks)")
            vim.keymap.set("n", "gM", "<plug>(VesselViewExternalMarks)")
        end,
    },
    -- {
    --     -- https://www.vim.org/scripts/script.php?script_id=2227
    --     "mjbrownie/browser.vim",
    -- },
    {
        "yuratomo/w3m.vim",
    },
    {
        "jake-stewart/multicursor.nvim",
        branch = "1.0",
        config = function()
            local mc = require("multicursor-nvim")

            mc.setup()

            -- Add cursors above/below the main cursor.
            vim.keymap.set({ "n", "v" }, "<up>", function()
                mc.addCursor("k")
            end)
            vim.keymap.set({ "n", "v" }, "<down>", function()
                mc.addCursor("j")
            end)

            -- Add a cursor and jump to the next word under cursor.
            vim.keymap.set({ "n", "v" }, "<c-n>", function()
                mc.addCursor("*")
            end)

            -- Jump to the next word under cursor but do not add a cursor.
            vim.keymap.set({ "n", "v" }, "<c-c>", function()
                mc.skipCursor("*")
            end)

            -- Rotate the main cursor.
            vim.keymap.set({ "n", "v" }, "<left>", mc.nextCursor)
            vim.keymap.set({ "n", "v" }, "<right>", mc.prevCursor)

            -- Delete the main cursor.
            vim.keymap.set({ "n", "v" }, "<leader>x", mc.deleteCursor)

            -- Add and remove cursors with control + left click.
            vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)

            vim.keymap.set({ "n", "v" }, "<c-q>", function()
                if mc.cursorsEnabled() then
                    -- Stop other cursors from moving.
                    -- This allows you to reposition the main cursor.
                    mc.disableCursors()
                else
                    mc.addCursor()
                end
            end)

            vim.keymap.set("n", "<esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                elseif mc.hasCursors() then
                    mc.clearCursors()
                else
                    -- Default <esc> handler.
                end
            end)

            -- Align cursor columns.
            vim.keymap.set("n", "<leader>a", mc.alignCursors)

            -- Split visual selections by regex.
            vim.keymap.set("v", "S", mc.splitCursors)

            -- Append/insert for each line of visual selections.
            vim.keymap.set("v", "I", mc.insertVisual)
            vim.keymap.set("v", "A", mc.appendVisual)

            -- match new cursors within visual selections by regex.
            vim.keymap.set("v", "M", mc.matchCursors)

            -- Rotate visual selection contents.
            vim.keymap.set("v", "<leader>t", function()
                mc.transposeCursors(1)
            end)
            vim.keymap.set("v", "<leader>T", function()
                mc.transposeCursors(-1)
            end)

            -- Customize how cursors look.
            vim.api.nvim_set_hl(0, "MultiCursorCursor", { link = "Cursor" })
            vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
            vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
            vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
        end,
    },
    -- {
    --     "https://gitlab.com/itaranto/plantuml.nvim",
    --     version = "*",
    --     config = function()
    --         require("plantuml").setup()
    --     end,
    -- },
    {
        "tamton-aquib/mpv.nvim",
        keys = { { "<leader><leader>p", ":MpvToggle<CR>", desc = "Play music with mpv nvim" } },
        config = function()
            require("mpv").setup({
                width = 50,
                height = 5, -- Changing these two might break the UI 😬
                border = "single",
                setup_widgets = true, -- to activate the widget components
                timer = {
                    after = 1000,
                    throttle = 250, -- Update time for the widgets. (lesser the faster)
                },
            })
        end,
    },
    {
        "epilande/checkbox-cycle.nvim",
        ft = "markdown",
        opts = {
            -- states = { "[ ]", "[/]", "[x]", "[~]" },
            states = {
                { "[ ]", "[x]" },
                { "[ ]", "[/]", "[x]" },
                { "[>]", "[<]" },
                { "[!]", "[~]", "[-]" },
            },
        },
        keys = {
            {
                "<CR>",
                "<Cmd>CheckboxCycleNext<CR>",
                desc = "Checkbox Next",
                ft = { "markdown" },
                mode = { "n", "v" },
            },
            {
                "<S-CR>",
                "<Cmd>CheckboxCyclePrev<CR>",
                desc = "Checkbox Previous",
                ft = { "markdown" },
                mode = { "n", "v" },
            },
        },
    },
    {
        "itchyny/calendar.vim",
        config = function()
            vim.cmd([[
                source ~/.cache/calendar.vim/credentials.vim
                let g:calendar_google_calendar = 1
                let g:calendar_google_task = 1
            ]])
        end,
    },
    {
        "j-hui/fidget.nvim",
        opts = {},
    },
    {
        "https://github.com/fresh2dev/zellij.vim.git",
        lazy = false,
        config = function()
            vim.cmd([[
                let g:zellij_navigator_no_default_mappings = 1
                nnoremap <silent> <C-h> :ZellijNavigateLeft<CR>
                nnoremap <silent> <C-j> :ZellijNavigateDown<CR>
                nnoremap <silent> <C-k> :ZellijNavigateUp<CR>
                nnoremap <silent> <C-l> :ZellijNavigateRight<CR>
            ]])
        end,
    },
    {
        "nvim-focus/focus.nvim",
        version = "*",
        config = function()
            require("focus").setup({
                enable = true, -- Enable module
                commands = true, -- Create Focus commands
                autoresize = {
                    enable = true, -- Enable or disable auto-resizing of splits
                    width = 0, -- Force width for the focused window
                    height = 0, -- Force height for the focused window
                    minwidth = 0, -- Force minimum width for the unfocused window
                    minheight = 0, -- Force minimum height for the unfocused window
                    height_quickfix = 10, -- Set the height of quickfix panel
                },
                split = {
                    bufnew = false, -- Create blank buffer for new split windows
                    tmux = false, -- Create tmux splits instead of neovim splits
                },
                ui = {
                    number = false, -- Display line numbers in the focussed window only
                    relativenumber = false, -- Display relative line numbers in the focussed window only
                    hybridnumber = false, -- Display hybrid line numbers in the focussed window only
                    absolutenumber_unfocussed = false, -- Preserve absolute numbers in the unfocussed windows

                    cursorline = true, -- Display a cursorline in the focussed window only
                    cursorcolumn = false, -- Display cursorcolumn in the focussed window only
                    colorcolumn = {
                        enable = false, -- Display colorcolumn in the foccused window only
                        list = "+1", -- Set the comma-saperated list for the colorcolumn
                    },
                    signcolumn = true, -- Display signcolumn in the focussed window only
                    winhighlight = false, -- Auto highlighting for focussed/unfocussed windows
                },
            })
        end,
    },
    { "kevinhwang91/nvim-hlslens" }, -- Show number of similar matches found when searching for a word (noice can do this too)
}
return modules
