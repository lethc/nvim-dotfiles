local M = {}

M.keymaps = function(mode, opts, keymaps)
  for _, keymap in ipairs(keymaps) do
    vim.keymap.set(mode, keymap[1], keymap[2], opts)
  end
end


return M
