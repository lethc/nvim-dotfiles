require("nightly").setup({
	color = "redder", -- white, blue, green or red
	transparent = false,
	styles = {
		comments = { italic = true },
		functions = { italic = false },
		keywords = { italic = false },
		variables = { italic = false },
	},
	highlights = {
		-- add or override highlights
		-- Normal = { bg = "#0E131B" },
	},
})
