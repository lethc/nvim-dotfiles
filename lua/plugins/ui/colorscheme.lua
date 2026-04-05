return {
	-- Primary colorscheme: Oasis
	{
		"uhs-robert/oasis.nvim",
		lazy = false,
		config = function()
			require("oasis").setup({
				style = "lagoon",
				themed_syntax = true,
				styles = {
					bold = true,
					italic = true,
					underline = true,
					undercurl = true,
					strikethrough = true,
				},
				transparent = false,
				terminal_colors = true,
			})
			-- vim.cmd.colorscheme("oasis")
		end,
	},
	-- Vague (alternative)
	{
		"vague2k/vague.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("vague").setup({
				transparent = false,
				style = {
					comments = "italic",
					conditionals = "none",
					functions = "none",
					keywords = "none",
					headings = "bold",
					operators = "none",
					keyword_return = "none",
					strings = "italic",
					variables = "none",
				},
			})
		end,
	},
	{
		"lethc/Canon.nvim",
		priority = 1000,
		config = function()
			vim.g.canon_transparent = true
			vim.g.canon_italic_comments = true
			vim.g.canon_italic_functions = false
			vim.g.canon_bold_functions = false
			vim.g.canon_bold_keywords = false
			vim.g.canon_italic_keywords = false

			-- Onedark
			vim.g.canon_onedark_transparent = false
			vim.g.canon_onedark_italic_comments = true
			vim.g.canon_onedark_italic_functions = true
			vim.g.canon_onedark_bold_functions = true
			vim.g.canon_onedark_bold_keywords = false
			vim.g.canon_onedark_italic_keywords = true
			vim.g.canon_onedark_bold_booleans = true
			vim.g.canon_onedark_italic_booleans = false
			vim.g.canon_onedark_bold_variables = false
			vim.g.canon_onedark_italic_variables = false

			vim.g.canon_onelight_transparent = false
		end,
	},
}
