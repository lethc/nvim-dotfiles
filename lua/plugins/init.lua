return {
	{
		"renerocksai/telekasten.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"renerocksai/calendar-vim",
		},
		config = function()
			require("telekasten").setup({
				home = vim.fn.expand("~/Sync"), -- Put the name of your notes directory here
			})
		end,
	},
	{
		"xorid/asciitree.nvim",
		ft = "markdown",
		config = function()
			-- Default values
			require("asciitree").setup({
				-- Characters used to represent the tree.
				symbols = {
					child = "├",
					last = "└",
					parent = "│",
					dash = "─",
					blank = " ",
				},

				-- How deep each level should be drawn. This value can be overridden by
				-- calling the AsciiTree command with a number, such as :AsciiTree 4.
				depth = 3,

				-- The delimiter to look for when converting to a tree. By default, this
				-- looks for a tree that looks like:
				-- # Level 1
				-- ## Level 2
				-- ### Level 3
				-- #### Level 4
				--
				-- Changing it to "+" would look for the following:
				-- + Level 1
				-- ++ Level 2
				-- +++ Level 3
				-- ++++ Level 4
				delimiter = "#",
			})
		end,
	},
	{
		"turbio/bracey.vim",
		config = function() end,
	},
	{
		"mthbernardes/codeexplain.nvim",
		lazy = true,
		cmd = "CodeExplain",
		build = function()
			vim.cmd([[silent UpdateRemotePlugins]])
		end,
	},
	"theRealCarneiro/hyprland-vim-syntax",
	{
		"fei6409/log-highlight.nvim",
		config = function()
			require("log-highlight").setup({})
		end,
	},
	"arjunmahishi/flow.nvim", --Required for Telescope
	"nvim-lua/plenary.nvim",
	"moll/vim-bbye",
	"elkowar/yuck.vim",
	"peterhoeg/vim-qml",
	"tpope/vim-fugitive",
	"KabbAmine/lazyList.vim",
	"jwalton512/vim-blade",
	"uga-rosa/ccc.nvim", --Colorpicker
	-- {
	-- 	"skanehira/preview-uml.vim",
	-- 	config = function()
	-- 		vim.g.preview_uml_url = "http://localhost:8080"
	-- 	end,
	-- }, --UML preview
	{
		"NvChad/nvim-colorizer.lua", --Display colors
		opts = {},
	},
	"pedro757/emmet",
	"lervag/vimtex", --LaTeX
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	-- build = function ()
	-- 	--   vim.fn["mkdp#util#install"]()
	-- 	-- end,
	-- 	config = function()
	-- 		vim.g.mkdp_browser = "firefox"
	-- 		-- function OpenMarkdownPreview(url)
	-- 		--    vim.fn.execute("silent ! firefox --new-window " .. url)
	-- 		-- end
	-- 		-- vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
	-- 	end,
	-- },

	{
		"samjwill/nvim-unception", --Open files from within Neovim's terminal
		init = function()
			-- Optional settings go here!
			-- vim.g.unception_open_buffer_in_new_tab = true
			vim.api.nvim_create_autocmd("User", {
				pattern = "UnceptionEditRequestReceived",
				callback = function()
					-- Toggle the terminal off.
					require("FTerm").toggle()
				end,
			})
		end,
	},
	--Run lines of code inside neovim
	{ "michaelb/sniprun" }, --run = 'bash ./install.sh 1'

	-- LSP

	-- Database connections
	-- use { "kristijanhusak/vim-dadbod-ui" }
	-- use { "kristijanhusak/vim-dadbod-completion" }
	-- use { "tpope/vim-dadbod" }
	-- use { "tpope/vim-dotenv" }

	-- Others
	-- use {
	--     'glacambre/firenvim',
	--     run = function() vim.fn['firenvim#install'](0) end
	-- } --Embed Neovim in Chrome, Firefox & others.

	-- "dstein64/vim-startuptime",
	-- 'kevinhwang91/rnvimr',
	-- "JoosepAlviste/nvim-ts-context-commentstring",
	--"lewis6991/impatient.nvim"
	-- "toppair/peek.nvim", -- like markdown-preview
	-- "mihaifm/bufstop",
	-- "adoy/vim-php-refactoring-toolbox",
}
