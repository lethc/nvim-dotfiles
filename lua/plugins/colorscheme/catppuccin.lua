return {
	"catppuccin/nvim",
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = {
				-- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false,
			show_end_of_buffer = false, -- show the '~' characters after the end of buffers
			term_colors = false,
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			color_overrides = {
				frappe = {
					base = "#2d353b",
					mantle = "#232a2e",
					surface1 = "#56635F",
					-- surface0 = "#343F44",
					surface0 = "#2E383C",
					pink = "#7FBBB3",
					blue = "#7FBBB3",
					peach = "#A7C080",
					green = "#83C092",
					mauve = "#E27D7E",
					text = "#D3C6AA",
					sky = "#E69875",
					lavender = "#7FBBB3",
					overlay0 = "#859289",
					overlay1 = "#859289",
					overlay2 = "#859289",
				},
			},
			custom_highlights = {},
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				telescope = true,
				notify = true,
				mini = false,
				alpha = true,
				which_key = true,
				mason = true,
				markdown = true,
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
		})
	end,
}
