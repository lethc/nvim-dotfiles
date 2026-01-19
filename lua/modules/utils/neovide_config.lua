if vim.g.neovide then
    -- vim.o.guifont = "SF Mono:h11" -- Font
    vim.o.guifont = "Illinois Mono:h13" -- Font
    vim.o.linespace = -1

    -- emulate alacritty font rendering
    vim.g.neovide_text_gamma = 0.8
    vim.g.neovide_text_contrast = 0.1

    -- padding
    vim.g.neovide_padding_top = 5
    vim.g.neovide_padding_left = 5
    -- vim.g.neovide_padding_bottom = 0
    -- vim.g.neovide_padding_right = 0

    vim.g.neovide_floating_corner_radius = 1.0

    -- disable blur
    -- vim.g.neovide_window_blurred = false
    -- vim.g.neovide_floating_blur_amount_x = 0.0
    -- vim.g.neovide_floating_blur_amount_y = 0.0
    -- vim.g.neovide_floating_shadow = false
    -- vim.g.neovide_floating_z_height = 0
    -- vim.g.neovide_light_angle_degrees = 0
    -- vim.g.neovide_light_radius = 0
    --
    -- vim.g.neovide_transparency = 1.0
    -- -- vim.g.neovide_transparency = 0.8 --background
    -- vim.g.neovide_hide_mouse_when_typing = true
    -- vim.g.neovide_underline_stroke_scale = 0.5
    -- vim.g.neovide_refresh_rate = 60
    -- vim.g.neovide_fullscreen = false
    -- vim.g.neovide_remember_window_size = false
end
