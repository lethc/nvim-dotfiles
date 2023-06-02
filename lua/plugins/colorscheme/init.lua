return {
  --Colorschemes
  -- { "sainnhe/everforest" },
  {
    "projekt0n/github-nvim-theme",
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
    end,
  },
  {
    "lunarvim/darkplus.nvim",
    cmd = "Telescope colorscheme",
    lazy = true,
  },
  {
    "neanias/everforest-nvim",
    priority = 1000,
    lazy = true,
    config = function()
      require("everforest").setup({
        -- Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
        -- Default is "medium".
        background = "medium",
        -- How much of the background should be transparent. Options are 0, 1 or 2.
        -- Default is 0.
        --
        -- 2 will have more UI components be transparent (e.g. status line
        -- background).
        transparent_background_level = 0,
        -- Whether italics should be used for keywords, builtin types and more.
        italics = false,
        -- Disable italic fonts for comments. Comments are in italics by default, set
        -- this to `true` to make them _not_ italic!
        disable_italic_comments = false,
      })
    end,
  },
  {
    "getomni/neovim", --omni
    cmd = "Telescope colorscheme",
    lazy = true,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    cmd = "Telescope colorscheme",
    lazy = true,
  },
  {
    "EdenEast/nightfox.nvim",
    cmd = "Telescope colorscheme",
    lazy = true,
  },
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
  {
    "akinsho/horizon.nvim",
    cmd = "Telescope colorscheme",
    lazy = true,
  },
  {
    "Alexis12119/nightly.nvim",
    cmd = "Telescope colorscheme",
    lazy = true,
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
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        compile = false,  -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,   -- do not set background color
        dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {
          -- add/modify theme and palette colors
          palette = {},
          -- theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        overrides = function(colors) -- add/modify highlights
          local theme = colors.theme
          return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          }
        end,
        theme = "dragon", -- Load "wave" theme when 'background' option is not set
        background = {
          -- map the value of 'background' option to a theme
          dark = "dragon", -- try "dragon" !
          light = "lotus",
        },
      })

      -- setup must be called before loading
      -- vim.cmd("colorscheme kanagawa")
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
  -- use { "bluz71/vim-moonfly-colors", as = "moonfly" }
  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
          -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        show_end_of_buffer = false, -- show the '~' characters after the end of buffers
        term_colors = false,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        no_italic = false, -- Force no italic
        no_bold = false,   -- Force no bold
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {
          frappe = {
            base     = "#2d353b",
            mantle   = "#232a2e",
            surface1 = "#56635F",
            -- surface0 = "#343F44",
            surface0 = "#2E383C",
            pink = "#7FBBB3",
            blue = "#7FBBB3",
            peach = "#A7C080",
            green = "#83C092",
            mauve = "#E27D7E",
            text = "#D3C6AA",
            sky = "#E69875",
            lavender = "#7FBBB3",
            overlay0 = "#859289",
            overlay1 = "#859289",
            overlay2 = "#859289",
          },
        },
        custom_highlights = {},
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          notify = true,
          mini = false,
          alpha = true,
          which_key = true,
          mason = true,
          markdown = true,
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })
    end,
  },
  -- use {'decaycs/decay.nvim', as = 'decay'}
  -- use { "rktjmp/lush.nvim" }
  -- use {"projekt0n/github-nvim-theme"}
  -- use { "nocksock/bloop.nvim" }
  -- use {"olimorris/onedarkpro.nvim"}
  -- use {"mcchrish/zenbones.nvim"}
  -- use {"Yagua/nebulous.nvim"}
  -- use { "doki-theme/doki-theme-vim" }
  -- use {"Alexis12119/dull.nvim"}
  -- use {"pineapplegiant/spaceduck"}
  -- use {"ray-x/aurora"}
  -- use {'Yazeed1s/oh-lucy.nvim'}
  -- use {'kvrohit/mellow.nvim'}
  -- use { 'embark-theme/vim', as = 'embark' }
}
