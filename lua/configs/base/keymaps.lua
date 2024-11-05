local keymaps = {}

keymaps["normal"] = {
    -- { "<C-n>", ":enew<CR>" }, -- New empty buffer
    { "<C-t>", ":tabnew<CR>" }, -- New empty tab
    { "<C-tab>", ":tabnext<CR>" }, -- Move next tab
    { "<C-S-tab>", ":tabprevious<CR>" }, -- Move previous tab
    { "<A-1>", "1gt" }, -- Move 1 tab
    { "<A-2>", "2gt" }, -- Move 2 tab
    { "<A-3>", "3gt" }, -- Move 3 tab
    { "<A-4>", "4gt" }, -- Move 4 tab
    { "<A-5>", "5gt" }, -- Move 5 tab
    { "<A-6>", "6gt" }, -- Move 6 tab
    { "<A-7>", "7gt" }, -- Move 7 tab
    { "<A-8>", "8gt" }, -- Move 8 tab
    { "<A-9>", "1gT" }, -- Move to the last tab
    { "<S-l>", ":bnext<CR>" }, -- Navigate between buffers
    { "<S-h>", ":bprevious<CR>" },
    { "<BS>", ":b#<CR>" }, -- Like Ctrl + Tab in a browser
    { "<Tab>", ":b#<CR>" },
    -- { "<A-BS>", ":wincmd j | :q | :b#<CR>" }, -- Used with alpha.nvim
    { "<A-BS>", ":wincmd j | :q<CR>" },
    { "<S-q>", "<cmd>Bdelete!<CR>" }, -- Close buffer
    -- { "<C-h>", "<C-w>h" }, -- Better window navigation
    -- { "<C-j>", "<C-w>j" },
    -- { "<C-k>", "<C-w>k" },
    -- { "<C-l>", "<C-w>l" },
    { "<C-Up>", ":resize -2<CR>" }, -- Resize windows with arrows
    { "<C-Down>", ":resize +2<CR>" },
    { "<C-Left>", ":vertical resize -2<CR>" },
    { "<C-Right>", ":vertical resize +2<CR>" },
    -- { "<C-c>", "<cmd>normal! ciw<cr>a" }, --ciw
    -- { "t"         ,     "s"                       }, -- Replace s with the t
    { "J", "mzJ`z" }, -- Don't move the cursor when you press J
    -- { "n", "nzzzv" }, -- Set the cursor to the middle of the screen
    -- { "N", "Nzzzv" },
    { "<leader>q", "<CMD>q!<CR>" },
    { "<leader>Q", "<CMD>qa!<CR>" },
    { "<leader><leader>w", "<cmd>w!<CR>" },
    { "<leader>h", "<cmd>nohlsearch<CR>" },
    -- { "<A-p>", "<cmd>PasteImg<CR>" }, -- Clipboard-image.nvim plugin
    -- { "<Up>", "gk" },
    -- { "<Down>", "gj" },
    { "<leader>u", "mzlblgueh~`z" }, -- Quickly Toggle Casing
    { "gD", "<cmd>lua vim.lsp.buf.definition()<CR>" },
    -- { "gl", "<cmd>lua vim.lsp.buf.declaration()<CR>" },
    { "<leader>hn", "<cmd>set nowrap<CR>" },
    { "<leader>hw", "<cmd>set wrap<CR>" },
    { "<Leader><leader>a", "<CMD>!apy add-from-file ~/Home/Templates/flashcards.md<CR>" },
    { "<Leader><leader>ac", "<CMD>!apy add-from-file ~/Home/Templates/flashcards_cloze.md<CR>" },
    { "<Leader><leader>s", "<CMD>!apy sync<CR>" },
    { "<Leader><leader>m", "<CMD>source ~/Home/Scripts/VI/macros.vim<CR> | <CMD>lua require('notify')('Macros Updated')<CR>" },
}

keymaps["insert"] = {
    -- { "jk", "<ESC>" }, -- Exit from insert mode easily
    -- { "kj", "<ESC>" },
    { "jj", "<ESC>" },
    { "JJ", "<ESC>" },
    { "<C-h>", "<Left>" }, -- Better window navigation
    { "<C-j>", "<Down>" },
    { "<C-k>", "<Up>" },
    { "<C-l>", "<Right>" },
}

keymaps["visual"] = {
    { "<", "<gv" }, -- Better indent mode
    { ">", ">gv" },
    { "J", ":m '>+1<CR>gv=gv" }, -- Move the selected text up and down
    { "K", ":m '<-2<CR>gv=gv" },
    { "p", '"_dP' }, -- Paste the same text multiple times
    { "<C-r>", "<CMD>lua require('search-replace')<CR><CMD>SearchReplaceSingleBufferVisualSelection<CR>" }, -- search-replace.nvim plugin
    { "<C-s>", "<CMD>lua require('search-replace')<CR><CMD>SearchReplaceWithinVisualSelection<CR>" },
    { "<C-c>", "<CMD>lua require('search-replace')<CR><CMD> SearchReplaceWithinVisualSelectionCWord<CR>" },
}

keymaps["visual_block"] = {
    { "J", ":m '>+1<CR>gv-gv" }, -- Move the selected text up and down
    { "K", ":m '<-2<CR>gv-gv" },
    { "V", "j" }, -- Repeated V in Visual Line Mode
}

keymaps["terminal"] = {
    { "<C-n><C-n>", "<C-\\><C-n>" }, -- Return to normal mode
}

return keymaps
