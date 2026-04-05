return {
	"xorid/asciitree.nvim",
	keys = { "<leader><leader>ca", "<cmd>lua require('asciitree').setup()<CR>" },
	config = function()
		local asciitree_status_ok, assiitree_nvim = pcall(require, "asciitree")
		if not asciitree_status_ok then
			return
		end
		assiitree_nvim.setup({
			symbols = {
				child = "├",
				last = "└",
				parent = "│",
				dash = "─",
				blank = " ",
			},
			depth = 3,
			delimiter = "#",
		})
	end,
}
