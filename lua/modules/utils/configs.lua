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
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.5,
          results_width = 0.9,
        },
        vertical = {
          mirror = false,
        },
        width = 0.95,
        height = 0.95,
        preview_cutoff = 120,
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
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-c>"] = actions.close,
          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["<CR>"] = actions.select_default,
          ["<C-x>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          -- ["<C-t>"] = actions.select_tab,
          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,
          ["<PageUp>"] = actions.results_scrolling_up,
          ["<PageDown>"] = actions.results_scrolling_down,
          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<C-l>"] = actions.complete_tag,
          ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
          -- ["<C-o>"] = trouble.open_with_trouble,
        },
        n = {
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
          ["<PageUp>"] = actions.results_scrolling_up,
          ["<PageDown>"] = actions.results_scrolling_down,
          ["?"] = actions.which_key,
          -- ["<C-o>"] = trouble.open_with_trouble,
        },
      },
    },
    pickers = {
      file_browser = {
        hidden = true,
      },
      find_files = {
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
  telescope.load_extension("macros")
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
      group = "+", -- symbol prepended to a group
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
    post_hook = function(ctx)
      if ctx.range.srow == ctx.range.erow then
        -- do something with the current line
      else
        -- do something with lines range
      end
    end,
  })
end
config.flash_nvim = function()
  local flash_status_ok, flash = pcall(require, "flash")
  if not flash_status_ok then
    return
  end
  flash.setup({
    search = {
      exclude = {
        "notify",
        "noice",
        "cmp_menu",
        function(win)
          return not vim.api.nvim_win_get_config(win).focusable
        end,
      },
    },
    modes = {
      char = {
        enabled = true,
      },
    },
  })
  local Config = require("flash.config")
  local Char = require("flash.plugins.char")
  for _, motion in ipairs({ "f", "t", "F", "T" }) do
    vim.keymap.set({ "n", "x", "o" }, motion, function()
      flash.jump(Config.get({
        mode = "char",
        search = {
          mode = Char.mode(motion),
          max_length = 1,
        },
      }, Char.motions[motion]))
    end)
  end
  vim.keymap.set({ "n", "x", "o" }, "<C-c>.", function()
    flash.jump()
  end)
  vim.keymap.set({ "n", "x", "o" }, "<C-c>,", function()
    flash.treesitter()
  end)
  vim.keymap.set({ "o" }, "r", function()
    require("flash").remote()
  end)
  vim.keymap.set({ "n", "x", "o" }, "<C-c>;", function()
    flash.jump({
      search = { mode = "search" },
      label = { after = false, before = { 0, 0 }, uppercase = false },
      pattern = [[\<\|\>]],
      action = function(match, state)
        state:hide()
        flash.jump({
          search = { max_length = 0 },
          label = { distance = false },
          highlight = { matches = false },
          matcher = function(win)
            return vim.tbl_filter(function(m)
              return m.label == match.label and m.win == win
            end, state.results)
          end,
        })
      end,
      labeler = function(matches, state)
        local labels = state:labels()
        for m, match in ipairs(matches) do
          match.label = labels[math.floor((m - 1) / #labels) + 1]
        end
      end,
    })
  end)
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
      play_macro = "M",
      yank_macro = "yq",
      stop_macro = "cq",
      toggle_record = "m",
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
  local path = os.getenv("HOME") .. "/Sync/"
  obsidian.setup({
    dir = path,
    completion = {
      nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
    },
    daily_notes = {
      folder = "Diary/a. Today/",
    },
    disable_frontmatter = false,
    templates = {
      subdir = "Templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M"
    },
    mappings = {
      ["_"] = require("obsidian.mapping").gf_passthrough(),
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
    ft = "FTerm",
    cmd = os.getenv("SHELL"),
    border = "rounded",
    dimensions = {
      height = 0.8,
      width = 0.8,
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
    ft = "fterm_ncdu", -- You can also override the default filetype, if you want
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

  local gitui = fterm:new({
    ft = "fterm_gitui", -- You can also override the default filetype, if you want
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

  local joshuto = fterm:new({
    ft = "FTerm",
    cmd = "joshuto",
    dimensions = {
      height = 0.9,
      width = 0.9,
    },
  })
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

				function OpenMarkdownPreview (url)
        let appname = "qutebrowser"
        let pid = system("pgrep -f " . appname)
        if pid != ""
				  execute "silent ! qutebrowser --target=window " . a:url
        else
				  execute "!qutebrowser " . a:url . " &"
        endif
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
