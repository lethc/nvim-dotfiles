local icons = require("config.icons")
return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			event = { "InsertEnter" },
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
		},
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-buffer",
		-- "hrsh7th/cmp-path",
		"https://codeberg.org/FelipeLema/cmp-async-path",
		"hrsh7th/cmp-cmdline",
		"rafamadriz/friendly-snippets",
		"chrisgrieser/cmp-nerdfont",
		"amarakon/nvim-cmp-fonts",
		"onsails/lspkind.nvim",
		"roobert/tailwindcss-colorizer-cmp.nvim",
	},
	-- event = { "InsertEnter" },
	-- keys = {
	-- 	{ "/", mode = { "n" } },
	-- },
	config = function()
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
			Supermaven = "",
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
				-- { name = "path" },
				{ name = "nvim_lua" },
				{ name = "async_path" },
				{ name = "crates" },
				{ name = "latex_symbols" },
				{ name = "vim-dadbod-completion" },
				{ name = "nerdfont" },
				{ name = "supermaven" },
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
						symbol_map = { Codeium = "", Supermaven = "" },
						before = tailwindcss_colorizer_cmp.formatter, -- prepend tailwindcss-colorizer
					})(entry, item)

					-- customize lspkind format
					local strings = vim.split(fmt.kind, "%s", { trimempty = true })
					local kind = strings[2] or strings[1] or ""

					-- strings[1] -> default icon
					-- strings[2] -> kind

					-- set different icon styles
					if settings.cmp_icons_style == "vscode" then
						fmt.kind = " " .. (cmp_kinds[kind] or "") -- concatenate icon based on kind
					else
						fmt.kind = " " .. (strings[1] or "") -- just use the default icon
					end

					-- append customized kind text
					if settings.cmp_style == "nvchad" then
						fmt.kind = fmt.kind .. " " -- just an extra space at the end
						fmt.menu = kind ~= "" and ("  " .. kind) or ""
					else
						-- default and others
						fmt.menu = kind
					end

					return fmt
				end,
			},
		})
		-- This make the cmdline ":example" use cmp as a source of completion
		cmp.setup.cmdline({ ":", "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "cmdline" },
				{ name = "buffer" },
				{ name = "path" },
			},
		})
	end,
}
