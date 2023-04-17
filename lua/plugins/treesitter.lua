return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local status_ok, configs = pcall(require, "nvim-treesitter.configs")
		if not status_ok then
			return
		end

		configs.setup({
			-- ensure_installed = "all", -- one of "all" or a list of languages
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "regex", "bash", "markdown", "markdown_inline" },
			ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
      auto_install = true,
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = {}, -- list of language that will be disabled
			},
			autopairs = {
				enable = true,
			},
			indent = { enable = true, disable = { "python", "css" } },
		})
	end,
}
