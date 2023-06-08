return {
	"ecthelionvi/NeoComposer.nvim",
	dependencies = { "kkharji/sqlite.lua" },
	-- Ensure you have sqlite3 installed locally.
	config = function()
		require("telescope").load_extension("macros")
		require("NeoComposer.ui").status_recording()
		require("NeoComposer").setup({
			notify = true,
			delay_timer = 150,
			colors = {
				bg = "#16161e",
				fg = "#ff9e64",
				red = "#ec5f67",
				blue = "#5fb3b3",
				green = "#99c794",
			},
			keymaps = {
				play_macro = "M",
				yank_macro = "yq",
				stop_macro = "cq",
				toggle_record = "m",
				cycle_next = "<c-n>",
				cycle_prev = "<c-p>",
				toggle_macro_menu = "<m-q>",
			},
		})
	end,
}
