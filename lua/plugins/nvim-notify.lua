return {
  "rcarriga/nvim-notify",
  cmd = "Notifications",
  -- lazy = true,
  event = "VeryLazy",
  config = function()
    vim.notify = require("notify")
    require("notify").setup({
      background_colour = "NotifyBackground",
      render = "default",
      stages = "slide",
      max_width = "75",
      max_height = "25",
      minimum_width = "55",
      minimum_height = "10",
      fps = 30,
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = "",
      },
      level = 2,
      timeout = 1000,
      top_down = false,
    })
  end,
}
