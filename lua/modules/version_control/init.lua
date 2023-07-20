local edit_config = require("modules.version_control.configs")
local modules = {
  {
    "lewis6991/gitsigns.nvim",
    -- event = { 'BufRead', 'BufNewFile' },
    event = "BufReadPre",
    config = edit_config.gitsigns_nvim,
  },
  {
    "sindrets/diffview.nvim",
    config = function ()end,
  },
}
return modules
