local completion_config = require("modules.completion.configs")
local modules = {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "kdheepak/cmp-latex-symbols",
      "hrsh7th/cmp-cmdline",
      "rafamadriz/friendly-snippets",
      "chrisgrieser/cmp-nerdfont",
      "amarakon/nvim-cmp-fonts",
    },
    event = { "InsertEnter" },
    keys = {
      { "/", mode = { "n" } }
    },
    config = completion_config.nvim_cmp,
  },
  {
    "L3MON4D3/LuaSnip",
    event = { "InsertEnter" },
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = completion_config.nvim_autopairs,
  },
  {
    "kylechui/nvim-surround",
    -- event = "VeryLazy",
    keys = {
      { "ysiw", mode = { "n" } },
      { "ysst", mode = { "n" } },
      { "ys$",  mode = { "n" } },
      { "ds",   mode = { "n" } },
      { "dst",  mode = { "n" } },
      { "cs",   mode = { "n" } },
      { "cst",  mode = { "n" } },
      { "dsf",  mode = { "n" } },
    },
    config = completion_config.nvim_surround,
  },
  {
    "jakewvincent/mkdnflow.nvim",
    ft = "markdown",
    config = completion_config.mkdnflow_nvim,
  },
  {
    "lethc/clipboard-image.nvim", --forked from  "ekickx/clipboard-image.nvim",
    keys = { "<leader>wp", "<cmd>lua require('clipboard-image').setup()<CR>" },
    config = completion_config.clipboard_image,
  },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    config = function ()end
  },
  {
    "Exafunction/codeium.nvim",
    -- event = { "InsertEnter" },
    keys = {
      {
        "<Leader>cc",
        function()
          require("codeium").setup({})
        end,
        desc = "Codeium nvim",
      },
    },
  },
  {
   "Exafunction/codeium.vim",
    -- event = 'BufEnter',
    cmd = "CodeiumEnable",
    config = function ()
      vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-.>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
    end
  },
  {
    "preservim/vim-pencil",
  },
}

return modules
