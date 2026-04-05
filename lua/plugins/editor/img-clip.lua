return {
	"HakonHarnes/img-clip.nvim",
	keys = {
		-- { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		{
			"<A-p>",
			function()
				require("img-clip").paste_image()
			end,
			desc = "Paste image from system clipboard",
		},
	},
	opts = {
		default = {
			dir_path = "assets/img",
		},
	},
}
