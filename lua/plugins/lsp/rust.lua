return {
    { --#### RUST LANGUAGE ####
        "mrcjkb/rustaceanvim",
        -- version = "^6",
        ft = { "rust" },
        config = function()
            vim.g.rustaceanvim = {
                server = {
                    default_settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                allFeatures = true,
                            },
                        },
                    },
                },
            }
        end,
    },
    {
        "Saecki/crates.nvim",
        ft = { "rust", "toml" },
        tag = "stable",
        config = function()
            local crates = require("crates")
            crates.setup({
                completion = {
                    cmp = { enabled = true },
                },
            })
            crates.show()
        end,
    }
}
