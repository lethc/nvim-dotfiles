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

}

return modules
