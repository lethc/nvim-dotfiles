return {
  "https://gitlab.com/itaranto/plantuml.nvim",
  --dependencies: pacman -S plantuml imv feh
  version = "*",
  cmd = "PlantUMLRun",
  config = function()
    require("plantuml").setup({
      renderer = {
        type = "imv",
        options = {
          dark_mode = true,
        },
      },
    })
  end,
}
--Alternative
-- return {
--   "weirongxu/plantuml-previewer.vim",
--   cmd = {"PlantumlOpen","PlantumlStop",},
--   -- ft = "uml",
--   dependencies = {
--     "tyru/open-browser.vim",
--   },
-- }
