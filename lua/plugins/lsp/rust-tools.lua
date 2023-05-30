return {
  "simrat39/rust-tools.nvim",
  ft = "rust",
  opt = function()
    return require("plugins.lsp.mason")
  end,
  config = function(_, opts)
    require("rust-tools").setup(opts)
  end,
}
