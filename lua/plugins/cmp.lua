return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-git",
    "saadparwaiz1/cmp_luasnip",
    "chrisgrieser/cmp-nerdfont",
    "octaltree/cmp-look",
    "f3fora/cmp-spell",
    { "L3MON4D3/LuaSnip", version = "v1.*" },
    "rafamadriz/friendly-snippets",
    "jcha0713/cmp-tw2css",
    "amarakon/nvim-cmp-fonts",
  },
  config = function()
    local cmp_status_ok, cmp = pcall(require, "cmp")
    if not cmp_status_ok then
      return
    end

    local snip_status_ok, luasnip = pcall(require, "luasnip")
    if not snip_status_ok then
      return
    end

    require("luasnip/loaders/from_vscode").lazy_load()

    local check_backspace = function()
      local col = vim.fn.col(".") - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
    end

    -- 󰃐 󰆩 󰙅 󰛡  󰅲   some other good icons
    local kind_icons = {
      Text = "󰉿",
      Method = "m",
      Function = "󰆧",
      Constructor = "",
      Field = "",
      Variable = "󰆧",
      Class = "󰌗 ",
      Interface = "",
      Module = "",
      Property = "",
      Unit = "",
      Value = "󰎠",
      Enum = "",
      Keyword = "󰌋",
      Snippet = "",
      Color = "󰏘",
      File = "󰈙",
      Reference = "",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰇽",
      Struct = "",
      Event = "",
      Operator = "󰆕",
      TypeParameter = "󰊄",
    }

    local function border(hl_name)
      return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
      }
    end
    -- find more here: https://www.nerdfonts.com/cheat-sheet

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      },
      formatting = {
        -- fields = { "abbr", "kind", "menu" },
        fields = { "abbr", "kind" },
        format = function(entry, vim_item)
          -- Kind icons
          -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
          -- vim_item.menu = ({
          --   luasnip = " [Snip]",
          --   nvim_lsp = " [LSP]",
          --   buffer = " [Text]",
          --   path = " [Path]",
          -- })[entry.source.name]
          return vim_item
        end,
      },
      sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "nerdfont" },
        {
          name = "look",
          keyword_length = 2,
          option = {
            convert_case = true,
            loud = true,
            --dict = '/usr/share/dict/words'
          },
        },
        {
          name = "spell",
          option = {
            keep_all_entries = false,
            enable_in_context = function()
              return true
            end,
          },
        },
        { name = "cmp-tw2css" },
        { name = "fonts",     option = { space_filter = "-" } },
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      window = {
        -- documentation = {
        --   border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        -- },
        completion = {
          scrollbar = false,
          border = border("PmenuBorder"),
          winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:PmenuSel",
          -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
        documentation = cmp.config.window.bordered(),
      },
      experimental = {
        ghost_text = false,
        native_menu = false,
      },
      -- view = {
      --   entries = "native",
      -- },
    })
  end,
}
