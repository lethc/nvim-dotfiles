return {
	"nvim-lua/plenary.nvim",
	"moll/vim-bbye",
	"elkowar/yuck.vim",
	"peterhoeg/vim-qml",
	"voldikss/vim-floaterm",
	"tpope/vim-surround",
  "mihaifm/bufstop",
	{
		"NvChad/nvim-colorizer.lua", --Display colors
		opts = {},
	},
	"pedro757/emmet",
	"lervag/vimtex", --LaTeX
	{
		"iamcco/markdown-preview.nvim",
    -- build = function ()
    --   vim.fn["mkdp#util#install"]()
    -- end,
		config = function ()
      vim.g.mkdp_browser = 'firefox'
      -- function OpenMarkdownPreview(url)
      --    vim.fn.execute("silent ! firefox --new-window " .. url)
      -- end
      -- vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
		end,
	},

	-- LSP
	"simrat39/rust-tools.nvim",

	-- Debug Adapter Protocol
	-- "mfussenegger/nvim-dap",
	-- "rcarriga/nvim-dap-ui",
	-- "theHamsta/nvim-dap-virtual-text",
	-- "leoluz/nvim-dap-go",
	-- "mfussenegger/nvim-dap-python",
	-- "mfussenegger/nvim-jdtls",

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
