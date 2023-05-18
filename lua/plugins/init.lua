return {
  "arjunmahishi/flow.nvim", --Required for Telescope
  "nvim-lua/plenary.nvim",
  "moll/vim-bbye",
  "elkowar/yuck.vim",
  "peterhoeg/vim-qml",
  { "voldikss/vim-floaterm" },
  "tpope/vim-surround",
  "tpope/vim-fugitive",
  "KabbAmine/lazyList.vim",
  "jwalton512/vim-blade",
  "mihaifm/bufstop",
  "adoy/vim-php-refactoring-toolbox",
  "uga-rosa/ccc.nvim", --Colorpicker
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup({
        width = 120,                                     -- Width of the floating window
        height = 15,                                     -- Height of the floating window
        border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
        default_mappings = false,                        -- Bind default mappings
        debug = false,                                   -- Print debug information
        opacity = nil,                                   -- 0-100 opacity level of the floating window where 100 is fully transparent.
        resizing_mappings = false,                       -- Binds arrow keys to resizing the floating window.
        post_open_hook = nil,                            -- A function taking two arguments, a buffer and a window to be ran as a hook.
        references = {                                   -- Configure the telescope UI for slowing the references cycling window.
          telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
        },
        -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
        focus_on_open = true,                                    -- Focus the floating window when opening it.
        dismiss_on_move = false,                                 -- Dismiss the floating window when moving the cursor.
        force_close = true,                                      -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
        bufhidden = "wipe",                                      -- the bufhidden option to set on the floating window. See :h bufhidden
        stack_floating_preview_windows = true,                   -- Whether to nest floating windows
        preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
      })
    end,
  },
  {
    "weirongxu/plantuml-previewer.vim",
    dependencies = {
      "aklt/plantuml-syntax",
      "tyru/open-browser.vim",
    },
  },
  {
    "skanehira/preview-uml.vim",
    config = function()
      vim.g.preview_uml_url = "http://localhost:8080"
    end,
  }, --UML preview
  {
    "ekickx/clipboard-image.nvim",
    config = function() --Set a symbolic link between your Obsidian img folder and your user path
    end,
  },
  {
    "NvChad/nvim-colorizer.lua", --Display colors
    opts = {},
  },
  "pedro757/emmet",
  "lervag/vimtex", --LaTeX
  -- {
  -- 	"iamcco/markdown-preview.nvim",
  -- 	-- build = function ()
  -- 	--   vim.fn["mkdp#util#install"]()
  -- 	-- end,
  -- 	config = function()
  -- 		vim.g.mkdp_browser = "firefox"
  -- 		-- function OpenMarkdownPreview(url)
  -- 		--    vim.fn.execute("silent ! firefox --new-window " .. url)
  -- 		-- end
  -- 		-- vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
  -- 	end,
  -- },

  {
    "samjwill/nvim-unception", --Open files from within Neovim's terminal
    init = function()
      -- Optional settings go here!
      -- e.g.) vim.g.unception_open_buffer_in_new_tab = true
    end,
  },
  --Run lines of code inside neovim
  { "michaelb/sniprun" }, --run = 'bash ./install.sh 1'

  -- LSP
  "simrat39/rust-tools.nvim",

  -- Debug Adapter Protocol
  -- "mfussenegger/nvim-dap",
  -- "rcarriga/nvim-dap-ui",
  -- "theHamsta/nvim-dap-virtual-text",
  -- "leoluz/nvim-dap-go",
  -- "mfussenegger/nvim-dap-python",
  -- "mfussenegger/nvim-jdtls",

  -- Database connections
  -- use { "kristijanhusak/vim-dadbod-ui" }
  -- use { "kristijanhusak/vim-dadbod-completion" }
  -- use { "tpope/vim-dadbod" }
  -- use { "tpope/vim-dotenv" }

  -- Others
  -- use {
  --     'glacambre/firenvim',
  --     run = function() vim.fn['firenvim#install'](0) end
  -- } --Embed Neovim in Chrome, Firefox & others.

  -- "dstein64/vim-startuptime",
  -- 'kevinhwang91/rnvimr',
  -- "JoosepAlviste/nvim-ts-context-commentstring",
  --"lewis6991/impatient.nvim"
  -- "toppair/peek.nvim", -- like markdown-preview
}
