local var_colour = {}

var_colour.colour = function()
  -- Themery block
-- This block will be replaced by Themery.
vim.cmd("colorscheme tokyonight")
vim.g.theme_id = 3
-- end themery block
end

return var_colour
