return {
  "goolord/alpha-nvim",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local status_ok, alpha = pcall(require, "alpha")
    if not status_ok then
      return
    end

    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[⣿⣿⣿⡏⣿⣿⣿⡟⡠⠀⣼⡿⠁⠀⣠⣴⡿⢁⡴⠁⣼⠟⢁⡏⢸⢸⠀⠀⢡⠀]],
      [[⣿⣿⢛⠷⢿⣿⡿⣰⠃⠘⢋⠃⣠⣾⣿⣿⢁⣾⠁⢸⠏⡀⣼⡁⠀⠈⠀⠀⠸⡀]],
      [[⣿⣿⣎⣃⣵⣿⣻⢣⠀⠀⢀⣼⣷⣾⣿⡇⣾⡟⢀⠏⡐⣼⣿⣧⠀⠀⠀⠀⠀⣇]],
      [[⣿⣿⣿⣿⣿⣿⢧⢿⠇⠀⠎⢛⡋⠻⣿⣷⣿⣧⠈⣰⣳⣝⢿⣿⡀⠀⠀⠀⢠⢻]],
      [[⣿⣿⣿⣿⡿⠳⣳⠋⠀⠀⣼⠋⠀⠠⢸⣿⣿⣿⣠⣿⣿⣿⣷⣝⡷⠀⢠⠀⢨⢸]],
      [[⣿⣿⡿⢋⢄⠞⠁⣠⡆⢸⣿⢸⡻⡀⣸⣿⣿⣿⣿⣿⣿⠂⠉⠻⢿⣧⡈⢆⠀⠀]],
      [[⣿⣿⠘⠁⢀⣴⣾⡿⢣⣦⢻⣬⣯⣾⣿⣿⣿⣿⣿⣿⢃⣤⣄⠠⣤⠹⣷⡈⠀⠀]],
      [[⠋⠁⠠⠊⠀⠀⠀⠾⡸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢘⣟⣫⢆⣿⡇⣿⠃⠀⠀]],
      [[⣀⢂⡔⢶⣿⠟⣫⣾⢿⣪⣟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣩⣵⣿⣿⡵⠁⡀⢀⣶]],
      [[⣿⣾⣿⢆⡗⣾⣯⣷⡿⢟⣯⣾⣻⣞⢿⢿⣿⣿⣿⣿⣿⣿⣿⣟⣉⡤⢗⣵⣿⣿]],
      [[⣿⣿⢣⣿⣷⠽⣿⣿⣿⣿⢟⣯⣶⢹⣿⠿⡿⠿⠿⠿⢿⣿⣿⠿⣋⠾⢿⣛⣿⣿]],
      [[⣿⣷⣿⣿⣿⢸⣮⡻⣿⣿⣿⣿⠍⡚⢱⣿⡏⣿⡇⣿⡿⣶⣦⠀⠘⠿⠿⠽⠛⠃]],
      [[⣿⣿⣿⣹⣾⣼⣿⣿⣷⣭⣭⣵⠇⣥⣾⣿⣿⣿⣿⣿⣿⣿⢣⣾⣿⣿⣿⣿⣷⣥]],
    }
    dashboard.section.buttons.val = {
      dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "󱎫  Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "󰚞  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
      dashboard.button("q", "󰅚  Quit Neovim", ":qa<CR>"),
      (function()
        local group = { type = "group", opts = { spacing = 0 } }
        group.val = {
          {
            type = "text",
            val = "Sessions",
            opts = {
              position = "center",
            },
          },
        }
        local path = vim.fn.stdpath("data") .. "/possession"
        local files = vim.split(vim.fn.glob(path .. "/*.json"), "\n")
        for i, file in pairs(files) do
          local basename = vim.fs.basename(file):gsub("%.json", "")
          local button =
              dashboard.button(tostring(i), "󰑓 " .. basename, "<cmd>PossessionLoad " .. basename .. "<cr>")
          table.insert(group.val, button)
        end
        return group
      end)(),
    }

    local function footer()
      -- NOTE: requires the fortune-mod package to work
      -- local handle = io.popen("fortune")
      -- local fortune = handle:read("*a")
      -- handle:close()
      -- return fortune
      return "~Okaerinasaimase Goshujin-Sama~"
    end

    dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true
    -- vim.cmd([[autocmd User AlphaReady echo 'ready']])
    alpha.setup(dashboard.opts)
  end,
}
