-- Function to interact with flashcards

function _G.script_flashcard(cloze)
    local base_cmd = os.getenv("HOME") .. "/.scripts/utils/update_flashcards"
    local cmd = cloze and (base_cmd .. " cloze") or base_cmd
    vim.cmd(":! " .. cmd)
end
vim.api.nvim_set_keymap(
    "n",
    "<leader><leader>a",
    "<CMD>lua script_flashcard()<CR> | <CMD>!apy add-from-file ~/Home/Templates/flashcards/flashcards.md<CR>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader><leader>ac",
    "<CMD>lua script_flashcard(true)<CR> | <CMD>!apy add-from-file ~/Home/Templates/flashcards/cloze_flashcards.md<CR>",
    { noremap = true, silent = true }
)
