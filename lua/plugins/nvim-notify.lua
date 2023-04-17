return {
  "rcarriga/nvim-notify",
  config = function()
    vim.notify = require("notify")
    require("notify").setup({
      background_colour = "#000000",
      render = "default",
      stages = "slide",
      max_width = "75",
      max_height = "25",
      minimum_width = "55",
      minimum_height = "10",
    })
  end,
}
