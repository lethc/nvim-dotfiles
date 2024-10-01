local icons = require("configs.ui.icons")
local config = {}

config.nvim_cmp = function()
    local cmp_status_ok, cmp = pcall(require, "cmp")
    if not cmp_status_ok then
        return
    end
    local snip_status_ok, luasnip = pcall(require, "luasnip")
    if not snip_status_ok then
        return
    end
    require("luasnip.loaders.from_lua").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets/vscode" })
    -- local check_backspace = function()
    --   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    --   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    -- end
    local compare = require("cmp.config.compare")
    local check_backspace = function()
        local col = vim.fn.col(".") - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
    end

    local lsp_symbols = icons.cmp
    local settings = {
        theme = "gruvbox", -- ayu|gruvbox
        indentChar = "│", -- │, |, ¦, ┆, ┊
        separatorChar = "-", -- ─, -, .
        aspect = "clean", -- normal|clean
        lualine_separator = "rect", -- rect|triangle|semitriangle|curve
        cmp_style = "nvchad", -- default|nvchad
        cmp_icons_style = "vscode", -- devicons|vscode
    }
    local lspkind = require("lspkind")
    local tailwindcss_colorizer_cmp = require("tailwindcss-colorizer-cmp")
    -- vscode like icons
    local cmp_kinds = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
        Codeium = "",
    }
    -- CONFIGURATION: cmp without rounded borders

    -- cmp.setup({
    --     -- preselect = cmp.PreselectMode.None, -- Autoselect the first option
    --     snippet = {
    --         expand = function(args)
    --             luasnip.lsp_expand(args.body) -- For `luasnip` users.
    --         end,
    --     },
    --     mapping = {
    --         ["<C-j>"] = cmp.mapping.select_next_item(),
    --         ["<C-k>"] = cmp.mapping.select_prev_item(),
    --         ["<C-d>"] = cmp.mapping.scroll_docs(4),
    --         ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    --         ["<C-Space>"] = cmp.mapping.complete(),
    --         ["<C-e>"] = cmp.mapping.close(),
    --         -- ["<CR>"] = cmp.mapping.confirm({
    --         -- 	behavior = cmp.ConfirmBehavior.Replace,
    --         -- 	select = true,
    --         -- }),
    --         ["<CR>"] = cmp.mapping.confirm({ select = true }),
    --         ["<Tab>"] = cmp.mapping(function(fallback)
    --             if cmp.visible() then
    --                 cmp.select_next_item()
    --             elseif luasnip.expandable() then
    --                 luasnip.expand()
    --             elseif luasnip.expand_or_jumpable() then
    --                 luasnip.expand_or_jump()
    --             elseif check_backspace() then
    --                 fallback()
    --             else
    --                 fallback()
    --             end
    --         end, { "i", "s" }),
    --         ["<S-Tab>"] = cmp.mapping(function(fallback)
    --             if cmp.visible() then
    --                 cmp.select_prev_item()
    --             elseif luasnip.jumpable(-1) then
    --                 luasnip.jump(-1)
    --             else
    --                 fallback()
    --             end
    --         end, { "i", "s" }),
    --     },
    --     formatting = {
    --         format = function(entry, item)
    --             item.kind = lsp_symbols[item.kind]
    --             item.menu = ({
    --                 nvim_lsp = "[LSP]",
    --                 luasnip = "[Snipt]",
    --                 buffer = "[Buffer]",
    --                 path = "[Path]",
    --                 crates = "[Version]",
    --                 latex_symbols = "[LaTex]",
    --                 nerdfont = "[NerdFont]",
    --                 codeium = "[AI]",
    --                 fonts = "[Local Fonts]",
    --                 ["vim-dadbod-completion"] = "[DB]",
    --             })[entry.source.name]
    --             return item
    --         end,
    --     },
    --     sources = {
    --         { name = "luasnip" },
    --         { name = "nvim_lsp" },
    --         { name = "buffer" },
    --         { name = "path" },
    --         { name = "crates" },
    --         { name = "latex_symbols" },
    --         { name = "vim-dadbod-completion" },
    --         { name = "nerdfont" },
    --         { name = "codeium" },
    --         -- { name = "fonts" }
    --     },
    -- })

    -- CONFIGURATION: cmp with rounded borders and NvChad appearance

    cmp.setup({
        view = {
            entries = {
                follow_cursor = true,
            },
        },
        window = {
            completion = {
                border = "rounded", -- single|rounded|none
                -- custom colors
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLineBG,Search:None", -- BorderBG|FloatBorder
                side_padding = settings.cmp_style == "default" and 1 or 0, -- padding at sides
                col_offset = settings.cmp_style == "default" and -1 or -4, -- move floating box left or right
            },
            documentation = {
                border = "rounded", -- single|rounded|none
                -- custom colors
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLineBG,Search:None", -- BorderBG|FloatBorder
            },
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = {
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            -- ["<CR>"] = cmp.mapping.confirm({
            -- 	behavior = cmp.ConfirmBehavior.Replace,
            -- 	select = true,
            -- }),
            ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Disable auto-select the first item on suggestion
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expandable() then
                    luasnip.expand()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif check_backspace() then
                    fallback()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        },
        sources = {
            { name = "luasnip" },
            { name = "nvim_lsp" },
            { name = "buffer" },
            { name = "path" },
            { name = "crates" },
            { name = "latex_symbols" },
            { name = "vim-dadbod-completion" },
            { name = "nerdfont" },
            { name = "codeium" },
            -- { name = "fonts" }
        },
        sorting = {
            comparators = {
                priority_weight = 2.,
                comparators = { compare.score, compare.exact, compare.order },
            },
        },
        formatting = {
            fields = settings.cmp_style == "nvchad" and { "kind", "abbr", "menu" } or nil,
            format = function(entry, item)
                -- vscode like icons for cmp autocompletion
                local fmt = lspkind.cmp_format({
                    -- with_text = false, -- hide kind beside the icon
                    mode = "symbol_text",
                    maxwidth = 50,
                    ellipsis_char = "...",
                    symbol_map = { Codeium = "" },
                    before = tailwindcss_colorizer_cmp.formatter, -- prepend tailwindcss-colorizer
                })(entry, item)

                -- customize lspkind format
                local strings = vim.split(fmt.kind, "%s", { trimempty = true })

                -- strings[1] -> default icon
                -- strings[2] -> kind

                -- set different icon styles
                if settings.cmp_icons_style == "vscode" then
                    fmt.kind = " " .. (cmp_kinds[strings[2]] or "") -- concatenate icon based on kind
                else
                    fmt.kind = " " .. (strings[1] or "") -- just use the default icon
                end

                -- append customized kind text
                if settings.cmp_style == "nvchad" then
                    fmt.kind = fmt.kind .. " " -- just an extra space at the end
                    fmt.menu = strings[2] ~= nil and ("  " .. (strings[2] or "")) or ""
                else
                    -- default and others
                    fmt.menu = strings[2] ~= nil and (strings[2] or "") or ""
                end

                return fmt
            end,
        },
    })
    cmp.setup.cmdline({ ":", "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "cmdline" },
            { name = "buffer" },
            { name = "path" },
        },
    })
