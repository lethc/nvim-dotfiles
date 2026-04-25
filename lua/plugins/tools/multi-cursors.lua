return {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*", -- Use the latest tagged version
    opts = {}, -- This causes the plugin setup function to be called
    keys = {
        {
            "<space>k",
            "<Cmd>MultipleCursorsAddUp<CR>",
            mode = { "n", "x" },
            desc = "Add cursor and move up",
        },
        {
            "<space>j",
            "<Cmd>MultipleCursorsAddDown<CR>",
            mode = { "n", "x" },
            desc = "Add cursor and move down",
        },

        {
            "<C-RightMouse>",
            "<Cmd>MultipleCursorsMouseAddDelete<CR>",
            mode = { "n", "i" },
            desc = "Add or remove cursor",
        },

        {
            "<Leader>m",
            "<Cmd>MultipleCursorsAddVisualArea<CR>",
            mode = { "x" },
            desc = "Add cursors to the lines of the visual area",
        },

        {
            "<Leader>a",
            "<Cmd>MultipleCursorsAddMatches<CR>",
            mode = { "n", "x" },
            desc = "Add cursors to cword",
        },
        {
            "<Leader>A",
            "<Cmd>MultipleCursorsAddMatchesV<CR>",
            mode = { "n", "x" },
            desc = "Add cursors to cword in previous area",
        },

        {
            "<C-n>",
            "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
            mode = { "n", "x" },
            desc = "Add cursor and jump to next cword",
        },
        {
            "<Leader><leader>n",
            "<Cmd>MultipleCursorsJumpNextMatch<CR>",
            mode = { "n", "x" },
            desc = "Jump to next cword",
        },

        {
            "<Leader>l",
            "<Cmd>MultipleCursorsLock<CR>",
            mode = { "n", "x" },
            desc = "Lock virtual cursors",
        },
    },
}
