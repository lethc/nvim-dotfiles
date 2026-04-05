return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		cmd = "ConformInfo",
		config = function()
			local conform_nvim_status_ok, conform_nvim = pcall(require, "conform")
			if not conform_nvim_status_ok then
				return
			end
			require("conform.formatters.prettierd").args = {
				"--jsx-single-quote",
				"--single-quote",
				"--no-semi",
				"--tab-width=4",
				"$FILENAME",
			}
			local util = require("conform.util")
			-- local java_google_format = {
			--     meta = {
			--         url = "https://github.com/google/google-java-format",
			--         description = "google-java-format is a program that reformats Java source code to comply with Google Java Style.",
			--     },
			--     command = "google-java-format",
			--     args = { "-" },
			--     stdin = true,
			-- }
			conform_nvim.setup({
				formatters_by_ft = {
					-- Web / JS ecosystem
					javascript = { "prettierd", stop_after_first = true },
					javascriptreact = { "prettierd", stop_after_first = true },
					typescript = { "prettierd", stop_after_first = true },
					typescriptreact = { "prettierd", stop_after_first = true },
					json = { "prettierd", stop_after_first = true },
					-- json = { "jq" },
					jsonc = { "prettierd", stop_after_first = true },
					yaml = { "prettierd", stop_after_first = true },
					-- yaml = { "yamlfmt" },
					html = { "prettierd", stop_after_first = true },
					css = { "prettierd", stop_after_first = true },
					scss = { "prettierd", stop_after_first = true },
					markdown = { "prettierd", stop_after_first = true },
					-- Python
					python = { "ruff_format", "ruff_fix" },
					-- Lua
					lua = { "stylua" },
					-- Dart
					-- dart = { "dart_format" },
					-- astro = { "prettierd" },
					-- mdx = { "prettierd" },
					java = { "google-java-format" },
					cmake = { "cmake_format" },
					sh = { "shfmt" },
					zsh = { "shfmt" },
					-- markdown = { "prettier" }, -- The plugin to toggle to toggle todos won't work properly with 4 spaces
					-- html = { "prettier" },
					-- python = { "isort", "black" },
					blade = { "blade-formatter" },
					php = { "pint", "php_cs_fixer" },
				},
				format_on_save = {
					timeout_ms = 3000,
					lsp_format = "fallback",
				},
				notify_on_error = true,
				formatters = {
					-- java_google_format = java_google_format,
					pint = {
						meta = {
							url = "https://github.com/laravel/pint",
							description = "Laravel Pint is an opinionated PHP code style fixer for minimalists. Pint is built on top of PHP-CS-Fixer and makes it simple to ensure that your code style stays clean and consistent.",
						},
						command = util.find_executable({
							vim.fn.stdpath("data") .. "/mason/bin/pint",
							"vendor/bin/pint",
						}, "pint"),
						args = { "$FILENAME" },
						stdin = false,
					},
				},
			})

			conform_nvim.formatters["google-java-format"] = {
				prepend_args = { "--aosp" }, -- 4-space indentation
			}
		end,
	},
}
