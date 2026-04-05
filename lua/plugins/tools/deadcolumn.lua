return {
	"Bekaboo/deadcolumn.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		-- modes = { "i", "n" },
		blending = {
			colorcode = "#1F2430",
			hlgroup = { "NonText", "bg" },
		},
	},
}
