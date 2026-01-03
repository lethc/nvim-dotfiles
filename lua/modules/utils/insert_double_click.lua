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
