local keymaps = {}

keymaps["normal"] = {
    -- { "<C-n>", ":enew<CR>" }, -- New empty buffer
    { "<C-t>", ":tabnew<CR>" }, -- New empty tab
    { "<C-tab>", ":tabnext<CR>" }, -- Move next tab
    { "<C-S-tab>", ":tabprevious<CR>" }, -- Move previous tab
    { "<S-l>", ":bnext<CR>" }, -- Navigate between buffers
    { "<S-h>", ":bprevious<CR>" },
    -- { "<BS>", ":b#<CR>" }, -- Like Ctrl + Tab in a browser
    -- { "<Tab>", ":b#<CR>" },
    -- { "<A-BS>", ":wincmd j | :q | :b#<CR>" }, -- Used with alpha.nvim
    { "<A-BS>", ":wincmd j | :q<CR>" },
    { "<S-q>", "<cmd>bwipeout<CR>" }, -- Close buffer
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
    --[[ { "<Leader><leader>a", "<CMD>!apy add-from-file ~/Home/Templates/flascards/flashcards.md<CR>" },
    { "<Leader><leader>ac", "<CMD>!apy add-from-file ~/Home/Templates/flascards/flashcards_cloze.md<CR>" }, ]]
    { "<Leader><leader>s", "<CMD>!apy sync<CR>" },
    { "<Leader><leader>m", "<CMD>source ~/Home/Scripts/VI/macros.vim<CR> | <CMD>lua vim.notify('Macros Updated')<CR>" },
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
    { "H", "<gv" },
    { "L", ">gv" },
    { "J", ":m '>+1<CR>gv=gv" }, -- Move the selected text up and down
    { "K", ":m '<-2<CR>gv=gv" },
    { "p", '"_dP' }, -- Paste the same text multiple times
    { "<C-r>", "<CMD>lua require('search-replace')<CR><CMD>SearchReplaceSingleBufferVisualSelection<CR>" }, -- search-replace.nvim plugin
    { "<C-s>", "<CMD>lua require('search-replace')<CR><CMD>SearchReplaceWithinVisualSelection<CR>" },
    { "<C-c>", "<CMD>lua require('search-replace')<CR><CMD> SearchReplaceWithinVisualSelectionCWord<CR>" },
    { "/", "<C-\\><C-n>`</\\%V" }, -- search for text inside a visual selection
    { "?", "<C-\\><C-n>`>?\\%V" },
}

keymaps["visual_block"] = {
    { "<", "<gv" }, -- Better indent mode
    { ">", ">gv" },
    { "H", "<gv" },
    { "L", ">gv" },
    { "J", ":m '>+1<CR>gv-gv" }, -- Move the selected text up and down
    { "K", ":m '<-2<CR>gv-gv" },
    { "V", "j" }, -- Repeated V in Visual Line Mode
    { "/", "<C-\\><C-n>`</\\%V" },
    { "?", "<C-\\><C-n>`>?\\%V" },
}

keymaps["terminal"] = {
    { "<C-n><C-n>", "<C-\\><C-n>" }, -- Return to normal mode
}

return keymaps
