return {
  --Colorschemes
  { "lunarvim/darkplus.nvim" },

  "getomni/neovim", --omni
  "nyoom-engineering/oxocarbon.nvim",
  "EdenEast/nightfox.nvim",
  "aktersnurra/no-clown-fiesta.nvim",
  {
    "tiagovla/tokyodark.nvim",
    config = function()
      vim.g.tokyodark_transparent_background = true
      vim.g.tokyodark_enable_italic_comment = true
      vim.g.tokyodark_enable_italic = true
      vim.g.tokyodark_color_gamma = "1.0"
    end,
  },
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
  -- use "Alexis12119/nightly.nvim"  -- easy to customise
  -- use {"pineapplegiant/spaceduck"}
  -- use {"ray-x/aurora"}
  -- use {'Yazeed1s/oh-lucy.nvim'}
  -- use {'kvrohit/mellow.nvim'}
  -- use { 'embark-theme/vim', as = 'embark' }
}
