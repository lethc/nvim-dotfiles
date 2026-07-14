return {
    "saghen/blink.cmp",
    event = "InsertEnter",
    enabled = false,
    version = "*",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        require("blink.cmp").setup({
            fuzzy = {
                implementation = "prefer_rust",
            },

            -- ── Appearance ────────────────────────────────────────────────────────
            appearance = {
                use_nvim_cmp_as_default = false,
                nerd_font_variant = "mono",
            },

            -- ── Keymaps ───────────────────────────────────────────────────────────
            keymap = {
                ["<Tab>"] = {
                    function(cmp)
                        return cmp.select_next()
                    end,
                    "fallback",
                },
                ["<S-Tab>"] = {
                    function(cmp)
                        return cmp.select_prev()
                    end,
                    "fallback",
                },
                ["<CR>"] = {
                    function(cmp)
                        return cmp.accept()
                    end,
                    "fallback",
                },
            },

            -- ── Completion ────────────────────────────────────────────────────────
            completion = {
                -- Auto-insert brackets for function/method completions
                accept = {
                    auto_brackets = { enabled = true },
                },

                -- Documentation popup
                documentation = {
                    auto_show = true,
                    -- auto_show_delay_ms = 200,
                    -- window = {
                    --     border = "rounded",
                    -- },
                },

                -- Completion menu
                menu = {
                    -- border = "rounded",
                    auto_show = true,
                    draw = {
                        columns = {
                            { "kind_icon" },
                            { "label", "label_description", gap = 1 },
                            { "kind" },
                        },
                    },
                },

                -- Ghost text disabled
                ghost_text = {
                    enabled = false,
                    show_with_menu = false,
                },
            },

            -- ── Sources ───────────────────────────────────────────────────────────
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                providers = {
                    lsp = {
                        opts = {
                            tailwind_color_icon = "󱓻",
                        },
                    },
                },
            },

            cmdline = {
                enabled = true,
                keymap = { preset = "cmdline" },
                completion = {
                    menu = { auto_show = true },
                },
            },

            snippets = {
                preset = "luasnip",
            },
        })
        require("luasnip.loaders.from_vscode").lazy_load()
    end,
}
