return {
	--Colorschemes
	{ "lunarvim/darkplus.nvim" },

	"getomni/neovim", --omni
	"nyoom-engineering/oxocarbon.nvim",
	"EdenEast/nightfox.nvim",
	{
		"aktersnurra/no-clown-fiesta.nvim",
		config = function()
			require("no-clown-fiesta").setup({
				transparent = false, -- Enable this to disable the bg color
				styles = {
					-- You can set any of the style values specified for `:h nvim_set_hl`
					comments = {},
					keywords = {},
					functions = {},
					variables = {},
					type = { bold = true },
					lsp = { underline = true },
				},
			})
		end,
	},
	-- {
	-- 	"tiagovla/tokyodark.nvim",
	-- 	config = function()
	-- 		vim.g.tokyodark_transparent_background = true
	-- 		vim.g.tokyodark_enable_italic_comment = true
	-- 		vim.g.tokyodark_enable_italic = true
	-- 		vim.g.tokyodark_color_gamma = "1.0"
	-- 	end,
	-- },
	"akinsho/horizon.nvim",
	-- use { "bluz71/vim-moonfly-colors", as = "moonfly" }
	-- use { "catppuccin/nvim" }
	-- use {'decaycs/decay.nvim', as = 'decay'}
	-- use { "rktjmp/lush.nvim" }
	-- use {"projekt0n/github-nvim-theme"}
	-- use {"rebelot/kanagawa.nvim"}
	-- use { "nocksock/bloop.nvim" }
	-- use {"olimorris/onedarkpro.nvim"}
	-- use {"mcchrish/zenbones.nvim"}
	-- use {"Yagua/nebulous.nvim"}
	-- use { "doki-theme/doki-theme-vim" }
	-- use {"Alexis12119/dull.nvim"}
	{
		"Alexis12119/nightly.nvim",
		config = function()
			require("nightly").setup({
				color = "red", -- blue, green or red
				transparent = false,
				styles = {
					comments = { italic = true },
					functions = { italic = false },
					keywords = { italic = false },
					variables = { italic = false },
				},
				highlights = {
					-- add or override highlights
					-- Normal = { bg = "#000000" }
				},
			})
		end,
	}, -- easy to customise
	-- use {"pineapplegiant/spaceduck"}
	-- use {"ray-x/aurora"}
	-- use {'Yazeed1s/oh-lucy.nvim'}
	-- use {'kvrohit/mellow.nvim'}
	-- use { 'embark-theme/vim', as = 'embark' }
}
