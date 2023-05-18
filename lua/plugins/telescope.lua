return {
	-- Telescope 
	"nvim-telescope/telescope.nvim",
  cmd = { "Telescope","Telescope find_files", "Telescope projects ", "Telescope oldfiles", "Telescope live_grep" },
  dependencies = {
    "ahmedkhalf/project.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-dap.nvim",
  },
  keys = {
    -- {"<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Telescope"},
    {"<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers"},
    {"<leader>f", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Find files"},
    {"<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text"},
    {"<leader>P", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects"},
    {"<leader>n", "<cmd>Telescope file_browser<cr>", desc = "File Browser"},
    -- {"<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Telescope"},
    -- {"<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Telescope"},

  },
  config = function()
    local status_ok, project = pcall(require, "project_nvim")
    if not status_ok then
      return
    end

    local status_ok, telescope = pcall(require, "telescope")
    if not status_ok then
      return
    end

    local actions = require "telescope.actions"

    telescope.setup {
      defaults = {

        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },

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
            ["<C-t>"] = actions.select_tab,

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
          },

          n = {
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

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["?"] = actions.which_key,
          },
        },
      },
      pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
      },
      extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
        file_browser = {
          theme = "ivy",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              -- your custom insert mode mappings
            },
            ["n"] = {
              -- your custom normal mode mappings
            },
          },
        },
      },
    }
    project.setup({
      ---@usage set to false to disable project.nvim.
      --- This is on by default since it's currently the expected behavior.
      active = true,

      on_config_done = nil,

      ---@usage set to true to disable setting the current-woriking directory
      --- Manual mode doesn't automatically change your root directory, so you have
      --- the option to manually do so using `:ProjectRoot` command.
      manual_mode = false,

      ---@usage Methods of detecting the root directory
      --- Allowed values: **"lsp"** uses the native neovim lsp
      --- **"pattern"** uses vim-rooter like glob pattern matching. Here
      --- order matters: if one is not detected, the other is used as fallback. You
      --- can also delete or rearangne the detection methods.
      -- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
      detection_methods = { "pattern" },

      ---@usage patterns used to detect root dir, when **"pattern"** is in detection_methods
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

      ---@ Show hidden files in telescope when searching for files in a project
      show_hidden = false,

      ---@usage When set to false, you will get a message when project.nvim changes your directory.
      -- When set to false, you will get a message when project.nvim changes your directory.
      silent_chdir = true,

      ---@usage list of lsp client names to ignore when using **lsp** detection. eg: { "efm", ... }
      ignore_lsp = {},

      ---@type string
      ---@usage path to store the project history for use in telescope
      datapath = vim.fn.stdpath("data"),
    })
    telescope.load_extension('projects')
    telescope.load_extension "file_browser"
    telescope.load_extension("notify")
  end

}
