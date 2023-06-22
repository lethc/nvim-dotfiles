return {
  -- Telescope
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope", "Telescope find_files", "Telescope oldfiles", "Telescope live_grep", "Telescope smart_open" },
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-dap.nvim",
    "arjunmahishi/flow.nvim", --Required for Telescope
    {
      "danielfalk/smart-open.nvim",
      branch = "0.2.x",
      "kkharji/sqlite.lua",
      -- Only required if using match_algorithm fzf
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      dependencies = {

      },
    },
  },
  keys = {
    -- {"<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Telescope"},
    { "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers" },
    { "<leader>f", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Find files" },
    { "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>",                                                                            desc = "Find Text" },
    { "<leader>n", "<cmd>Telescope file_browser<cr>",                                                                                   desc = "File Browser" },
    -- {"<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Telescope"},
    -- {"<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Telescope"},

  },
  config = function()
    local status_ok, telescope = pcall(require, "telescope")
    if not status_ok then
      return
    end

    local actions = require "telescope.actions"
    local trouble = require("trouble.providers.telescope")

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
            ["<C-o>"] = trouble.open_with_trouble
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
            ["<C-o>"] = trouble.open_with_trouble
          },
        },
      },
      pickers = {
        live_grep = {
          additional_args = function(opts)
            return { "--hidden" }
          end
        }
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
        smart_open = {
          show_scores = false,
          ignore_patterns = { "*.git/*", "*/tmp/*" },
          match_algorithm = "fzf",
          disable_devicons = false,
        },
      },
    }
    telescope.load_extension "file_browser"
    telescope.load_extension("notify")
    telescope.load_extension("smart_open")
  end

}
