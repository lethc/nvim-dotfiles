-- local colorscheme = "themer_radium"
-- local colorscheme = "horizon"
local colorscheme = "catppuccin-frappe"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
