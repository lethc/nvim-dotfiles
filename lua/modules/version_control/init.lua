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
        dependencies = {
            -- "nvim-lua/plenary.nvim", -- required
            -- "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed, not both.
            -- "nvim-telescope/telescope.nvim", -- optional
            -- "ibhagwan/fzf-lua", -- optional
        },
        config = true,
    },
}
return modules
