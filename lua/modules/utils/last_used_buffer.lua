-- Function to switch between last used and previous buffer

function _G.switch_to_alt_or_prev()
    local alt_buf = vim.fn.bufnr("#")
    if alt_buf ~= -1 and vim.fn.buflisted(alt_buf) == 1 then
        vim.cmd("buffer #")
    else
        vim.cmd("bprevious")
    end
end

vim.api.nvim_set_keymap("n", "<Tab>", ":lua switch_to_alt_or_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<BS>", ":lua switch_to_alt_or_prev()<CR>", { noremap = true, silent = true })
