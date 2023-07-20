-- require("configs.core")
local base = require("configs.base")
local lazy = require("configs.core.lazy")
local theme = require("configs.ui.colorscheme")
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

lazy.is_lazy()
lazy.load()
theme.colour()

for _, func in pairs(base) do
  if type(func) == "function" then
    func()
  end
end
