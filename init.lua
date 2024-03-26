require("configs")

if vim.g.neovide then
    local alpha = function()
        return string.format("%x", math.floor(255 * (vim.g.transparency or 0.9)))
    end
    -- vim.o.guifont = "SF Mono:h11" -- Font
    vim.o.guifont = "RobotoMono Nerd Font:h11" -- Font
    vim.opt.linespace = 0
    vim.g.neovide_scale_factor = 1.0
    vim.g.neovide_padding_top = 0 --padding
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0
    -- vim.g.neovide_transparency = 0.8 --background
    vim.g.neovide_transparency = 1 --background
    vim.g.transparency = 0.8
    vim.g.neovide_background_color = "#141B1E" .. alpha()
end
