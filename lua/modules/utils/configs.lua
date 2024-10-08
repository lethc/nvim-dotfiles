local icons = require("configs.ui.icons")
local config = {}

config.telescope_nvim = function()
    local telescope_status_ok, telescope = pcall(require, "telescope")
    if not telescope_status_ok then
        return
    end
    local actions = require("telescope.actions")
    telescope.setup({
        defaults = {
            prompt_prefix = " " .. icons.common.search .. " ",
            selection_caret = "  ",
            -- selection_caret = " ",
            entry_prefix = "  ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "ascending",
            layout_strategy = "vertical",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.5,
                    results_width = 0.9,
                },
                vertical = {
                    mirror = false,
                    prompt_position = "top",
                    preview_cutoff = 0.2,
                    preview_height = 0.4,
                },
                height = 0.9,
                width = 0.8,
            },
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--hidden",
            },
            file_sorter = require("telescope.sorters").get_fuzzy_file,
            file_ignore_patterns = {
                "node_modules",
                ".git",
                "target",
                "vendor",
            },
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            path_display = { shorten = 5 },
            winblend = 0,
            border = {},
            -- borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
            color_devicons = true,
            set_env = { ["COLORTERM"] = "truecolor" },
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
            buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
            mappings = {
                i = {
                    ["<C-c>"] = actions.delete_buffer,
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<ESC>"] = actions.close,
                    ["<Down>"] = actions.move_selection_next,
                    ["<Up>"] = actions.move_selection_previous,
                    ["<CR>"] = actions.select_default,
                    ["<C-x>"] = actions.select_horizontal,
                    ["<C-v>"] = actions.select_vertical,
                    -- ["<C-t>"] = actions.select_tab,
                    ["<C-u>"] = actions.preview_scrolling_up,
                    ["<C-d>"] = actions.preview_scrolling_down,
                    ["<A-k>"] = actions.preview_scrolling_up,
                    ["<A-j>"] = actions.preview_scrolling_down,
                    ["<PageUp>"] = actions.results_scrolling_up,
                    ["<PageDown>"] = actions.results_scrolling_down,
                    ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                    ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    ["<C-l>"] = actions.complete_tag,
                    ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
                    ["<C-h>"] = "which_key",
                    -- ["<C-o>"] = trouble.open_with_trouble,
                },
                n = {
                    ["<C-c>"] = actions.delete_buffer,
                    ["<esc>"] = actions.close,
                    ["<CR>"] = actions.select_default,
                    ["<C-x>"] = actions.select_horizontal,
                    ["<C-v>"] = actions.select_vertical,
                    ["<C-t>"] = actions.select_tab,
                    ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                    ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    ["j"] = actions.move_selection_next,
                    ["k"] = actions.move_selection_previous,
                    ["H"] = actions.move_to_top,
                    ["M"] = actions.move_to_middle,
                    ["L"] = actions.move_to_bottom,
                    ["<Down>"] = actions.move_selection_next,
                    ["<Up>"] = actions.move_selection_previous,
                    ["gg"] = actions.move_to_top,
                    ["G"] = actions.move_to_bottom,
                    ["<C-u>"] = actions.preview_scrolling_up,
                    ["<C-d>"] = actions.preview_scrolling_down,
                    ["<A-k>"] = actions.preview_scrolling_up,
                    ["<A-j>"] = actions.preview_scrolling_down,
                    ["<PageUp>"] = actions.results_scrolling_up,
                    ["<PageDown>"] = actions.results_scrolling_down,
                    ["?"] = actions.which_key,
                    -- ["<C-o>"] = trouble.open_with_trouble,
                },
            },
        },
        pickers = {
            buffers = {
                show_all_buffers = false,
                sort_mru = true,
                mappings = {
                    i = {
                        ["<c-d>"] = "delete_buffer",
                    },
                },
            },
            file_browser = {
                hidden = true,
            },
            find_files = {
                -- theme = "dropdown",
                hidden = true,
            },
            live_grep = {
                hidden = true,
                only_sort_text = true,
            },
        },
        extensions = {
            -- fzf = {
            --   fuzzy = true,
            --   override_generic_sorter = false,
            --   override_file_sorter = true,
            --   case_mode = "smart_case",
            -- },
            file_browser = {
                initial_mode = "insert",
                dir_icon = "󰉋",
            },
            smart_open = {
                show_scores = false,
                ignore_patterns = { "*.git/*", "*/tmp/*" },
                match_algorithm = "fzf",
                disable_devicons = false,
            },
        },
    })
    -- telescope.load_extension("macros")
    -- telescope.load_extension("fzf")
    telescope.load_extension("file_browser")
    telescope.load_extension("notify")
    telescope.load_extension("smart_open")

    vim.api.nvim_create_autocmd("User", {
        pattern = "TelescopePreviewerLoaded",
        callback = function()
            vim.opt.number = true
        end,
    })
