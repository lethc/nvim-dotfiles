-- Special Funtion for my Todolist

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
