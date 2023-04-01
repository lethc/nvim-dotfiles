local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

--local M = {}

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
    formatting.google_java_format,
    -- diagnostics.flake8
	},
})
---- formate variables
--local services = require "user.lsp.null-ls"
--local method = null_ls.methods.FORMATTING
--
---- linters variable
--local alternative_methods = {
--  null_ls.methods.DIAGNOSTICS,
--  null_ls.methods.DIAGNOSTICS_ON_OPEN,
--  null_ls.methods.DIAGNOSTICS_ON_SAVE,
--}
--
----Formatters
--function M.list_registered_providers_names(filetype)
--  local s = require "null-ls.sources"
--  local available_sources = s.get_available(filetype)
--  local registered = {}
--  for _, source in ipairs(available_sources) do
--    for method in pairs(source.methods) do
--      registered[method] = registered[method] or {}
--      table.insert(registered[method], source.name)
--    end
--  end
--  return registered
--end
--
--function M.list_registered(filetype)
--  local registered_providers = services.list_registered_providers_names(filetype)
--  return registered_providers[method] or {}
--end
--
----Linters
--
--function M.list_registeredl(filetype)
--  local registered_providers = services.list_registered_providers_names(filetype)
--  local providers_for_methods = vim.tbl_flatten(vim.tbl_map(function(m)
--    return registered_providers[m] or {}
--  end, alternative_methods))
--
--  return providers_for_methods
--end
--
--return M