end
config.nvim_autopairs = function()
    local nvim_autopairs_status_ok, nvim_autopairs = pcall(require, "nvim-autopairs")
    if not nvim_autopairs_status_ok then
        return
    end
    nvim_autopairs.setup({
        check_ts = true,
        ts_config = {
            lua = { "string", "source" },
            javascript = { "string", "template_string" },
            java = false,
        },
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        fast_wrap = {
            map = "<M-e>",
            chars = { "{", "[", "(", '"', "'" },
            pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
            offset = 0, -- Offset from pattern match
            end_key = "$",
            keys = "qwertyuiopzxcvbnmasdfghjkl",
            check_comma = true,
            highlight = "PmenuSel",
            highlight_grey = "LineNr",
        },
    })
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp_status_ok, cmp = pcall(require, "cmp")
    if not cmp_status_ok then
        return
    end
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
end
config.nvim_surround = function()
    local nvim_surround_status_ok, nvim_surround = pcall(require, "nvim-surround")
    if not nvim_surround_status_ok then
        return
    end
    nvim_surround.setup()
end
config.mkdnflow_nvim = function()
    local mkdnflow_status_ok, mkdnflow_nvim = pcall(require, "mkdnflow")
    if not mkdnflow_status_ok then
        return
    end
    mkdnflow_nvim.setup({
        modules = {
            bib = true,
            buffers = true,
            conceal = true,
            cursor = true,
            folds = true,
            links = true,
            lists = true,
            maps = true,
            paths = true,
            tables = true,
            yaml = false,
        },
        filetypes = { md = true, rmd = true, markdown = true },
        create_dirs = true,
        perspective = {
            priority = "first",
            fallback = "current",
            root_tell = false,
            nvim_wd_heel = false,
            update = false,
        },
        wrap = false,
        bib = {
            default_path = nil,
            find_in_root = true,
        },
        silent = false,
        links = {
            style = "markdown",
            name_is_source = false,
            conceal = false,
            context = 0,
            implicit_extension = nil,
            transform_implicit = false,
            transform_explicit = function(text)
                text = text:gsub(" ", "-")
                text = text:lower()
                text = os.date("%Y-%m-%d_") .. text
                return text
            end,
        },
        new_file_template = {
            use_template = false,
            placeholders = {
                before = {
                    title = "link_title",
                    date = "os_date",
                },
                after = {},
            },
            template = "# {{ title }}",
        },
        to_do = {
            symbols = { " ", "x", ">", "~" },
            update_parents = true,
            not_started = " ",
            in_progress = ">",
            complete = "x",
        },
        tables = {
            trim_whitespace = true,
            format_on_move = true,
            auto_extend_rows = false,
            auto_extend_cols = false,
        },
        yaml = {
            bib = { override = false },
        },
        mappings = {
            MkdnEnter = false, --[[ { { "n", "v" }, "<CR>" }, ]]
            MkdnTab = false, --jump to the next cell in a table
            MkdnSTab = false,
            MkdnNextLink = { "n", "<BS>" },
            MkdnPrevLink = { "n", "<S-BS>" },
            MkdnNextHeading = { "n", "]]" },
            MkdnPrevHeading = { "n", "[[" },
            MkdnGoBack = false,
            MkdnGoForward = false,
            MkdnCreateLink = { { "n", "v" }, "<leader>mn" },
            MkdnCreateLinkFromClipboard = { { "n", "v" }, "<leader>pp" }, -- see MkdnEnter
            MkdnFollowLink = false, -- see MkdnEnter
            MkdnDestroyLink = { "n", "<A-r>" },
            MkdnTagSpan = { "v", "<S-CR>" },
            MkdnMoveSource = { "n", "<F2>" },
            MkdnYankAnchorLink = { "n", "yaa" },
            MkdnYankFileAnchorLink = { "n", "yfa" },
            MkdnIncreaseHeading = { "n", "+" },
            MkdnDecreaseHeading = { "n", "-" },
            MkdnToggleToDo = { { "n", "v" }, "<Space><Space>" },
            MkdnNewListItem = { { "n" }, "<leader>ml" },
            MkdnNewListItemBelowInsert = { "n", "o" },
            MkdnNewListItemAboveInsert = { "n", "O" },
            MkdnExtendList = { { "n", "v" }, "<leader>mL" },
            MkdnUpdateNumbering = { "n", "<leader>nn" },
            MkdnTableNextCell = { "i", "<Tab>" },
            MkdnTablePrevCell = { "i", "<S-Tab>" },
            MkdnTableNextRow = false,
            MkdnTablePrevRow = false,
            MkdnTableNewRowBelow = { "n", "<leader>mr" },
            MkdnTableNewRowAbove = { "n", "<leader>mR" },
            MkdnTableNewColAfter = { "n", "<leader>mc" },
            MkdnTableNewColBefore = { "n", "<leader>iC" },
            -- MkdnFoldSection = { "n", "<leader>mf" },
            -- MkdnUnfoldSection = { "n", "<leader>mF" },
        },
    })
