-- require("configs.core")
local base = require("configs.base")
local lazy = require("configs.core.lazy")
-- local theme = require("configs.ui.colorscheme")
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

lazy.is_lazy()
lazy.load()
-- theme.colour()

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

-- Value required for cmp selection colours
-- vim.cmd([[ hi! CursorLineBG guibg=#AD677C guifg=#1e222a ]])
vim.cmd([[ hi! CursorLineBG guibg=#61afef guifg=#1e222a ]])
-- vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level
vim.g.markdown_recommended_style = 0 -- Stop 4 space indentation in markdown

for _, func in pairs(base) do
    if type(func) == "function" then
        func()
    end
end

require("modules.utils.telescope_directory")
require("modules.utils.neovide_config")
require("modules.utils.flashcards")
require("modules.utils.last_used_buffer")
require("modules.utils.open_links")
require("modules.utils.todolist")
require("modules.utils.markdown_tasks")
require("modules.utils.insert_double_click")
