-- local colorscheme = "themer_radium"
local colorscheme = "themer_gruvbox"
--local colorscheme = "no-clown-fiesta"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
