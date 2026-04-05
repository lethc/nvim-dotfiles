return {
	{
		-- "turbio/bracey.vim",
		"lethc/bracey.vim",
		ft = "html",
		build = "npm install --prefix server",
		config = function()
			vim.cmd([[
        let g:bracey_browser_command='firefox --new-window'
      ]])
		end,
	},
}
