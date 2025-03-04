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
    vim.o.guifont = "Maple Mono NF:h13" -- Font
    vim.o.linespace = -1

    -- emulate alacritty font rendering
    vim.g.neovide_text_gamma = 0.8
    vim.g.neovide_text_contrast = 0.1

    -- padding
    vim.g.neovide_padding_top = 5
    vim.g.neovide_padding_left = 5
    -- vim.g.neovide_padding_bottom = 0
    -- vim.g.neovide_padding_right = 0

    vim.g.neovide_floating_corner_radius = 1.0

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
vim.api.nvim_set_keymap("n", "<Leader>ct", ":CutLineToTodoList<CR>", { noremap = true, silent = true })

-- Value required for cmp selection colours
-- vim.cmd([[ hi! CursorLineBG guibg=#373737 guifg=#cac9dd ]])
-- vim.cmd([[ hi! CursorLineBG guibg=#61afef guifg=#1e222a ]])
vim.cmd([[ hi! CursorLineBG guibg=#B04241 guifg=#1e222a ]])
-- vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level
vim.g.markdown_recommended_style = 0 -- Stop 4 space indentation in markdown

-- Toggle between [ ] and [x] and Update the task status in the todo list

local function escape_pattern(text)
    -- Escape special Lua pattern characters
    local matches = { "%", ".", "?", "*", "+", "-", "(", ")", "[", "]", "^", "$" }
    for _, match in ipairs(matches) do
        text = text:gsub("%" .. match, "%%" .. match)
    end
    return text
end

local function get_task_name(line)
    -- Extract the task name enclosed in double brackets [[...]]
    local task_name = line:match("%[%[.-%]%]")
    return task_name and task_name:sub(3, -3) or nil
end

local function search_and_update_task(task_name, new_status, exclude_dir)
    -- Specify the directory to search
    local base_dir = vim.fn.expand("~/Home")
    -- Find all markdown files, excluding the `exclude_dir`
    local cmd = "find " .. base_dir .. " -type f -name '*.md' -not -path '" .. exclude_dir .. "/*'"
    local handle = io.popen(cmd)
    if not handle then
        print("Error: Unable to search files.")
        return
    end
    local result = handle:read("*a")
    handle:close()

    -- Escape the task name for pattern matching
    local escaped_task_name = escape_pattern(task_name)

    -- Iterate over the found files
    for file in result:gmatch("[^\n]+") do
        -- Read file lines
        local lines = {}
        for line in io.lines(file) do
            table.insert(lines, line)
        end

        -- Check for the task and update its status
        local modified = false
        for i, line in ipairs(lines) do
            -- Match any task with the same name, regardless of current status
            if line:match("%- %[.?%] %[%[" .. escaped_task_name .. "%]%]") then
                -- Update the task status, handling both completion and uncommenting
                lines[i] = line:gsub("%- %[.?%]", "- [" .. new_status .. "]")
                modified = true
            end
        end

        -- If the file was modified, write it back
        if modified then
            local file_handle = io.open(file, "w")
            if file_handle then
                for _, updated_line in ipairs(lines) do
                    file_handle:write(updated_line .. "\n")
                end
                file_handle:close()
                print("Updated task in: " .. file)
            else
                print("Error: Unable to write to file " .. file)
            end
        end
    end
end

function ToggleMarkdownTask()
    -- Get the current line
    local line = vim.api.nvim_get_current_line()

    -- Extract the task name
    local task_name = get_task_name(line)
    if not task_name then
        print("No valid task found on this line.")
        return
    end

    -- Toggle the task status
    local new_line, new_status
    if line:match("^%s*%- %[%s%]") then
        -- Toggle from uncompleted to completed
        new_line = line:gsub("%[%s%]", "[x]")
        new_status = "x"
    elseif line:match("^%s*%- %[x%]") then
        -- Toggle from completed to uncompleted
        new_line = line:gsub("%[x%]", "[ ]")
        new_status = " "
    else
        print("No valid task to toggle.")
        return
    end

    -- Update the current line
    vim.api.nvim_set_current_line(new_line)

    -- Synchronize the task status with other copies
    local exclude_dir = vim.fn.expand("~/Home/Daily_notes")
    search_and_update_task(task_name, new_status, exclude_dir)
end

-- Map the toggle function to a key (e.g., <leader><leader>t)
vim.keymap.set("n", "<leader><leader>t", ToggleMarkdownTask, { noremap = true, silent = true })

-- INSERT IN DOUBLE CLICK

-- Prevent the plugin from being loaded multiple times
if vim.g.loaded_enter_insert_on_click then
    return
end
vim.g.loaded_enter_insert_on_click = true

-- Enable mouse support only for specific actions
vim.o.mouse = "nv" -- Enable mouse in Normal mode only

-- Variables to track click count and timing
local click_count = 0
local last_click_time = 0
local double_click_threshold = 300 -- Time in milliseconds

-- Define the main function globally so it can be called from mappings
function _G.enter_insert_on_double_click()
    local current_time = vim.loop.hrtime() / 1e6 -- Convert nanoseconds to milliseconds
    local time_since_last_click = current_time - last_click_time

    -- If time between clicks is within the threshold, count as a double click
    if time_since_last_click <= double_click_threshold then
        click_count = click_count + 1
    else
        click_count = 1 -- Reset click count for a new sequence
    end

    last_click_time = current_time

    -- Trigger Insert mode on the second click
    if click_count == 2 then
        if vim.api.nvim_get_mode().mode ~= "i" then
            -- vim.cmd("startinsert")
            -- Adjust the cursor position if it is at the end of the line
            local current_col = vim.fn.col(".")
            local line_length = vim.fn.col("$") - 1 -- Exclude the newline character
            if current_col == line_length then
                vim.cmd("startinsert!")
            else
                vim.cmd("startinsert")
            end
        end
        click_count = 0 -- Reset the counter after a successful double click
    end
end

-- Disable default Visual mode on double-click
vim.api.nvim_set_keymap(
    "n", -- Normal mode mapping
    "<2-LeftMouse>", -- Double-click event
    ":lua enter_insert_on_double_click()<CR>", -- Call Lua function
    { noremap = true, silent = true }
)

-- Map <LeftRelease> to handle the release part of the click
vim.api.nvim_set_keymap(
    "n", -- Normal mode mapping
    "<LeftRelease>", -- Mouse left-release event
    ":lua enter_insert_on_double_click()<CR>", -- Call Lua function
    { noremap = true, silent = true }
)
vim.cmd([[
aunmenu PopUp.How-to\ disable\ mouse
aunmenu PopUp.-1-
]])
