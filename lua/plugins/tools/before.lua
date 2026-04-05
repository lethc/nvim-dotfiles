return {
	"bloznelis/before.nvim",
	event = "insertEnter",
	config = function()
		local before_status_ok, before = pcall(require, "before")
		if not before_status_ok then
			return
		end
		before.setup({
			telescope_for_preview = true,
		})

		-- Jump to previous entry in the edit history
		vim.keymap.set("n", "g;", before.jump_to_last_edit, {})

		-- Jump to next entry in the edit history
		vim.keymap.set("n", "g,", before.jump_to_next_edit, {})

		-- You can provide telescope opts to the picker as show_edits_in_telescope argument:
		vim.keymap.set("n", "<leader><leader>l", function()
			before.show_edits_in_telescope(require("telescope.themes").get_dropdown())
		end, {})
	end,
}
