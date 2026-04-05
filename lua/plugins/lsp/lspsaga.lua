return {
	"glepnir/lspsaga.nvim",
	-- event = "LspAttach",
	config = function()
		vim.lsp.config("qmlls6", {
			cmd = { "qmlls6" },
		})
		vim.lsp.config("jdtls", {
			root_markers = {
				"settings.gradle",
				"settings.gradle.kts",
				"pom.xml",
				"build.gradle",
				"mvnw",
				"gradlew",
				"build.gradle",
				"build.gradle.kts",
				".git",
			},
		})
		local signs = {
			{ name = "DiagnosticSignError", text = " " },
			{ name = "DiagnosticSignWarn", text = " " },
			{ name = "DiagnosticSignHint", text = "󰌵" },
			{ name = "DiagnosticSignInfo", text = "" },
		}
		local lsp_config = {
			virtual_text = false, -- disable virtual text
			signs = { active = signs }, -- show signs
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		}
		vim.diagnostic.config(lsp_config)
		vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
			config = config or {}
			config.border = "rounded"
			return vim.lsp.handlers.hover(err, result, ctx, config)
		end
		vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
			config = config or {}
			config.border = "rounded"
			return vim.lsp.handlers.signature_help(err, result, ctx, config)
		end
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
				texthl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
					[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
					[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
					[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
				},
			},
		})
		local lsp_saga_status_ok, lsp_saga = pcall(require, "lspsaga")
		if not lsp_saga_status_ok then
			return
		end
		lsp_saga.setup({
			ui = {
				-- This option only works in Neovim 0.9
				title = true,
				-- Border type can be single, double, rounded, solid, shadow.
				lines = { "┗", "┣", "┃", "━", "┏" },
				border = "single",
				devicon = true,
				actionfix = " ",
				imp_sign = "󰳛 ",
				expand = "",
				collapse = "",
				code_action = "",
				-- incoming = "󰏷 ",
				-- outgoing = "󰏻 ",
				-- hover = " ",
				kind = {},
			},
			symbol_in_winbar = {
				enable = false,
				separator = " ",
				ignore_patterns = {},
				hide_keyword = true,
				show_file = true,
				folder_level = 2,
				respect_root = false,
				color_mode = true,
			},
			code_action = {
				num_shortcut = true,
				show_server_name = false,
				extend_gitsigns = false,
			},
			definition = {
				width = 0.6,
				height = 0.5,
				diagnostic_only_current = false,
				keys = {
					edit = "<C-x>o",
					vsplit = "<C-x>v",
					split = "<C-x>i",
					tabe = "<C-x>t",
					quit = { "q", "<C-x>q", "<ESC>" },
					close = "<C-x>k",
				},
			},
			finder = {
				silent = true,
				default = "def+ref+imp",
				layout = "float",
				filter = {},
				-- max_height = 0.6,
				keys = {
					shuttle = "[]",
					toggle_or_open = { "<CR>", "o" },
					-- jump_to = "e",
					vsplit = "v",
					split = "i",
					tabe = "t",
					tabnew = "n",
					quit = { "q", "<C-x>q", "<Esc>" },
					close = { "<C-x>k" },
				},
			},
		})
		-- vim.wo.winbar = require("lspsaga.symbol.winbar"):get_bar()
		require("lspsaga.symbol.winbar").get_bar()
		local keymap = vim.keymap.set

		-- Diagnostic jump with filters such as only jumping to an error
		keymap("n", "[e", function()
			require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end)
		keymap("n", "]e", function()
			require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
		end)

		-- Hover Doc
		-- If there is no hover doc,
		-- there will be a notification stating that
		-- there is no information available.
		-- To disable it just use ":Lspsaga hover_doc ++quiet"
		-- Pressing the key twice will enter the hover window
		keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

		-- Floating terminal
		-- keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
	end,
}
