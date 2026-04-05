return {
	"roobert/search-replace.nvim",
	cmd = {
		"SearchReplaceSingleBufferCExpr",
		"SearchReplaceSingleBufferCFile",
		"SearchReplaceSingleBufferOpen",
		"SearchReplaceSingleBufferSelections",
		"SearchReplaceSingleBufferCWord",
		"SearchReplaceSingleBufferCWORD",
	},
	config = function()
		local search_replace_status_ok, search_replace = pcall(require, "search-replace")
		if not search_replace_status_ok then
			return
		end
		search_replace.setup({})
	end,
}
