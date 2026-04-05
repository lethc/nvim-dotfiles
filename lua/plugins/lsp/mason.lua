return {
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		build = ":MasonUpdate",
		opts = {
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)

			-- Auto-install missing packages via mason-registry
			local ensure_installed = {
				-- LSP servers
				"bash-language-server",
				"typescript-language-server",
				"pyright", --"To Debug, https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Python"
				"lua-language-server",
				"json-lsp",
				"html-lsp",
				"emmet-ls",
				"css-lsp",
				"cssmodules-language-server",
				"marksman",
				"tailwindcss",
				"astro",
				"csharp_ls",
				-- "intelephense",
				"phpactor",
				"yaml-language-server",
				"taplo",
				"marksman",
				"dockerfile-language-server",
				"docker-compose-language-service",
				-- Formatters
				"prettierd",
				"black",
				"stylua",
				"google-java-format",
				-- Linters
				"eslint_d",
				"ruff",
				-- "luacheck",
				"markdownlint",
				"hadolint",
				-- DAP adapters
				"js-debug-adapter",
				"debugpy",
				"clangd", --"to Debug, Install in your system codelldb"
				"texlab",
				-- "ltex",
			}

			local registry = require("mason-registry")

			registry.refresh(function()
				for _, pkg_name in ipairs(ensure_installed) do
					local ok, pkg = pcall(registry.get_package, pkg_name)
					if ok and not pkg:is_installed() then
						vim.notify("Mason: installing " .. pkg_name, vim.log.levels.INFO)
						pkg:install()
					end
				end
			end)
		end,
	},
}
