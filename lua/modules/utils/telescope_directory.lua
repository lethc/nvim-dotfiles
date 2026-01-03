-- Open fzf-lua on startup if the first argument is a directory
local telescope_group = vim.api.nvim_create_augroup("TelescopeOnEnter", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function()
        -- Check if Telescope is available
        local has_telescope, _ = pcall(require, "telescope")
        if not has_telescope then
            vim.notify("Telescope not found. Please install it.", vim.log.levels.WARN)
            return
        end
        -- Look for directory arguments
        local directories = {}
        for i = 2, #vim.v.argv do
            local arg = vim.v.argv[i]
            -- Skip flags and options
            if arg and not arg:match("^%-") and vim.fn.isdirectory(arg) == 1 then
                table.insert(directories, arg)
            end
        end

        if #directories > 0 then
            local target_dir = directories[1] -- Use first directory

            -- Close netrw buffer if it exists
            pcall(vim.cmd, "silent! bd 1")

            -- Use pcall to handle any Telescope errors
            local success, _ = pcall(function()
                require("telescope.builtin").find_files({
                    cwd = target_dir,
                    prompt_title = "Files in: " .. target_dir,
                    hidden = false, -- Don't show hidden by default
                    no_ignore = false, -- Respect .gitignore
                    follow = true, -- Follow symlinks
                })
            end)

            if not success then
                vim.notify("Failed to open Telescope. Opening directory normally.", vim.log.levels.INFO)
            end
        end
    end,
    group = telescope_group,
})
