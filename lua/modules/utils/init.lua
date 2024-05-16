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
                    color = "error", -- can be a hex color, or a named color (see below)
                    alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "HIGH" }, -- a set of other keywords that all map to this FIX keywords
                    -- signs = false, -- configure signs for some keywords individually
                },
                TODO = { icon = " ", color = "info" },
                HACK = { icon = " ", color = "warning" },
                WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "MEDIUM" } },
                PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = " ", color = "hint", alt = { "INFO", "LOW" } },
                TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
            },
        },
    },
    {
        "bloznelis/before.nvim",
        config = edit_config.before,
    },
    -- {
    --     -- https://www.vim.org/scripts/script.php?script_id=2227
    --     "mjbrownie/browser.vim",
    -- },
    {
        "yuratomo/w3m.vim",
    },
    {
        "smoka7/multicursors.nvim",
        -- event = "VeryLazy",
        dependencies = {
            "smoka7/hydra.nvim",
        },
        opts = {
            hint_config = {
                border = "rounded",
            },
        },
        cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
        keys = {
            {
                mode = { "v", "n" },
                "<Leader><leader>v",
                "<cmd>MCstart<cr>",
                desc = "Create a selection for selected text or word under the cursor",
            },
            -- {
            --     mode = { "v", "n" },
            --     "<Leader><leader>vp",
            --     "<cmd>MCpattern<cr>",
            -- },
            -- {
            --     mode = { "v", "n" },
            --     "<Leader><leader>vv",
            --     "<cmd>MCvisual<cr>",
            -- },
            -- {
            --     mode = { "v", "n" },
            --     "<Leader><leader>vvp",
            --     "<cmd>MCvisualPattern<cr>",
            -- },
            -- {
            --     mode = { "v", "n" },
            --     "<Leader><leader>vu",
            --     "<cmd>MCunderCursor<cr>",
            -- },
            -- {
            --     mode = { "v", "n" },
            --     "<Leader><leader>vc",
            --     "<cmd>MCclear<cr>",
            -- },
        },
    },
    {
        "siadat/shell.nvim",
        keys = { { "<leader><leader>s", ":Shell ", desc = "Run a Shell command in a buffer" } },
        opts = {},
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
}
return modules
