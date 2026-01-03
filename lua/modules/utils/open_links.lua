-- Open url links in is-fast browser inside neovim

vim.keymap.set("n", "gX", function()
    local line = vim.fn.getline(".") -- Get the current line
    local col = vim.fn.col(".") -- Get cursor position in the line

    -- Match a Markdown-style link [text](URL) using Lua pattern matching
    local before_cursor = line:sub(1, col) -- Text before the cursor
    local after_cursor = line:sub(col) -- Text after the cursor

    -- Find the nearest URL pattern `(URL)`
    local url = before_cursor:match("%b()") or after_cursor:match("%b()")

    if url then
        url = url:sub(2, -2) -- Remove surrounding parentheses
        vim.cmd('startinsert | tabnew | set norelativenumber | set nonumber | terminal is-fast -d "' .. url .. '"')
    else
        print("No valid URL found")
    end
end, { noremap = true, silent = true })