end
config.clipboard_image = function()
    -- local clipboard_image_status_ok, clipboard_image = pcall(require, "clipboard-image")
    -- if not clipboard_image_status_ok then
    --   return
    -- end
    local path = os.getenv("HOME") .. "/Home/assets/img"
    require("clipboard-image").setup({
        default = {
            img_dir = path,
            img_name = function()
                return os.date("%Y-%m-%d-%H-%M-%S")
            end, -- Example result: "2021-04-13-10-04-18"
            affix = "<\n  %s\n>", -- Multi lines affix
        },
        markdown = {
            img_dir = { path }, -- Use table for nested dir (New feature form PR #20)
            img_dir_txt = "assets/img",
            -- img_handler = function(img) -- New feature from PR #22
            -- 	local script = string.format('./image_compressor.sh "%s"', img.path)
            -- 	os.execute(script)
            -- end,
        },
    })
    -- Check this: https://github.com/ekickx/clipboard-image.nvim/issues/50
    -- modify the health.lua in clipboard-image plugins
    -- local health = vim.health or require "health"
    --
    -- instead of
    --
    -- local health = require "health"
    --
    -- Remember to create a symlink so that this plugin and Obsidian are able to work together
    -- ln -sf "${HOME}/Obsidian_Vault/assets/img" "${HOME}"
end
return config
