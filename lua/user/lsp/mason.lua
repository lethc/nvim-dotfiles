require'lspconfig'.clangd.setup{}  --Install clangd in your system.

local servers = {
	"sumneko_lua",
	"cssls",
  "cssmodules_ls",
  "emmet_ls",
	"html",
	"tsserver",
	"pyright",
	"bashls",
	"jsonls",
	-- "yamlls",
  "jdtls",
  "intelephense",
  "gopls",
  "rust_analyzer",
  "clangd",
  "texlab",
  "ltex"
}

local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

  -- if server == "rust_analyzer" then
  --   local rust_opts = require "user.lsp.settings.rust"
  --   -- opts = vim.tbl_deep_extend("force", rust_opts, opts)
  --   local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
  --   if not rust_tools_status_ok then
  --     return
  --   end
  --
  --   rust_tools.setup(rust_opts)
  --   goto continue
  -- end
  --
	lspconfig[server].setup(opts)
  --  ::continue::
end