end
config.fzf_lua = function()
    local fzf_lua_status_ok, fzf_lua = pcall(require, "fzf-lua")
    if not fzf_lua_status_ok then
        return
    end
    fzf_lua.setup({
        fzf_colors = {
            ["fg"] = { "fg", "FzfLuaLine" },
            ["bg"] = { "bg", "FzfLuaNormal" },
            ["hl"] = { "fg", "FzfLuaItemKindVariable" },
            ["fg+"] = { "fg", "FzfLuaLinePlus" },
            ["bg+"] = { "bg", "FzfLuaNormal" },
            ["hl+"] = { "fg", "FzfLuaItemKindVariable" },
            ["info"] = { "fg", "FzfLuaPrompt" },
            ["prompt"] = { "fg", "FzfLuaPrompt" },
            ["pointer"] = { "fg", "DiagnosticError" },
            ["marker"] = { "fg", "DiagnosticError" },
            ["spinner"] = { "fg", "FzfLuaPrompt" },
            ["header"] = { "fg", "FzfLuaPrompt" },
            ["gutter"] = { "bg", "FzfLuaNormal" },
        },
        winopts_fn = function()
            local win_height = math.ceil(vim.api.nvim_get_option("lines") * 0.4)
            local win_width = math.ceil(vim.api.nvim_get_option("columns") * 1)
            local col = math.ceil((vim.api.nvim_get_option("columns") - win_width) * 1)
            local row = math.ceil((vim.api.nvim_get_option("lines") - win_height) * 1 - 3)
            return {
                title = "FZF LUA",
                title_pos = "center",
                width = win_width,
                height = win_height,
                row = row,
                col = col,
                border = { " ", " ", " ", " ", " ", " ", " ", " " },
                preview = {
                    layout = "horizontal",
                    vertical = "down:45%",
                    horizontal = "right:50%",
                    border = "noborder",
                },
            }
        end,
    })
end
config.which_key = function()
    local status_ok, which_key = pcall(require, "which-key")
    if not status_ok then
        return
    end

    local setup = {
        ---@type false | "classic" | "modern" | "helix"
        preset = "helix",
        plugins = {
            marks = true, -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20, -- how many suggestions should be shown in the list?
            },
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            presets = {
                operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                motions = true, -- adds help for motions
                text_objects = true, -- help for text objects triggered after entering an operator
                windows = true, -- default bindings on <c-w>
                nav = true, -- misc bindings to work with windows
                z = true, -- bindings for folds, spelling and others prefixed with z
                g = true, -- bindings for prefixed with g
            },
        },
        -- icons = {
        --     breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        --     separator = "➜", -- symbol used between a key and it's label
        --     group = "", -- symbol prepended to a group
        -- },
        win = {
            -- don't allow the popup to overlap with the cursor
            no_overlap = true,
            -- width = 1,
            -- height = { min = 4, max = 25 },
            -- col = 0,
            -- row = math.huge,
            border = "rounded",
            padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
            title = true,
            title_pos = "center",
            zindex = 1000,
            -- Additional vim.wo and vim.bo options
            bo = {},
            wo = {
                -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
            },
        },
        layout = {
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 3, -- spacing between columns
        },
        keys = {
            scroll_down = "<c-d>", -- binding to scroll down inside the popup
            scroll_up = "<c-u>", -- binding to scroll up inside the popup
        },
        replace = {
            key = {
                function(key)
                    return require("which-key.view").format(key)
                end,
                -- { "<Space>", "SPC" },
            },
            desc = {
                { "<Plug>%(?(.*)%)?", "%1" },
                { "^%+", "" },
                { "<[cC]md>", "" },
                { "<[cC][rR]>", "" },
                { "<[sS]ilent>", "" },
                { "^lua%s+", "" },
                { "^call%s+", "" },
                { "^:%s*", "" },
            },
        },
        show_help = true, -- show help message on the command line when the popup is visible
        triggers = {
            { "<auto>", mode = "nisotc" },
        },
    }

    local opts = {
        mode = "n", -- NORMAL mode
        -- prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
        remap = false,
    }
    local mappings = require("modules.utils.whichkeys")
    which_key.setup(setup)
    which_key.add(mappings, opts)
    -- which_key.register(mappings, opts)
