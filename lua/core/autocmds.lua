local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- General settings
local general = augroup("GeneralSettings", { clear = true })

autocmd("FileType", {
    group = general,
    pattern = { "qf", "help", "man", "lspinfo" },
    callback = function()
        vim.keymap.set("n", "q", ":close<CR>", { buffer = true, silent = true })
    end,
})

autocmd("TextYankPost", {
    group = general,
    desc = "Highlight yanked text",
    callback = function()
        vim.hl.on_yank({ higroup = "Visual", timeout = 200 })
    end,
})

autocmd("BufWinEnter", {
    group = general,
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
})

autocmd("BufWinEnter", {
    group = general,
    callback = function()
        vim.opt.fillchars = {
            eob = " ",
            fold = " ",
            foldopen = "",
            foldsep = " ",
            foldclose = "",
        }
    end,
})

autocmd("FileType", {
    group = general,
    pattern = "qf",
    command = "set nobuflisted",
})

autocmd("InsertEnter", {
    group = general,
    command = "set colorcolumn=117",
})

-- Git
local git = augroup("GitSettings", { clear = true })

autocmd("FileType", {
    group = git,
    pattern = "gitcommit",
    command = "setlocal wrap spell",
})

-- Markdown
local markdown = augroup("MarkdownSettings", { clear = true })

autocmd("FileType", {
    group = markdown,
    pattern = "markdown",
    callback = function()
        vim.opt_local.wrap = false
        vim.opt_local.spell = true
        -- vim.opt_local.textwidth = 116
        vim.opt_local.shiftwidth = 2
    end,
})

-- Auto resize
local resize = augroup("AutoResize", { clear = true })

autocmd("VimResized", {
    group = resize,
    command = "tabdo wincmd =",
})

-- Alpha
local alpha = augroup("AlphaSettings", { clear = true })

autocmd("User", {
    group = alpha,
    pattern = "AlphaReady",
    command = "set showtabline=0 laststatus=0 noruler",
})

-- Zsh as sh
local zsh = augroup("ZshAsSh", { clear = true })

autocmd({ "BufWinEnter", "FileType" }, {
    group = zsh,
    callback = function()
        if vim.bo.filetype == "zsh" then
            vim.bo.filetype = "sh"
        end
    end,
})

-- Signcolumn
local signcolumn = augroup("AlwaysSigncolumn", { clear = true })

autocmd({ "BufEnter", "WinEnter" }, {
    group = signcolumn,
    callback = function()
        local ft = vim.bo.filetype
        if
            not ft:match("nofile")
            and not ft:match("prompt")
            and ft ~= "neo-tree"
            and ft ~= "alpha"
            and ft ~= "minifiles"
        then
            vim.opt_local.signcolumn = "yes:2"
        end
    end,
})

autocmd("WinLeave", {
    group = signcolumn,
    command = "set signcolumn=yes:2",
})

-- Obsidian template
local obsidian = augroup("ObsidianAutoTemplate", { clear = true })

autocmd("BufReadPost", {
    group = obsidian,
    pattern = "*.md",
    callback = function(args)
        local path = vim.fn.expand("%:p")
        if path:match("^" .. vim.fn.expand("~/Home/")) and vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
            vim.cmd("Obsidian template template_idea")

            autocmd("CursorMoved", {
                buffer = args.buf,
                once = true,
                callback = function()
                    vim.cmd("normal! G")
                end,
            })
        end
    end,
})

-- Create a keybind to generate a new note from template
vim.keymap.set("n", "<leader>m1", function()
    -- Get the current file name (without extension)
    local current_file = vim.fn.expand("%:t:r")
    if current_file == "" then
        vim.notify("No file currently open", vim.log.levels.WARN)
        return
    end

    -- Ask for the new note name
    vim.ui.input({
        prompt = "Enter new note name: ",
        default = "",
    }, function(input)
        if not input or input == "" then
            vim.notify("Note creation cancelled", vim.log.levels.INFO)
            return
        end

        -- Ask where to place the link
        local choices = {
            "NORTH (Comes from)",
            "SOUTH (Will lead to)",
            "WEST (Is Similar to)",
            "EAST (Is Opposite to)",
        }

        vim.ui.select(choices, {
            prompt = "Where should the link to current note be placed?",
            format_item = function(item)
                return item
            end,
        }, function(choice)
            if not choice then
                vim.notify("Link placement cancelled", vim.log.levels.INFO)
                return
            end

            -- Extract the direction from the choice
            local direction = choice:match("^(%w+)")

            -- Sanitize the input (remove problematic characters)
            local sanitized = input:gsub("[^%w%s-]", ""):gsub("%s+", " ")
            local filename = sanitized .. ".md"

            -- Get the directory of the current file
            local current_dir = vim.fn.expand("%:p:h")
            local new_file_path = current_dir .. "/" .. filename

            -- Check if file already exists
            if vim.fn.filereadable(new_file_path) == 1 then
                vim.notify("File already exists: " .. filename, vim.log.levels.WARN)
                return
            end

            -- Create the new file with template
            vim.cmd("edit " .. new_file_path)

            -- Wait a moment for the buffer to load
            vim.defer_fn(function()
                -- Apply the template
                vim.cmd("Obsidian template template_idea")

                -- Wait for template to be applied, then insert the link
                vim.defer_fn(function()
                    -- Get the current buffer content
                    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

                    -- Find the line with the selected direction
                    local pattern = "^>%[!NOTE%] " .. direction .. " %("
                    if direction == "NORTH" then
                        pattern = pattern .. "Comes from%)"
                    elseif direction == "SOUTH" then
                        pattern = pattern .. "Will lead%) to:?"
                    elseif direction == "WEST" then
                        pattern = pattern .. "Is Similar%) to:?"
                    elseif direction == "EAST" then
                        pattern = pattern .. "Is Opposite%) to:?"
                    end

                    -- More robust pattern matching
                    local patterns = {
                        NORTH = "^>%[!NOTE%] Comes from %(NORTH%):",
                        SOUTH = "^>%[!NOTE%] Will lead %(SOUTH%) to:",
                        WEST = "^>%[!NOTE%] Is Similar %(WEST%) to:",
                        EAST = "^>%[!NOTE%] Is Opposite %(EAST%) to:",
                    }

                    local target_pattern = patterns[direction]

                    for i, line in ipairs(lines) do
                        if line:match(target_pattern) then
                            -- Insert the link on the next line
                            local link = "[[" .. current_file .. "]]"
                            table.insert(lines, i + 1, link)
                            vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
                            break
                        end
                    end

                    -- Move cursor to the bottom
                    vim.cmd("normal! G")
                    vim.notify("Created: " .. filename .. " (linked from " .. direction .. ")", vim.log.levels.INFO)
                end, 100) -- 100ms delay
            end, 50) -- 50ms delay
        end)
    end)
end, {
    desc = "Create new Obsidian note from template with link placement",
    -- buffer = true, -- Only works in markdown files
})

-- Start in INSERT mode empty, unnamed, new buffers (BUGGED)
-- vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
--   callback = function()
--     vim.cmd("startinsert")
--   end,
-- })
-- THIS
-- vim.api.nvim_create_autocmd("BufEnter", {
--     callback = function()
--         if vim.fn.bufname("%") == "" and vim.bo.filetype == "" and vim.api.nvim_buf_line_count(0) == 1 and vim.api.nvim_buf_get_lines(0, 0, -1, false)[1] == "" then
--             vim.cmd("startinsert")
--         end
--     end,
-- })
