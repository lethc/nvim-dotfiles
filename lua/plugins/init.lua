return {
	"arjunmahishi/flow.nvim", --Required for Telescope
	"nvim-lua/plenary.nvim",
	"moll/vim-bbye",
	"elkowar/yuck.vim",
	"peterhoeg/vim-qml",
	"tpope/vim-fugitive",
	"KabbAmine/lazyList.vim",
	"jwalton512/vim-blade",
	"mihaifm/bufstop",
	-- "adoy/vim-php-refactoring-toolbox",
	"uga-rosa/ccc.nvim", --Colorpicker
	{
		"weirongxu/plantuml-previewer.vim",
		dependencies = {
			"aklt/plantuml-syntax",
			"tyru/open-browser.vim",
		},
	},
	-- {
	-- 	"skanehira/preview-uml.vim",
	-- 	config = function()
	-- 		vim.g.preview_uml_url = "http://localhost:8080"
	-- 	end,
	-- }, --UML preview
	{
		"ekickx/clipboard-image.nvim",
		config = function() --Set a symbolic link between your Obsidian img folder and your user path
		end,
		--Check this: https://github.com/ekickx/clipboard-image.nvim/issues/50
		--modify the health.lua in clipboard-image plugins
		-- local health = vim.health or require "health"
		--
		-- instead of
		--
		-- local health = require "health"
	},
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
	"simrat39/rust-tools.nvim",

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
}
