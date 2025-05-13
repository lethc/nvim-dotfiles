return {
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            -- checkOnSave = {
            --   default = true,
            --   -- command = "cargo clippy",
            --   -- extraArgs = { "--no-deps" },
            -- },
            checkOnSave = {
                command = "clippy",
            },
            -- check = {
            -- allTargets = true,
            --   features = "all",
            -- },
            diagnostics = {
                enable = true,
                experimental = {
                    enable = true,
                },
            },
        },
    },
}
