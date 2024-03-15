local edit_config = require("modules.version_control.configs")
local modules = {
    {
        "lewis6991/gitsigns.nvim",
        -- event = { 'BufRead', 'BufNewFile' },
        event = "BufReadPre",
        config = edit_config.gitsigns_nvim,
    },
    {
        "sindrets/diffview.nvim",
        cmd = {
            "DiffviewOpen",
            "DiffviewToggleFiles",
            "DiffviewRefresh",
            "DiffviewFileHistory",
            "DiffviewFileHistory",
            "DiffviewFocusFiles",
            "DiffviewClose",
        },
        config = function() end,
    },
    {
        "NeogitOrg/neogit",
        config = true,
        keys = {
            { "<leader><leader>g", ":Neogit<cr>", desc = "Open Neogit" },
            { "<leader><leader>gc", ":Neogit commit<cr>", desc = "Commit in Neogit" },
            { "<leader><leader>gp", ":Neogit pull<cr>", desc = "Pull in Neogit" },
            { "<leader><leader>gP", ":Neogit push<cr>", desc = "Push in Neogit" },
            { "<leader><leader>gb", ":Telescope git_branches<cr>", desc = "View Branches" },
        },
    },
}
return modules
