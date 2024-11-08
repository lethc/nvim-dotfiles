local modules = {
    { "nvim-lua/plenary.nvim", lazy = true },
    { "farmergreg/vim-lastplace" },
    -- { "lvim-tech/lvim-linguistics" }
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        config = function()
            require("nvim-web-devicons").setup({
                override = {
                    zsh = {
                        icon = "",
                        color = "#428850",
                        cterm_color = "65",
                        name = "Zsh",
                    },
                    json = {
                        icon = "",
                        color = "#F1F134",
                        -- cterm_color = "65",
                        name = "json",
                    },
                },
            })
        end,
    },
    -- { "theRealCarneiro/hyprland-vim-syntax",        ft = "hypr" },
    { "elkowar/yuck.vim", ft = "yuck" },
    { "peterhoeg/vim-qml", ft = "qml" },
    { "fei6409/log-highlight.nvim", ft = "log" },
    { "nvim-telescope/telescope-file-browser.nvim", lazy = true },
    { "neovim/nvim-lspconfig", lazy = true },
    -- { "hrsh7th/cmp-nvim-lsp",                       lazy = true, enabled = false },
    -- { "saadparwaiz1/cmp_luasnip",                   lazy = true, enabled = false },
    -- { "hrsh7th/cmp-path",                           lazy = true, enabled = false },
    -- { "kdheepak/cmp-latex-symbols",                 ft = "latex", lazy = true, enabled = false },
    -- { "rafamadriz/friendly-snippets",               lazy = true, enabled = false },
    { "MunifTanjim/nui.nvim", lazy = true },
    -- { "jwalton512/vim-blade", ft = "php" },
    { "kkharji/sqlite.lua", lazy = true },
    {
        "lervag/vimtex",
        ft = { "tex" },
        config = function()
            vim.g.vimtex_mappings_enabled = false
        end,
    }, --LaTeX
    {
        "vim-scripts/ReplaceWithRegister",
    },
    {
        "svban/YankAssassin.nvim", -- Will avoid the cursor move when copy
        config = function()
            require("YankAssassin").setup({
                auto_normal = true, -- if auto is true, autocmds are used. Whenever y is used anywhere, the cursor doesn't move to start
                auto_visual = true,
            })
            -- Optional Mappings
            vim.keymap.set({ "x", "n" }, "gy", "<Plug>(YADefault)", { silent = true })
            -- vim.keymap.set({ "x", "n" }, "<leader>y", "<Plug>(YANoMove)", { silent = true })
        end,
    },
    {
        "yogeshdhamija/enter-insert-on-click.vim",
    },
    -- {
    --     "christoomey/vim-tmux-navigator",
    --     init = function()
    --         vim.keymap.set("n", "C-h", ":TmuxNavigateLeft")
    --         vim.keymap.set("n", "C-l", ":TmuxNavigateRight")
    --         vim.keymap.set("n", "C-k", ":TmuxNavigateUp")
    --         vim.keymap.set("n", "C-j", ":TmuxNavigateDown")
    --     end,
    -- },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            notifier = {
                enabled = true,
                timeout = 3000,
            },
            quickfile = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            styles = {
                notification = {
                    wo = { wrap = true }, -- Wrap notifications
                },
            },
        },
        keys = {
            -- Git Related
            {
                "<leader>gg",
                function()
                    Snacks.lazygit()
                end,
                desc = "Lazygit",
            },
            {
                "<leader>gL",
                function()
                    Snacks.git.blame_line()
                end,
                desc = "Git Blame Line",
            },
            {
                "<leader>gB",
                function()
                    Snacks.gitbrowse()
                end,
                desc = "Git Browse",
            },
            {
                "<leader>gf",
                function()
                    Snacks.lazygit.log_file()
                end,
                desc = "Lazygit Current File History",
            },
            {
                "<leader>gO",
                function()
                    Snacks.lazygit.log()
                end,
                desc = "Lazygit Log (cwd)",
            },
            -- Other
            {
                "<S-q>",
                function()
                    Snacks.bufdelete()
                end,
                desc = "Delete Buffer",
            },
            {
                "<leader>Un",
                function()
                    Snacks.notifier.hide()
                end,
                desc = "Dismiss All Notifications",
            },
            {
                "<leader>T",
                function()
                    Snacks.terminal()
                end,
                desc = "Toggle Terminal",
            },
            -- {
            --     "]]",
            --     function()
            --         Snacks.words.jump(vim.v.count1)
            --     end,
            --     desc = "Next Reference",
            -- },
            -- {
            --     "[[",
            --     function()
            --         Snacks.words.jump(-vim.v.count1)
            --     end,
            --     desc = "Prev Reference",
            -- },
            {
                "<leader>N",
                desc = "Neovim News",
                function()
                    Snacks.win({
                        file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
                        width = 0.6,
                        height = 0.6,
                        wo = {
                            spell = false,
                            wrap = false,
                            signcolumn = "yes",
                            statuscolumn = " ",
                            conceallevel = 3,
                        },
                    })
                end,
            },
        },
        init = function()
            vim.api.nvim_create_autocmd("User", {
                pattern = "VeryLazy",
                callback = function()
                    -- Setup some globals for debugging (lazy-loaded)
                    _G.dd = function(...)
                        Snacks.debug.inspect(...)
                    end
                    _G.bt = function()
                        Snacks.debug.backtrace()
                    end
                    vim.print = _G.dd -- Override print to use snacks for `:=` command

                    -- Create some toggle mappings
                    Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>Us")
                    Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>Uw")
                    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>UL")
                    Snacks.toggle.diagnostics():map("<leader>Ud")
                    Snacks.toggle.line_number():map("<leader>Ul")
                    Snacks.toggle
                        .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
                        :map("<leader>uc")
                    Snacks.toggle.treesitter():map("<leader>UT")
                    Snacks.toggle
                        .option("background", { off = "light", on = "dark", name = "Dark Background" })
                        :map("<leader>Ub")
                    Snacks.toggle.inlay_hints():map("<leader>Uh")
                end,
            })
        end,
    },
}
return modules
