return {
	"luukvbaal/statuscol.nvim",
	lazy = true,
	-- config = function()
	--     local builtin = require("statuscol.builtin")
	--     require("statuscol").setup({
	--         relculright = true,
	--         segments = {
	--             { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
	--             { text = { "%s" }, click = "v:lua.ScSa" },
	--             { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
	--         },
	--     })
	-- end,
	opts = function()
		local builtin = require("statuscol.builtin")
		return {
			ft_ignore = {
				"neo-tree",
				"neo-tree-popup",
				"alpha",
				"lazy",
				"mason",
				"dashboard",
				"help",
				"vim",
				"alpha",
				"toggleterm",
				"noice",
				"Trouble",
			},
			relculright = true,
			segments = {
				{ text = { "  " }, click = "v:lua.ScSa" },
				{ text = { builtin.foldfunc, "" }, click = "v:lua.ScFa" },
				{ text = { builtin.lnumfunc, "  " }, click = "v:lua.ScLa" },
				{
					text = { "%s" },
					click = "v:lua.ScSa",
					auto = false,
				},
				-- {
				--     -- Dap Breakpoints
				--     sign = { name = { "Dap" }, maxwidth = 1, colwidth = 2, auto = true, fillchars = "" },
				--     click = "v:lua.ScSa",
				-- },
				-- {
				--     sign = { namespace = { "gitsign+" }, maxwidth = 1, colwidth = 1, auto = false, fillchar = " " },
				--     click = "v:lua.ScSa",
				-- },
			},
		}
	end,
	config = function(_, opts)
		require("statuscol").setup(opts)
	end,
}
