local obsidian_status_ok, obsidian = pcall(require, "obsidian")
if not obsidian_status_ok then
	return
end

obsidian.setup({
	dir = "~/Sync/lummyn",
	completion = {
		nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
	},
  daily_notes = {
    folder = "Diary/2023/March",
  }
})