end
config.mini_files = function()
    local mini_files_status_ok, mini_files = pcall(require, "mini.files")
    if not mini_files_status_ok then
        return
    end
    mini_files.setup({
        mappings = {
            close = "q",
            go_in = "L",
            go_in_plus = "l",
            go_out = "H",
            go_out_plus = "h",
            reset = "<BS>",
            show_help = "g?",
            synchronize = "=",
            trim_left = ".",
            trim_right = ">",
        },
        windows = {
            max_number = math.huge,
            preview = true,
            width_focus = 30,
            width_nofocus = 30,
            width_preview = 80,
        },
        options = {
            permanent_delete = false,
            use_as_default_explorer = true,
        },
    })
    local map_split = function(buf_id, lhs, direction)
        local rhs = function()
            local new_target_window
            vim.api.nvim_win_call(mini_files.get_explorer_state().target_window, function()
                vim.cmd(direction .. " split")
                new_target_window = vim.api.nvim_get_current_win()
            end)
            mini_files.set_target_window(new_target_window)
        end
        local desc = "Split " .. direction
        vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
    end

    vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
            local buf_id = args.data.buf_id
            map_split(buf_id, "gs", "belowright horizontal")
            map_split(buf_id, "gv", "belowright vertical")
        end,
    })
end
config.block = function()
    local block_status_ok, block = pcall(require, "block")
    if not block_status_ok then
        return
    end
    block.setup({})
end
config.search_replace = function()
    local search_replace_status_ok, search_replace = pcall(require, "search-replace")
    if not search_replace_status_ok then
        return
    end
    search_replace.setup({})
end
config.ccc = function()
    local ccc_status_ok, ccc = pcall(require, "ccc")
    if not ccc_status_ok then
        return
    end
    ccc.setup({})
end
config.colortils = function()
    local colortils_status_ok, colortils = pcall(require, "colortils")
    if not colortils_status_ok then
        return
    end
    colortils.setup({
        require("colortils").setup({
            -- Register in which color codes will be copied
            register = "+",
            -- Preview for colors, if it contains `%s` this will be replaced with a hex color code of the color
            color_preview = "████ %s",
            -- The default in which colors should be saved
            -- This can be hex, hsl or rgb
            default_format = "hex",
            -- Border for the float
            border = "rounded",
            -- Some mappings which are used inside the tools
            mappings = {
                -- increment values
                increment = "l",
                -- decrement values
                decrement = "h",
                -- increment values with bigger steps
                increment_big = "L",
                -- decrement values with bigger steps
                decrement_big = "H",
                -- set values to the minimum
                min_value = "0",
                -- set values to the maximum
                max_value = "$",
                -- save the current color in the register specified above with the format specified above
                set_register_default_format = "<c-cr>",
                -- save the current color in the register specified above with a format you can choose
                set_register_cjoose_format = "g<c-cr>",
                -- replace the color under the cursor with the current color in the format specified above
                replace_default_format = "<cr>",
                -- replace the color under the cursor with the current color in a format you can choose
                replace_choose_format = "g<cr>",
                -- export the current color to a different tool
                export = "E",
                -- set the value to a certain number (done by just entering numbers)
                set_value = "c",
                -- toggle transparency
                transparency = "T",
                -- choose the background (for transparent colors)
                choose_background = "B",
            },
        }),
    })
end
config.comment = function()
    local comment_status_ok, Comment = pcall(require, "Comment")
    if not comment_status_ok then
        return
    end
    local ft = require("Comment.ft")
    ft.hyprlang = "#%s"
    Comment.setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        -- post_hook = function(ctx)
        --   if ctx.range.srow == ctx.range.erow then
        --     -- do something with the current line
        --   else
        --     -- do something with lines range
        --   end
        -- end,
    })
end
config.context_commentstring = function()
    local context_commentstring_status_ok, context_commentstring = pcall(require, "ts_context_commentstring")
    if not context_commentstring_status_ok then
        return
    end
    context_commentstring.setup({
        enable_autocmd = false,
        languages = {
            typescript = "// %s",
            -- javascriptreact = '{/*%s*/}'
        },
    })
