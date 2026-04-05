return {
	{
		"lukas-reineke/indent-blankline.nvim",
		dependencies = {
			{ "HiPhish/rainbow-delimiters.nvim" },
		},
		enabled = false,
		main = "ibl",
		-- event = "BufEnter",
		event = "BufReadPre",
		-- event = { 'BufRead', 'BufNewFile' },
		config = function()
			local indentscope_status_ok, indentscope = pcall(require, "mini.indentscope")
			if not indentscope_status_ok then
				return
			end
			indentscope.setup({
				symbol = "│",
			})
		end,
	},
}
