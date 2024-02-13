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
          preview_height = 0.4
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
          ['<C-c>'] = actions.delete_buffer,
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
          ['<C-c>'] = actions.delete_buffer,
          ["<esc>"] = actions.close,
          ["<CR>"] = actions.select_default,
          ["<C-x>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          -- ["<C-t>"] = actions.select_tab,

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
config.which_key = function()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local setup = {
    plugins = {
      marks = true,       -- shows a list of your marks on ' and `
      registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = false,   -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = true,      -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true,      -- default bindings on <c-w>
        nav = true,          -- misc bindings to work with windows
        z = true,            -- bindings for folds, spelling and others prefixed with z
        g = true,            -- bindings for prefixed with g
      },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
      -- override the label used to display some keys. It doesn't effect WK in any other way.
      -- For example:
      -- ["<space>"] = "SPC",
      -- ["<cr>"] = "RET",
      -- ["<tab>"] = "TAB",
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "", -- symbol prepended to a group
    },
    popup_mappings = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>",   -- binding to scroll up inside the popup
    },
    window = {
      border = "rounded",       -- none, single, double, shadow
      position = "bottom",      -- bottom, top
      margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 },                                             -- min and max height of the columns
      width = { min = 20, max = 50 },                                             -- min and max width of the columns
      spacing = 3,                                                                -- spacing between columns
      align = "center",                                                           -- align columns left, center or right
    },
    ignore_missing = true,                                                        -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true,                                                             -- show help message on the command line when the popup is visible
    triggers = "auto",                                                            -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" },
      v = { "j", "k" },
    },
  }

  local opts = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
  }
  local mappings = require("modules.utils.whichkeys")
  which_key.setup(setup)
  which_key.register(mappings, opts)
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
      permanent_delete = true,
      use_as_default_explorer = true,
    },
  })
  local map_split = function(buf_id, lhs, direction)
    local rhs = function()
      local new_target_window
      vim.api.nvim_win_call(mini_files.get_target_window(), function()
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
-- config.mini_clue = function ()
--   local mini_clue_ok, mini_clue = pcall(require, "mini.clue")
--   if not mini_clue_ok then
--     return
--   end
--   mini_clue.setup({
--   triggers = {
--       -- Leader triggers
--       { mode = 'n', keys = '<Leader>' },
--       { mode = 'x', keys = '<Leader>' },
--
--       -- Built-in completion
--       { mode = 'i', keys = '<C-x>' },
--
--       -- `g` key
--       { mode = 'n', keys = 'g' },
--       { mode = 'x', keys = 'g' },
--
--       -- Marks
--       { mode = 'n', keys = "'" },
--       { mode = 'n', keys = '`' },
--       { mode = 'x', keys = "'" },
--       { mode = 'x', keys = '`' },
--
--       -- Registers
--       { mode = 'n', keys = '"' },
--       { mode = 'x', keys = '"' },
--       { mode = 'i', keys = '<C-r>' },
--       { mode = 'c', keys = '<C-r>' },
--
--       -- Window commands
--       { mode = 'n', keys = '<C-w>' },
--
--       -- `z` key
--       { mode = 'n', keys = 'z' },
--       { mode = 'x', keys = 'z' },
--     },
--
--     clues = {
--       -- Enhance this by adding descriptions for <Leader> mapping groups
--       { mode = "n", keys = "<Leader>i", desc = "Directory" },
--       mini_clue.gen_clues.builtin_completion(),
--       mini_clue.gen_clues.g(),
--       mini_clue.gen_clues.marks(),
--       mini_clue.gen_clues.registers(),
--       mini_clue.gen_clues.windows(),
--       mini_clue.gen_clues.z(),
--     },
--   })
-- end
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
config.nvim_colorizer = function()
  local colorizer_status_ok, colorizer = pcall(require, "colorizer")
  if not colorizer_status_ok then
    return
  end
  colorizer.setup({})
end
config.comment = function()
  local comment_status_ok, Comment = pcall(require, "Comment")
  if not comment_status_ok then
    return
  end
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
config.harpoon = function ()
   local harpoon = require("harpoon")
   harpoon:setup()
   vim.keymap.set("n", "<leader>aa", function() harpoon:list():append() end)
   vim.keymap.set("n", "<leader>am", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

   vim.keymap.set("n", "<leader>aq", function() harpoon:list():select(1) end)
   vim.keymap.set("n", "<leader>aw", function() harpoon:list():select(2) end)
   vim.keymap.set("n", "<leader>ae", function() harpoon:list():select(3) end)
   vim.keymap.set("n", "<leader>ar", function() harpoon:list():select(4) end)
   vim.keymap.set("n", "<leader>at", function() harpoon:list():select(5) end)
   vim.keymap.set("n", "<leader>ay", function() harpoon:list():select(6) end)
   vim.keymap.set("n", "<leader>au", function() harpoon:list():select(7) end)
   vim.keymap.set("n", "<leader>ai", function() harpoon:list():select(8) end)
   vim.keymap.set("n", "<leader>ao", function() harpoon:list():select(9) end)

   -- Toggle previous & next buffers stored within Harpoon list
   vim.keymap.set("n", "<leader>alp", function() harpoon:list():prev() end)
   vim.keymap.set("n", "<leader>aln", function() harpoon:list():next() end)

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
   vim.api.nvim_create_user_command("HarpoonAppend", function()
     harpoon:list():append()
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
  flash.setup(
    {
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
    }
  )
end
config.nvim_recorder = function ()
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

	require("lualine").setup {
		tabline = {
			lualine_y = lualineY,
			lualine_z = lualineZ,
		},
	}
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
        path = path
      },
    },
    completion = {
      nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
    },
    daily_notes = {
      folder = "2._Diary/a._Today/",
    },
    disable_frontmatter = false,
    templates = {
      subdir = "Templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M"
    },
    -- mappings = {
    --   -- ["_"] = require("obsidian.mapping").gf_passthrough(),
    -- },
    ui = {
      enable = true,  -- set to false to disable all additional syntax features
      update_debounce = 200,  -- update delay after a text change (in milliseconds)
      -- Define how various check-boxes are displayed
      checkboxes = {
        -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
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
        ObsidianRefText = { underline = true, fg = "#7580F4" },
        ObsidianExtLinkIcon = { fg = "#7580F4" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },
  })
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
      height = .5,
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

  vim.api.nvim_create_user_command('Ncdu', function()
      require('FTerm').run('ncdu')
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

  vim.api.nvim_create_user_command('Yazi2', function()
      require('FTerm').scratch({ cmd = { 'yazi'} })
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

return config
