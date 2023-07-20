local ui_config = require("modules.ui.configs")
local modules = {
  "lvim-tech/lvim-colorscheme",
  {
    "AstroNvim/astrotheme",
    config = function()
      require("astrotheme").setup({
      })
    end
  },
  {
    "EdenEast/nightfox.nvim",
  },
  {
    "Alexis12119/nightly.nvim",
    config = function()
      require("nightly").setup({
        transparent = vim.g.transparent_enabled,
        styles = {
          comments = { italic = true },
          functions = { italic = false },
          keywords = { italic = false },
          variables = { italic = false },
        },
        highlights = {
          -- Normal = { bg = "#000000" }
        },
      })
    end,
  },
  {
    "zaldih/themery.nvim",
    keys = { "<leader>" },
    -- event = "VeryLazy",
    config = ui_config.themery,
  },
  {
    "nvim-lualine/lualine.nvim",
    -- dependencies = { "linrongbin16/lsp-progress.nvim" },
    -- event = { "VeryLazy" },
    event = "BufRead",
    config = ui_config.lualine,
  },
  {
    "rcarriga/nvim-notify",
    lazy = true,
    config = ui_config.nvim_notify,
  },
  {
    "folke/noice.nvim",
    event = "BufReadPre",
    -- event = "VeryLazy",
    -- lazy = true,
    config = ui_config.nvim_noice,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    -- event = "BufEnter",
    event = "BufReadPre",
    -- event = { 'BufRead', 'BufNewFile' },
    config = ui_config.indent_blankline,
  },
  {
    "karb94/neoscroll.nvim",
    config = ui_config.neoscroll_nvim,
    keys = {
      { "<A-k>", mode = { "n", "v", "x" } },
      { "<A-j>", mode = { "n", "v", "x" } }
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    -- event = "BufReadPre",
    event = { 'BufRead', 'BufNewFile' },
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            relculright = true,
            segments = {
              { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
              { text = { "%s" },                  click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          })
        end,
      },
    },
    config = ui_config.nvim_ufo,
  },
  {
    "Pocco81/true-zen.nvim",
    keys = {
      { "<leader>j", "<cmd>TZAtaraxis<cr>", desc = "Zen" },
    },
    config = ui_config.true_zen,
  },
  {
    "xiyaowong/transparent.nvim",
    event = "BufReadPre",
    -- keys = { "<leader>" },
    config = ui_config.transparent,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = ui_config.alpha,
  },
}

return modules
