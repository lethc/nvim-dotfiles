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

vim.cmd([[ hi! CursorLineBG guibg=#373737 guifg=#E1E1E1 ]])

for _, func in pairs(base) do
    if type(func) == "function" then
        func()
    end
end

if vim.g.neovide then
    -- vim.o.guifont = "SF Mono:h11" -- Font
    vim.o.guifont = "Maple Mono NF:h10" -- Font
    vim.o.linespace = -1

    -- emulate alacritty font rendering
    vim.g.neovide_text_gamma = 0.8
    vim.g.neovide_text_contrast = 0.1

    -- padding
    vim.g.neovide_padding_top = 5
    vim.g.neovide_padding_left = 5
    -- vim.g.neovide_padding_bottom = 0
    -- vim.g.neovide_padding_right = 0

    -- disable blur
    -- vim.g.neovide_window_blurred = false
    -- vim.g.neovide_floating_blur_amount_x = 0.0
    -- vim.g.neovide_floating_blur_amount_y = 0.0
    -- vim.g.neovide_floating_shadow = false
    -- vim.g.neovide_floating_z_height = 0
    -- vim.g.neovide_light_angle_degrees = 0
    -- vim.g.neovide_light_radius = 0
    --
    -- vim.g.neovide_transparency = 1.0
    -- -- vim.g.neovide_transparency = 0.8 --background
    -- vim.g.neovide_hide_mouse_when_typing = true
    -- vim.g.neovide_underline_stroke_scale = 0.5
    -- vim.g.neovide_refresh_rate = 60
    -- vim.g.neovide_fullscreen = false
    -- vim.g.neovide_remember_window_size = false
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

-- Value required for cmp selection colours
-- vim.cmd([[ hi! CursorLineBG guibg=#373737 guifg=#cac9dd ]])
vim.cmd([[ hi! CursorLineBG guibg=#61afef guifg=#1e222a ]])
-- vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level
