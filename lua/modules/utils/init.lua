local edit_config = require("modules.utils.configs")
local modules = {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<leader>sf", "<Cmd>Telescope find_files<CR>",   desc = "Telescope find files" },
      { "<leader>si", "<Cmd>Telescope notify<CR>",       desc = "Telescope Notify" },
      { "<leader>sF", "<Cmd>Telescope live_grep<CR>",    desc = "Telescope live grep" },
      { "<leader>n",  "<Cmd>Telescope file_browser<CR>", desc = "Telescope file browser" },
      { "<leader>sb", "<Cmd>Telescope buffers<CR>",      desc = "Telescope buffers" },
      { "<leader>so", "<cmd>Telescope oldfiles<cr>",     desc = "Telescope old files" },
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
    },
    config = edit_config.telescope_nvim,
  },
  {
    "echasnovski/mini.files",
    keys = {
      {
        "<Leader>e",
        function()
          require("mini.files").open()
        end,
        desc = "Mini files",
      },
    },
    config = edit_config.mini_files,
  },
  {
    "folke/which-key.nvim",
    -- event = "VeryLazy",
    keys = "<leader>",
    config = edit_config.which_key
  },
  { "HampusHauffman/block.nvim", cmd = { "Block", "BlockOn" }, config = edit_config.block },
  {
    "roobert/search-replace.nvim",
    -- event = "VeryLazy",
    keys = { "<leader>c" },
    config = edit_config.search_replace
  },
  { "uga-rosa/ccc.nvim",         cmd = "CccPick" }, --Colorpicker
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
    keys = {
      { "<leader>ae", [[<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]], desc = "Toggle Menu" },
      { "<leader>aa", [[<cmd>lua require("harpoon.mark").add_file()<CR>]],        desc = "Add File" },
      { "<leader>ay", [[<cmd>lua require("harpoon.ui").nav_file(1)<CR>]],         desc = "Add File" },
      { "<leader>au", [[<cmd>lua require("harpoon.ui").nav_file(2)<CR>]],         desc = "Add File" },
      { "<leader>ai", [[<cmd>lua require("harpoon.ui").nav_file(3)<CR>]],         desc = "Add File" },
      { "<leader>ao", [[<cmd>lua require("harpoon.ui").nav_file(4)<CR>]],         desc = "Add File" },
      { "<leader>ap", [[<cmd>lua require("harpoon.ui").nav_file(5)<CR>]],         desc = "Add File" },
    }
  },
  {
    "folke/flash.nvim",
    event = { "InsertEnter" },
    keys = {
      { "<leader>" }, { "/", mode = { "n" } }
    },
    config = edit_config.flash_nvim,
  },
  {
    "ecthelionvi/NeoComposer.nvim",
    event = { "BufReadPre" },
    -- keys = {
    --   { "m", mode = { "n" } }
    -- },
    config = edit_config.NeoComposer_nvim,
  },
  {
    'epwalsh/obsidian.nvim',
    cmd = { "ObsidianSearch", "ObsidianQuickSwitch", "ObsidianOpen" },
    -- dependencies = {
    --   'junegunn/fzf.vim'
    -- },
    config = edit_config.obsidian_nvim,
  },
  {
    "xorid/asciitree.nvim",
    keys = { "<leader>ca", "<cmd>lua require('asciitree').setup()<CR>" },
    config = edit_config.asciitree_nvim
  },
  {
    "turbio/bracey.vim",
    ft = "html",
    build = "npm install --prefix server",
    config = function()
      vim.cmd([[
        let g:bracey_browser_command='firefox-developer-edition'
      ]])
    end,
  },
  {
    "samjwill/nvim-unception", --Open files from Neovim's terminal
    event = "VeryLazy",
    init = function()
      -- Optional settings go here!
      -- vim.g.unception_open_buffer_in_new_tab = true
      vim.api.nvim_create_autocmd("User", {
        pattern = "UnceptionEditRequestReceived",
        callback = function()
          -- Toggle the terminal off.
          require("FTerm").toggle()
        end,
      })
    end,
  },
  {
    "numToStr/FTerm.nvim",
    keys = {
      { "<A-g>",           "<cmd><cr>",            desc = "Gitui" },
      { "<A-d>",           "<cmd>FTermToggle<cr>", desc = "FTerm" },
      { "<leader>tf",      "<cmd>FTermToggle<cr>", desc = "Toggle Terminals" },
      { "<leader><Enter>", "<cmd>FTermEnter<cr>",  desc = "Execute Terminals" },
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
    config = function(_, opts) require("compiler").setup(opts) end,
  },
  {                                                      -- The framework that compiler use to run tasks
    "stevearc/overseer.nvim",
    commit = "3047ede61cc1308069ad1184c0d447ebee92d749", -- avoid breaking changes
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
          ["q"] = function() vim.cmd("OverseerClose") end,
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
}
return modules
