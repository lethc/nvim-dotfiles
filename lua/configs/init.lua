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

vim.cmd([[ hi! CursorLineBG guibg=#373737 guifg=#E1E1E1 ]])

for _, func in pairs(base) do
    if type(func) == "function" then
        func()
    end
end

if vim.g.neovide then
    local alpha = function()
        return string.format("%x", math.floor(255 * (vim.g.transparency or 0.9)))
    end
    -- vim.o.guifont = "SF Mono:h11" -- Font
    vim.o.guifont = "Maple Mono NF:h10" -- Font
    vim.opt.linespace = 0
    vim.g.neovide_scale_factor = 1.0
    vim.g.neovide_padding_top = 0 --padding
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0
    -- vim.g.neovide_transparency = 0.8 --background
    vim.g.neovide_transparency = 1 --background
    vim.g.transparency = 0.8
    vim.g.neovide_background_color = "#141B1E" .. alpha()
end

function Cutlinetotodolist()
    -- Get the current line content
    local current_line = vim.api.nvim_get_current_line()
    -- Get the current cursor position
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    -- Define the path to the todo list file
    local todo_list_path = os.getenv("HOME") .. "/Home/01-todo.md"
    -- Open the todo list file in append mode
    local file = io.open(todo_list_path, "a")
    if file then
        -- Write the cut text to the file
        file:write(current_line .. "\n")
        -- Close the file
        file:close()
        -- Delete the line at the current cursor position
        vim.api.nvim_buf_set_lines(0, cursor_pos[1] - 1, cursor_pos[1], false, {})
        -- Output a message confirming the operation
        print("Line cut and pasted to todo list file")
    else
        print("Error: Unable to open todo list file for writing")
    end
end
vim.cmd([[command! CutLineToTodoList lua Cutlinetotodolist()]])
vim.api.nvim_set_keymap('n', '<Leader>ct', ':CutLineToTodoList<CR>', { noremap = true, silent = true })
