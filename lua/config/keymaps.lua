local map = vim.keymap.set

-- NORMAL
map("n", "x", '"_x')
map("n", "X", '"_X')
map("n", "c", '"_c')
map("n", "C", '"_C')
map("n", "s", '"_s')
map("n", "S", '"_S')
map("n", "<C-t>", ":tabnew<CR>", { desc = "New tab" })
-- map("n", "<C-n>", ":enew<CR>", { desc = "New tab" })
map("n", "<C-tab>", ":tabnext<CR>", { desc = "Next tab" })
map("n", "<C-S-tab>", ":tabprevious<CR>", { desc = "Previous tab" })
map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<A-BS>", ":wincmd j | :q<CR>", { desc = "Close lower window" })
map("n", "<S-q>", "<cmd>bwipeout<CR>", { desc = "Close buffer" })
map("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize up" })
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize down" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize left" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize right" })
map("n", "J", "mzJ`z", { desc = "Join lines keep cursor" })
map("n", "<leader>q", "<CMD>q!<CR>", { desc = "Quit" })
map("n", "<leader>Q", "<CMD>qa!<CR>", { desc = "Quit all" })
map("n", "<leader><leader>w", "<cmd>w!<CR>", { desc = "Force write" })
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "<leader>u", "mzlblgueh~`z", { desc = "Toggle casing" })
map("n", "gD", vim.lsp.buf.definition, { desc = "LSP definition" })
map("n", "<leader>hn", "<cmd>set nowrap<CR>", { desc = "No wrap" })
map("n", "<leader>hw", "<cmd>set wrap<CR>", { desc = "Wrap" })
map("n", "<Leader><leader>s", "<CMD>!apy sync<CR>", { desc = "Sync apy" })
map("n", "<Leader><leader>m",
  "<CMD>source ~/Home/Scripts/VI/macros.vim<CR><CMD>lua vim.notify('Macros Updated')<CR>",
  { desc = "Reload macros" }
)

-- INSERT
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })
map("i", "JJ", "<Esc>", { desc = "Exit insert mode" })
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })

-- VISUAL
map("v", "<", "<gv", { desc = "Indent left keep selection" })
map("v", ">", ">gv", { desc = "Indent right keep selection" })
map("v", "H", "<gv", { desc = "Indent left keep selection" })
map("v", "L", ">gv", { desc = "Indent right keep selection" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("v", "p", '"_dP', { desc = "Paste without overwriting register" })
map("v", "<C-r>",
  "<CMD>lua require('search-replace')<CR><CMD>SearchReplaceSingleBufferVisualSelection<CR>",
  { desc = "Search replace selection in buffer" }
)
-- map("v", "<C-r>", "<CMD>SearchReplaceSingleBufferVisualSelection<CR>")
map("v", "<C-s>",
  "<CMD>lua require('search-replace')<CR><CMD>SearchReplaceWithinVisualSelection<CR>",
  { desc = "Search replace inside selection" }
)
map("v", "<C-c>",
  "<CMD>lua require('search-replace')<CR><CMD>SearchReplaceWithinVisualSelectionCWord<CR>",
  { desc = "Search replace word in selection" }
)
map("v", "/", [[<C-\><C-n>`</\%V]], { desc = "Search inside selection" })
map("v", "?", [[<C-\><C-n>`>?\%V]], { desc = "Backward search inside selection" })

-- VISUAL BLOCK
map("x", "<", "<gv", { desc = "Indent left keep selection" })
map("x", ">", ">gv", { desc = "Indent right keep selection" })
map("x", "H", "<gv", { desc = "Indent left keep selection" })
map("x", "L", ">gv", { desc = "Indent right keep selection" })
map("x", "J", ":m '>+1<CR>gv-gv", { desc = "Move block down" })
map("x", "K", ":m '<-2<CR>gv-gv", { desc = "Move block up" })
map("x", "V", "j", { desc = "Repeat visual line down" })
map("x", "/", [[<C-\><C-n>`</\%V]], { desc = "Search inside block" })
map("x", "?", [[<C-\><C-n>`>?\%V]], { desc = "Backward search inside block" })

-- TERMINAL
map("t", "<C-n><C-n>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
