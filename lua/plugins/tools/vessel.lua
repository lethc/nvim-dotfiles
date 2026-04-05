return {
	"gcmt/vessel.nvim",
	keys = { "gl", "gL", "gm", "gm", "gM", "m,", "m." },
	config = function()
		require("vessel").setup({
			create_commands = true,
			commands = {
				view_marks = "Marks", -- you can customize each command name
				view_jumps = "Jumps",
				view_buffers = "Buffers",
			},
			marks = {
				toggle_mark = true,
				use_backtick = true,
			},
		})
		vim.keymap.set("n", "gl", "<Plug>(VesselViewLocalJumps)")
		vim.keymap.set("n", "gL", "<Plug>(VesselViewExternalJumps)")
		vim.keymap.set("n", "gm", "<plug>(VesselViewBufferMarks)")
		vim.keymap.set("n", "gM", "<plug>(VesselViewExternalMarks)")
		vim.keymap.set("n", "m,", "<plug>(VesselSetLocalMark)")
		vim.keymap.set("n", "m.", "<plug>(VesselSetGlobalMark)")
	end,
}
