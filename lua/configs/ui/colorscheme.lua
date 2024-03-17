local var_colour = {}

var_colour.colour = function()
vim.cmd([[ hi! CursorLineBG guibg=#373737 guifg=#E1E1E1 ]])
    -- Themery block
-- This block will be replaced by Themery.
vim.cmd("colorscheme canon")
vim.g.theme_id = 3
-- end themery block
end

return var_colour
