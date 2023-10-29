local modules = {
  { "nvim-lua/plenary.nvim",                      lazy = true },
  {
    "famiu/bufdelete.nvim",
    -- event = "VeryLazy",
    -- event = { "InsertEnter" },
    event = "BufReadPre",
  }, --delete buffers without losing window layout
  -- { "lvim-tech/lvim-linguistics" }
  { "nvim-tree/nvim-web-devicons",                lazy = true },
  -- { "theRealCarneiro/hyprland-vim-syntax",        ft = "hypr" },
  { "elkowar/yuck.vim",                           ft = "yuck" },
  { "peterhoeg/vim-qml",                          ft = "qml" },
  { "fei6409/log-highlight.nvim",                 ft = "log" },
  { "nvim-telescope/telescope-file-browser.nvim", lazy = true },
  { "neovim/nvim-lspconfig",                      lazy = true },
  -- { "hrsh7th/cmp-nvim-lsp",                       lazy = true, enabled = false },
  -- { "saadparwaiz1/cmp_luasnip",                   lazy = true, enabled = false },
  -- { "hrsh7th/cmp-path",                           lazy = true, enabled = false },
  -- { "kdheepak/cmp-latex-symbols",                 ft = "latex", lazy = true, enabled = false },
  -- { "rafamadriz/friendly-snippets",               lazy = true, enabled = false },
  { "MunifTanjim/nui.nvim",                       lazy = true },
  { "jwalton512/vim-blade",                       ft = "php" },
  { "kkharji/sqlite.lua",                         lazy = true },
  {
    "lervag/vimtex", ft = { "tex" },
    config = function ()
      vim.g.vimtex_mappings_enabled = false
    end
  }, --LaTeX
}
return modules
