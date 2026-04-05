return {
	"HampusHauffman/block.nvim",
	cmd = { "Block", "BlockOn" },
	config = function()
		local block_status_ok, block = pcall(require, "block")
		if not block_status_ok then
			return
		end
		block.setup({})
	end,
}
