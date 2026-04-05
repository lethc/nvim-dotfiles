return {
	{
		"NeogitOrg/neogit",
		config = true,
		keys = {
			{ "<leader><leader>g", ":Neogit<cr>", desc = "Open Neogit" },
			{ "<leader><leader>gc", ":Neogit commit<cr>", desc = "Commit in Neogit" },
			{ "<leader><leader>gp", ":Neogit pull<cr>", desc = "Pull in Neogit" },
			{ "<leader><leader>gP", ":Neogit push<cr>", desc = "Push in Neogit" },
			{ "<leader><leader>gb", ":Telescope git_branches<cr>", desc = "View Branches" },
		},
	},
	{
		"aaronhallaert/advanced-git-search.nvim",
		cmd = { "AdvancedGitSearch" },
		config = function() end,
		dependencies = {
			-- to show diff splits and open commits in browser
			"tpope/vim-fugitive",
			-- to open commits in browser with fugitive
			"tpope/vim-rhubarb",
		},
	},
}
