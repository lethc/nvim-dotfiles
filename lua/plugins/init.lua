return {
  {
    "xiyaowong/transparent.nvim",
    config = function ()
    vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "ExtraGroup" })
    -- vimscript: let g:transparent_groups = extend(get(g:, 'transparent_groups', []), ["ExtraGroup"])
      require("transparent").setup({

        groups = { -- table: default groups
          'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
          'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
          'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
          'SignColumn', 'CursorLineNr', 'EndOfBuffer',
        },
        extra_groups = {
          -- "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
          -- "NvimTreeNormal" -- NvimTree
        }, -- table: additional groups that should be cleared
        exclude_groups = {}, -- table: groups you don't want to clear
      })
    end
  },
	{
		"itchyny/calendar.vim",
		config = function()
			vim.g.calendar_google_calendar = 1
			vim.g.calendar_google_task = 1
      vim.cmd "source ~/.cache/calendar.vim/credentials.vim"
		end,
	},
	{
		"nvim-tree/nvim-web-devicons", --Dependency for various plugins
		lazy = true,
	},
	{
		"mg979/vim-visual-multi",
		lazy = true,
	},
	{
		"Exafunction/codeium.vim",
		cmd = "CodeiumEnable",
		config = function()
			vim.g.codeium_disable_bindings = 0
			vim.g.codeium_no_map_tab = 1
			-- vim.g.codeium_filetypes = { "bash" == false, "typescript" == true }

			vim.keymap.set("i", "<c-c>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true })
			vim.keymap.set("i", "<c-.>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true })
			vim.keymap.set("i", "<c-,>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true })
			vim.keymap.set("i", "<c-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true })
		end,
	},
	-- {
	-- 	"jcdickinson/http.nvim",
	-- 	build = "cargo build --workspace --release",
	-- },
	-- {
	-- 	"jcdickinson/codeium.nvim",
	-- 	dependencies = {
	-- 		-- "jcdickinson/http.nvim",
	-- 		-- "nvim-lua/plenary.nvim",
	-- 		"hrsh7th/nvim-cmp",
	-- 	},
	-- 	config = function()
	-- 		require("codeium").setup({})
	-- 	end,
	-- },
	{
		"HampusHauffman/block.nvim",
		cmd = { "Block", "BlockOn" },
		config = function()
			require("block").setup({})
		end,
	},
	{
		"roobert/search-replace.nvim",
		event = "VeryLazy",
		config = function()
			require("search-replace").setup({
				-- optionally override defaults
				default_replace_single_buffer_options = "gcI",
				default_replace_multi_buffer_options = "egcI",
			})
			vim.o.inccommand = "split"
		end,
	},
	-- {
	-- 	"mzlogin/vim-markdown-toc",
	-- 	 ft = "markdown",
	-- },
	{
		"xorid/asciitree.nvim",
		-- ft = "markdown",
		keys = { "<leader>ca", "<cmd>lua require('asciitree').setup()<CR>" },
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
    --execute npm install --prefix server
		event = "VeryLazy",
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
	{
		"fei6409/log-highlight.nvim",
		ft = "log",
		config = function()
			require("log-highlight").setup({})
		end,
	},
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "moll/vim-bbye", event = "VeryLazy" },
	{ "elkowar/yuck.vim", ft = "yuck" },
	{ "peterhoeg/vim-qml", ft = "qml" },
	{ "theRealCarneiro/hyprland-vim-syntax", ft = "hypr" },
	{ "KabbAmine/lazyList.vim", ft = "markdown" },
	{ "jwalton512/vim-blade", ft = "php" },
	{ "aklt/plantuml-syntax" },
	{ "uga-rosa/ccc.nvim", cmd = "CccPick" }, --Colorpicker
	{ "tpope/vim-fugitive", event = "VeryLazy" },
	{
		"NvChad/nvim-colorizer.lua", --Display colors
		event = "VeryLazy",
		opts = {},
	},
	{ "pedro757/emmet", ft = { "html", "javascript" } },
	{ "lervag/vimtex", ft = { "tex" } }, --LaTeX

	{
		"samjwill/nvim-unception", --Open files from within Neovim's terminal
		event = "VeryLazy",
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
	{ "michaelb/sniprun", event = "VeryLazy" }, --run = 'bash ./install.sh 1'
	-- LSP

	-- Database connections
	-- use { "kristijanhusak/vim-dadbod-ui" }
	-- use { "kristijanhusak/vim-dadbod-completion" }
	-- use { "tpope/vim-dadbod" }
	-- use { "tpope/vim-dotenv" }

	-- Others

	-- {
	-- 	"skanehira/preview-uml.vim",
	-- 	config = function()
	-- 		vim.g.preview_uml_url = "http://localhost:8080"
	-- 	end,
	-- }, --UML preview
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
