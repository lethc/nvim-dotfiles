return {
  "Alexis12119/nightly.nvim",
  cmd = "Telescope colorscheme",
  lazy = false,
  config = function()
    require("nightly").setup({
      -- color = "red", -- blue, green or red
      transparent = vim.g.transparent_enabled,
      styles = {
        comments = { italic = true },
        functions = { italic = false },
        keywords = { italic = false },
        variables = { italic = false },
      },
      highlights = {
        -- add or override highlights
        -- Normal = { bg = "#000000" }
      },
    })
  end,
}