end
config.harpoon = function()
    local harpoon = require("harpoon")
    harpoon:setup()
    vim.keymap.set("n", "<leader>aa", function()
        harpoon:list():add()
    end)
    vim.keymap.set("n", "<leader>aw", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set("n", "<leader>a1", function()
        harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<leader>a2", function()
        harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<leader>a3", function()
        harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<leader>a4", function()
        harpoon:list():select(4)
    end)
    vim.keymap.set("n", "<leader>a5", function()
        harpoon:list():select(5)
    end)
    vim.keymap.set("n", "<leader>a6", function()
        harpoon:list():select(6)
    end)
    vim.keymap.set("n", "<leader>a7", function()
        harpoon:list():select(7)
    end)
    vim.keymap.set("n", "<leader>a8", function()
        harpoon:list():select(8)
    end)
    vim.keymap.set("n", "<leader>a9", function()
        harpoon:list():select(9)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>an", function()
        harpoon:list():next()
    end)
    vim.keymap.set("n", "<leader>ap", function()
        harpoon:list():prev()
    end)

    --
    vim.api.nvim_create_user_command("HarpoonPrevious", function()
        harpoon:list():prev()
    end, {})

    vim.api.nvim_create_user_command("HarpoonNext", function()
        harpoon:list():next()
    end, {})

    vim.api.nvim_create_user_command("HarpoonQuickMenu", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end, {})
    vim.api.nvim_create_user_command("HarpoonAdd", function()
        harpoon:list():add()
    end, {})
    vim.api.nvim_create_user_command("Harpoon1", function()
        harpoon:list():select(1)
    end, {})
    vim.api.nvim_create_user_command("Harpoon2", function()
        harpoon:list():select(2)
    end, {})
    vim.api.nvim_create_user_command("Harpoon3", function()
        harpoon:list():select(3)
    end, {})
    vim.api.nvim_create_user_command("Harpoon4", function()
        harpoon:list():select(4)
    end, {})
    vim.api.nvim_create_user_command("Harpoon5", function()
        harpoon:list():select(5)
    end, {})
    vim.api.nvim_create_user_command("Harpoon6", function()
        harpoon:list():select(6)
    end, {})
    vim.api.nvim_create_user_command("Harpoon7", function()
        harpoon:list():select(7)
    end, {})
    vim.api.nvim_create_user_command("Harpoon8", function()
        harpoon:list():select(8)
    end, {})
    vim.api.nvim_create_user_command("Harpoon9", function()
        harpoon:list():select(9)
    end, {})
end
config.flash_nvim = function()
    local flash_status_ok, flash = pcall(require, "flash")
    if not flash_status_ok then
        return
    end
    flash.setup({
        -- labels = "abcdefghijklmnopqrstuvwxyz",
        labels = "asdfghjklqwertyuiopzxcvbnm",
        search = {
            -- search/jump in all windows
            multi_window = true,
            -- search direction
            forward = true,
            -- when `false`, find only matches in the given direction
            wrap = true,
            ---@type Flash.Pattern.Mode
            -- Each mode will take ignorecase and smartcase into account.
            -- * exact: exact match
            -- * search: regular search
            -- * fuzzy: fuzzy search
            -- * fun(str): custom function that returns a pattern
            --   For example, to only match at the beginning of a word:
            --   mode = function(str)
            --     return "\\<" .. str
            --   end,
            mode = "exact",
            -- behave like `incsearch`
            incremental = false,
            -- Excluded filetypes and custom window filters
            ---@type (string|fun(win:window))[]
            exclude = {
                "notify",
                "cmp_menu",
                "noice",
                "flash_prompt",
                function(win)
                    -- exclude non-focusable windows
                    return not vim.api.nvim_win_get_config(win).focusable
                end,
            },
            -- Optional trigger character that needs to be typed before
            -- a jump label can be used. It's NOT recommended to set this,
            -- unless you know what you're doing
            trigger = "",
            -- max pattern length. If the pattern length is equal to this
            -- labels will no longer be skipped. When it exceeds this length
            -- it will either end in a jump or terminate the search
            max_length = false, ---@type number|false
        },
        jump = {
            -- save location in the jumplist
            jumplist = true,
            -- jump position
            pos = "start", ---@type "start" | "end" | "range"
            -- add pattern to search history
            history = false,
            -- add pattern to search register
            register = false,
            -- clear highlight after jump
            nohlsearch = false,
            -- automatically jump when there is only one match
            autojump = false,
            -- You can force inclusive/exclusive jumps by setting the
            -- `inclusive` option. By default it will be automatically
            -- set based on the mode.
            inclusive = nil, ---@type boolean?
            -- jump position offset. Not used for range jumps.
            -- 0: default
            -- 1: when pos == "end" and pos < current position
            offset = nil, ---@type number
        },
        label = {
            -- allow uppercase labels
            uppercase = true,
            -- add any labels with the correct case here, that you want to exclude
            exclude = "",
            -- add a label for the first match in the current window.
            -- you can always jump to the first match with `<CR>`
            current = true,
            -- show the label after the match
            after = true, ---@type boolean|number[]
            -- show the label before the match
            before = false, ---@type boolean|number[]
            -- position of the label extmark
            style = "overlay", ---@type "eol" | "overlay" | "right_align" | "inline"
            -- flash tries to re-use labels that were already assigned to a position,
            -- when typing more characters. By default only lower-case labels are re-used.
            reuse = "lowercase", ---@type "lowercase" | "all" | "none"
            -- for the current window, label targets closer to the cursor first
            distance = true,
            -- minimum pattern length to show labels
            -- Ignored for custom labelers.
            min_pattern_length = 0,
            -- Enable this to use rainbow colors to highlight labels
            -- Can be useful for visualizing Treesitter ranges.
            rainbow = {
                enabled = false,
                -- number between 1 and 9
                shade = 5,
            },
            -- With `format`, you can change how the label is rendered.
            -- Should return a list of `[text, highlight]` tuples.
            ---@class Flash.Format
            ---@field state Flash.State
            ---@field match Flash.Match
            ---@field hl_group string
            ---@field after boolean
            ---@type fun(opts:Flash.Format): string[][]
            format = function(opts)
                return { { opts.match.label, opts.hl_group } }
            end,
        },
        highlight = {
            -- show a backdrop with hl FlashBackdrop
            backdrop = true,
            -- Highlight the search matches
            matches = true,
            -- extmark priority
            priority = 5000,
            groups = {
                match = "FlashMatch",
                current = "FlashCurrent",
                backdrop = "FlashBackdrop",
                label = "FlashLabel",
            },
        },
        -- action to perform when picking a label.
        -- defaults to the jumping logic depending on the mode.
        ---@type fun(match:Flash.Match, state:Flash.State)|nil
        action = nil,
        -- initial pattern to use when opening flash
        pattern = "",
        -- When `true`, flash will try to continue the last search
        continue = false,
        -- Set config to a function to dynamically change the config
        config = nil, ---@type fun(opts:Flash.Config)|nil
        -- You can override the default options for a specific mode.
        -- Use it with `require("flash").jump({mode = "forward"})`
        ---@type table<string, Flash.Config>
        modes = {
            -- options used when flash is activated through
            -- a regular search with `/` or `?`
            search = {
                -- when `true`, flash will be activated during regular search by default.
                -- You can always toggle when searching with `require("flash").toggle()`
                enabled = true,
                highlight = { backdrop = false },
                jump = { history = true, register = true, nohlsearch = true },
                search = {
                    -- `forward` will be automatically set to the search direction
                    -- `mode` is always set to `search`
                    -- `incremental` is set to `true` when `incsearch` is enabled
                },
            },
            -- options used when flash is activated through
            -- `f`, `F`, `t`, `T`, `;` and `,` motions
            char = {
                enabled = true,
                -- dynamic configuration for ftFT motions
                config = function(opts)
                    -- autohide flash when in operator-pending mode
                    opts.autohide = opts.autohide or (vim.fn.mode(true):find("no") and vim.v.operator == "y")

                    -- disable jump labels when not enabled, when using a count,
                    -- or when recording/executing registers
                    opts.jump_labels = opts.jump_labels
                        and vim.v.count == 0
                        and vim.fn.reg_executing() == ""
                        and vim.fn.reg_recording() == ""

                    -- Show jump labels only in operator-pending mode
                    -- opts.jump_labels = vim.v.count == 0 and vim.fn.mode(true):find("o")
                end,
                -- hide after jump when not using jump labels
                autohide = false,
                -- show jump labels
                jump_labels = false,
                -- set to `false` to use the current line only
                multi_line = true,
                -- When using jump labels, don't use these keys
                -- This allows using those keys directly after the motion
                label = { exclude = "hjkliardc" },
                -- by default all keymaps are enabled, but you can disable some of them,
                -- by removing them from the list.
                -- If you rather use another key, you can map them
                -- to something else, e.g., { [";"] = "L", [","] = H }
                keys = { "f", "F", "t", "T", ";", "," },
                ---@alias Flash.CharActions table<string, "next" | "prev" | "right" | "left">
                -- The direction for `prev` and `next` is determined by the motion.
                -- `left` and `right` are always left and right.
                char_actions = function(motion)
                    return {
                        [";"] = "next", -- set to `right` to always go right
                        [","] = "prev", -- set to `left` to always go left
                        -- clever-f style
                        [motion:lower()] = "next",
                        [motion:upper()] = "prev",
                        -- jump2d style: same case goes next, opposite case goes prev
                        -- [motion] = "next",
                        -- [motion:match("%l") and motion:upper() or motion:lower()] = "prev",
                    }
                end,
                search = { wrap = false },
                highlight = { backdrop = true },
                jump = { register = false },
            },
            -- options used for treesitter selections
            -- `require("flash").treesitter()`
            treesitter = {
                labels = "abcdefghijklmnopqrstuvwxyz",
                jump = { pos = "range" },
                search = { incremental = false },
                label = { before = true, after = true, style = "inline" },
                highlight = {
                    backdrop = false,
                    matches = false,
                },
            },
            treesitter_search = {
                jump = { pos = "range" },
                search = { multi_window = true, wrap = true, incremental = false },
                remote_op = { restore = true },
                label = { before = true, after = true, style = "inline" },
            },
            -- options used for remote flash
            remote = {
                remote_op = { restore = true, motion = true },
            },
        },
        -- options for the floating window that shows the prompt,
        -- for regular jumps
        prompt = {
            enabled = true,
            prefix = { { "⚡", "FlashPromptIcon" } },
            win_config = {
                relative = "editor",
                width = 1, -- when <=1 it's a percentage of the editor width
                height = 1,
                row = -1, -- when negative it's an offset from the bottom
                col = 0, -- when negative it's an offset from the right
                zindex = 1000,
            },
        },
        -- options for remote operator pending mode
        remote_op = {
            -- restore window views and cursor position
            -- after doing a remote operation
            restore = false,
            -- For `jump.pos = "range"`, this setting is ignored.
            -- `true`: always enter a new motion when doing a remote operation
            -- `false`: use the window's cursor position and jump target
            -- `nil`: act as `true` for remote windows, `false` for the current window
            motion = false,
        },
    })
end
config.nvim_recorder = function()
    local nvim_recorder_ok, recorder = pcall(require, "recorder")
    if not nvim_recorder_ok then
        return
    end
    recorder.setup({
        -- Named registers where macros are saved (single lowercase letters only).
        -- The first register is the default register used as macro-slot used after
        -- startup.
        slots = { "a", "b", "c", "d", "e" },

        mapping = {
            startStopRecording = "q",
            playMacro = "Q",
            switchSlot = "<C-x>",
            editMacro = "cq",
            yankMacro = "yq",
            addBreakPoint = "##", -- ⚠️ this should be a string you don't use in insert mode during a macro
        },

        -- Clears all macros-slots on startup.
        clear = false,

        -- Log level used for any notification, mostly relevant for nvim-notify.
        -- (Note that by default, nvim-notify does not show the levels trace & debug.)
        logLevel = vim.log.levels.INFO,

        -- If enabled, only critical notifications are sent.
        -- If you do not use a plugin like nvim-notify, set this to `true`
        -- to remove otherwise annoying messages.
        lessNotifications = false,

        -- Use nerdfont icons in the status bar components and keymap descriptions
        useNerdfontIcons = true,

        -- Performance optimzations for macros with high count. When `playMacro` is
        -- triggered with a count higher than the threshold, nvim-recorder
        -- temporarily changes changes some settings for the duration of the macro.
        performanceOpts = {
            countThreshold = 100,
            lazyredraw = true, -- enable lazyredraw (see `:h lazyredraw`)
            noSystemClipboard = true, -- remove `+`/`*` from clipboard option
            autocmdEventsIgnore = { -- temporarily ignore these autocmd events
                "TextChangedI",
                "TextChanged",
                "InsertLeave",
                "InsertEnter",
                "InsertCharPre",
            },
        },

        -- [experimental] partially share keymaps with nvim-dap.
        -- (See README for further explanations.)
        dapSharedKeymaps = false,
    })
    local lualineZ = require("lualine").get_config().sections.lualine_z or {}
    local lualineY = require("lualine").get_config().sections.lualine_y or {}
    table.insert(lualineZ, { require("recorder").recordingStatus })
    table.insert(lualineY, { require("recorder").displaySlots })

    require("lualine").setup({
        tabline = {
            lualine_y = lualineY,
            lualine_z = lualineZ,
        },
    })
end
config.NeoComposer_nvim = function()
    local NeoComposer_status_ok, NeoComposer = pcall(require, "NeoComposer")
    if not NeoComposer_status_ok then
        return
    end
    NeoComposer.setup({
        notify = true,
        delay_timer = 150,
        colors = {
            bg = "#16161e",
            fg = "#ff9e64",
            red = "#ec5f67",
            blue = "#5fb3b3",
            green = "#99c794",
        },
        keymaps = {
            play_macro = "Q",
            yank_macro = "yq",
            stop_macro = "cq",
            toggle_record = "q",
            cycle_next = "<c-n>",
            cycle_prev = "<c-p>",
            toggle_macro_menu = "<m-q>",
        },
    })
end
config.obsidian_nvim = function()
    local obsidian_status_ok, obsidian = pcall(require, "obsidian")
    if not obsidian_status_ok then
        return
    end
    local path = os.getenv("HOME") .. "/Home/"
    obsidian.setup({
        -- dir = path,
        workspaces = {
            {
                name = "Home",
                path = path,
            },
        },
        completion = {
            nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
        },
        daily_notes = {
            folder = "Today/",
        },
        mappings = {},
        disable_frontmatter = false,
        templates = {
            subdir = "Templates",
            date_format = "%Y-%m-%d-%a",
            time_format = "%H:%M",
            substitutions = {
                yesterday = function()
                    return os.date("%Y-%m-%d", os.time() - 86400)
                end,
                today = function()
                    return os.date("%A %e %b")
                end,
            },
        },
        ui = {
            enable = false, -- set to false to disable all additional syntax features
            update_debounce = 200, -- update delay after a text change (in milliseconds)
            -- Define how various check-boxes are displayed
            checkboxes = {
                [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                ["x"] = { char = "", hl_group = "ObsidianDone" },
                [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                -- Replace the above with this if you don't have a patched font:
                -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
                -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

                -- You can also add more custom ones...
            },
            external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
            -- Replace the above with this if you don't have a patched font:
            -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
            reference_text = { hl_group = "ObsidianRefText" },
            highlight_text = { hl_group = "ObsidianHighlightText" },
            tags = { hl_group = "ObsidianTag" },
            hl_groups = {
                -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                ObsidianTodo = { bold = true, fg = "#f78c6c" },
                ObsidianDone = { bold = true, fg = "#89ddff" },
                ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                ObsidianTilde = { bold = true, fg = "#ff5370" },
                ObsidianRefText = { underline = true, fg = "#c792ea" },
                ObsidianExtLinkIcon = { fg = "#c792ea" },
                ObsidianTag = { italic = true, fg = "#89ddff" },
                ObsidianHighlightText = { bg = "#75662e" },
            },
        },
        attachments = {
            -- The default folder to place images in via `:ObsidianPasteImg`.
            -- If this is a relative path it will be interpreted as relative to the vault root.
            -- You can always override this per image by passing a full path to the command instead of just a filename.
            img_folder = "assets/img", -- This is the default
            img_text_func = function(client, path)
                path = client:vault_relative_path(path) or path
                return string.format("![%s](%s)", path.name, path)
            end,
        },
        follow_url_func = function(url)
            -- Open the URL in the default web browser.
            vim.fn.jobstart({ "xdg-open", url }) -- linux
        end,
        picker = {
            name = "fzf-lua",
        },
    })
    vim.keymap.set("n", "gf", function()
        if require("obsidian").util.cursor_on_markdown_link() then
            return "<cmd>ObsidianFollowLink<CR>"
        else
            return "gf"
        end
    end, { noremap = false, expr = true })
end
config.asciitree_nvim = function()
    local asciitree_status_ok, assiitree_nvim = pcall(require, "asciitree")
    if not asciitree_status_ok then
        return
    end
    assiitree_nvim.setup({
        symbols = {
            child = "├",
            last = "└",
            parent = "│",
            dash = "─",
            blank = " ",
        },
        depth = 3,
        delimiter = "#",
    })
end
config.fterm = function()
    local fterm_status_ok, fterm = pcall(require, "FTerm")
    if not fterm_status_ok then
        return
    end
    fterm.setup({
        ft = "terminal",
        cmd = os.getenv("SHELL"),
        border = "rounded",
        -- border     = 'none',
        dimensions = {
            -- height = 0.8,
            -- width = 0.8,
            height = 0.5,
            width = 1,
            x = 0, -- X axis of the terminal window
            y = 1, -- Y axis of the terminal window
        },
        auto_close = true,
    })
    --Open the terminal
    vim.api.nvim_create_user_command("FTermOpen", require("FTerm").open, { bang = true })
    --Toggle the terminal
    vim.api.nvim_create_user_command("FTermToggle", require("FTerm").toggle, { bang = true })
    --Close the terminal
    vim.api.nvim_create_user_command("FTermClose", require("FTerm").close, { bang = true })
    --Remove the terminal
    vim.api.nvim_create_user_command("FTermExit", require("FTerm").exit, { bang = true })
    vim.api.nvim_create_user_command("FTermEnter", require("FTerm").scratch, { bang = true })

    -- Code Runner - execute commands in a floating terminal
    local runners = { lua = "lua", javascript = "node", java = "java", python = "python", php = "php" }
    local aux = { cpp = "./*" }

    vim.keymap.set("n", "<leader><Enter>", function()
        local buf = vim.api.nvim_buf_get_name(0)
        local ftype = vim.filetype.match({ filename = buf })
        local exec = runners[ftype]
        if exec ~= nil then
            require("FTerm").scratch({ cmd = { exec, buf } })
        end
    end)

    local fterm = require("FTerm")

    local ncdu = fterm:new({
        ft = "terminal", -- You can also override the default filetype, if you want
        cmd = "ncdu",
        dimensions = {
            height = 0.9,
            width = 0.9,
        },
    })

    -- Use this to toggle ncdu in a floating terminal
    vim.keymap.set("n", "<A-c>", function()
        ncdu:toggle()
    end)

    vim.api.nvim_create_user_command("Ncdu", function()
        require("FTerm").run("ncdu")
    end, { bang = true })

    local gitui = fterm:new({
        ft = "terminal", -- You can also override the default filetype, if you want
        cmd = "gitui",
        dimensions = {
            height = 0.9,
            width = 0.9,
        },
    })

    -- Use this to toggle gitui in a floating terminal
    vim.keymap.set("n", "<A-g>", function()
        gitui:toggle()
    end)

    local yazi = fterm:new({
        ft = "terminal",
        cmd = "yazi",
        dimensions = {
            height = 0.9,
            width = 0.9,
        },
    })
    vim.keymap.set("n", "<A-y>", function()
        yazi:toggle()
    end)

    -- vim.api.nvim_create_user_command('Yazi', function()
    --     require('FTerm').run('yazi')
    -- end, { bang = true })

    -- Stratch Terminal
    -- require('FTerm').scratch({ cmd = 'yazi' })

    vim.api.nvim_create_user_command("Yazi2", function()
        require("FTerm").scratch({ cmd = { "yazi" } })
    end, { bang = true })
end
config.markdown_preview = function()
    vim.cmd([[
        let g:mkdp_auto_start = 0
        let g:mkdp_auto_close = 1
        let g:mkdp_refresh_slow = 0
        let g:mkdp_command_for_global = 0
        let g:mkdp_open_to_the_world = 0
        let g:mkdp_open_ip = ''
        let g:mkdp_browser = ''
        let g:mkdp_echo_preview_url = 0

        " Function to open all previews in different windows

				" function OpenMarkdownPreview (url)
        " let appname = "qutebrowser"
        " let pid = system("pgrep -f " . appname)
        " if pid != ""
				"   execute "silent ! qutebrowser --target=window " . a:url
        " else
				"   execute "!qutebrowser " . a:url . " &"
        " endif
				" endfunction
        
        " Function to open all previews in the same window

        function OpenMarkdownPreview (url)
				  execute "! qutebrowser " . a:url . " &"
				endfunction

				let g:mkdp_browserfunc = 'OpenMarkdownPreview'
        let g:mkdp_preview_options = {
            \ 'mkit': {},
            \ 'katex': {},
            \ 'uml': {},
            \ 'maid': {},
            \ 'disable_sync_scroll': 0,
            \ 'sync_scroll_type': 'middle',
            \ 'hide_yaml_meta': 1,
            \ 'sequence_diagrams': {},
            \ 'flowchart_diagrams': {},
            \ 'content_editable': v:false,
            \ 'disable_filename': 0,
            \ 'toc': {}
            \ }
        let g:mkdp_markdown_css = ''
        let g:mkdp_highlight_css = ''
        let g:mkdp_port = ''
        let g:mkdp_page_title = '「${name}」'
        let g:mkdp_filetypes = ['markdown']
        let g:mkdp_theme = 'dark'
			]])
end
config.vim_dadbod_ui = function()
    vim.cmd([[
     autocmd FileType dbui nnoremap <buffer> v <Plug>(DBUI_SelectLineVsplit)
    ]])
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
end
config.global_note = function()
    local global_note_status_ok, global_note = pcall(require, "global-note")
    if not global_note_status_ok then
        return
    end
    global_note.setup({
        filename = "todo.md",
        -- directory = vim.fn.stdpath("data") .. "/global-note/",
        directory = os.getenv("HOME") .. "/Home/",
        title = "Todo List",
        additional_presets = {
            inbox = {
                filename = "04-inbox.md",
                title = "fleeting Notes",
                command_name = "FleetingNotes",
                -- All not specified options are used from the root.
            },
            flashcards = {
                filename = "Templates/flashcards.md",
                title = "flashcards",
                command_name = "FlashCards",
            },
            flashcardsCloze = {
                filename = "Templates/flashcards_cloze.md",
                title = "flashcards Cloze",
                command_name = "FlashCardsCloze",
            },
        },
    })

    vim.keymap.set("n", "<leader>k", global_note.toggle_note, {
        desc = "Open todo list file",
    })
    vim.keymap.set("n", "<leader><leader>k", function()
        global_note.toggle_note("inbox")
    end, {
        desc = "Open fleeting file",
    })
    vim.keymap.set("n", "<leader><leader>f", function()
        global_note.toggle_note("flashcards")
    end, {
        desc = "Open flashcards file",
    })
    vim.keymap.set("n", "<leader><leader>fc", function()
        global_note.toggle_note("flashcardsCloze")
    end, {
        desc = "Open flashcards Cloze file",
    })
end
config.before = function()
    local before_status_ok, before = pcall(require, "before")
    if not before_status_ok then
        return
    end
    before.setup({
        telescope_for_preview = true,
    })

    -- Jump to previous entry in the edit history
    vim.keymap.set("n", "g;", before.jump_to_last_edit, {})

    -- Jump to next entry in the edit history
    vim.keymap.set("n", "g,", before.jump_to_next_edit, {})

    -- You can provide telescope opts to the picker as show_edits_in_telescope argument:
    vim.keymap.set("n", "<leader>cl", function()
        before.show_edits_in_telescope(require("telescope.themes").get_dropdown())
    end, {})
end
return config
