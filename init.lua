require "options"
require "autocommands"
require "keymaps"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  spec = {
    {import = "plugins"},
    {import = "plugins.lsp"},
    {import = "plugins.colorscheme"},
    {import = "plugins.dap"},
  },
  ui = {
    border = "rounded"
  },
  performance = {
    rtp = {
      reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
      disabled_plugins = {
        "themer.lua",
      },
    },
  },
}

require "colorscheme"
require ("plugins.lsp.settings.handlers").setup()
