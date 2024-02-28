local lazy = {}
local icons = require("configs.ui.icons")

lazy["is_lazy"] = function()
    local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazy_path) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazy_path,
        })
    end
    vim.opt.rtp:prepend(lazy_path)
    -- vim.cmd("command! SnapshotFileShow lua require('core.pack').snapshot_file_show()")
    -- vim.cmd("command! SnapshotFileChoice lua require('core.pack').snapshot_file_choice()")
end

lazy["load"] = function()
    local modules = require("modules")
    require("lazy").setup(modules, {
        install = {
            missing = true,
            colorscheme = { "canon", "tokyonight", "lvim", "habamax" },
        },
        ui = {
            size = {
                width = 0.95,
                height = 0.95,
            },
            border = "rounded",
            -- border = "none",
            icons = icons.lazy,
        },
    })
end
return lazy
