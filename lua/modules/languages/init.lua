local languages_config = require("modules.languages.configs")
local modules = {
  {
    "nvim-treesitter/nvim-treesitter",
    -- event = "BufEnter",
    event = "BufReadPre",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    config = languages_config.nvim_treesitter,
  },
  { "luckasRanarison/tree-sitter-hypr" },
  {
    "RRethy/vim-illuminate",
    -- event = "VeryLazy",
    lazy = true,
  },
  {
    "williamboman/mason.nvim",
    -- dependencies = {
    --   "neovim/nvim-lspconfig",
    -- },
    config = languages_config.mason_nvim,
  },
  { "williamboman/mason-lspconfig.nvim", lazy = true },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    -- config = languages_config.nvim_lspconfig,
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = languages_config.lsp_saga,
  },
  {
    "SmiteshP/nvim-navbuddy",
    event = "LspAttach",
    config = languages_config.nvim_navbuddy,
  },
  {
    "SmiteshP/nvim-navic",
    event = "LspAttach",
    config = languages_config.nvim_navic,
  },
  {
    "folke/trouble.nvim",
    cmd = {
      "TroubleToggle",
      "TroubleToggle workspace_diagnostics",
      "TroubleToggle document_diagnostics",
      "TroubleToggle loclist",
      "TroubleToggle quickfix",
      "TroubleToggle lsp_references",
      "TroubleClose",
      "TroubleRefresh",
    },
    config = languages_config.trouble_nvim,
  },
  { --#### RUST LANGUAGE ####
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    config = languages_config.rust_tools,
  },
  {
    "Saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function()
      local crates = require("crates")
      crates.setup()
      crates.show()
    end

  },
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    config = languages_config.dap,
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = languages_config.nvim_jdtls,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python"
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    -- event = "VeryLazy"
    lazy = true,
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
  },
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   -- keys = "<space>l",
  --   event = "LspAttach",
  --   config = languages_config.null_ls,
  -- },
  {
    "stevearc/conform.nvim",
    config = languages_config.conform_nvim,
  },
  -- {
  --   "mhartington/formatter.nvim",
  --   config = languages_config.formatter_nvim,
  -- },
}
return modules
