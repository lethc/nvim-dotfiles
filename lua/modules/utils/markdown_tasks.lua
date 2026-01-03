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
