local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<BS>", ":b#<CR>", { silent = true })
vim.keymap.set("n", "<Tab>", ":b#<CR>", { silent = true })

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Open a new buffer
keymap("n", "<C-n>", "<cmd>enew<CR>", opts)

-- Color
keymap("n", "<A-p>", "<cmd>PasteImg<CR>", opts)

-- keymap("n", "<C-l>", "<cmd>:set spell! spelllang={'eng_gb', 'es'}<CR>", opts)

--Run Selection
-- keymap("n", "<C-,>", "<cmd>%SnipRun<CR>", opts)

-- Registers keybindings
-- keymap("n", "<C-m>", "<cmd>exe 'normal @c'<CR>", opts)

-- ciw
-- vim.keymap.set(“n”, “<A-j>”, "ciw”, opts)
-- keymap("n", "<cr>", "ciw", opts)
keymap("n", "<C-c>", "<cmd>normal! ciw<cr>a", opts)
keymap("n", "t", "s", opts)
keymap("n", "J", "mzJ`z", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Move text up and down
-- keymap("v", "J", ":m .+1<CR>==", opts)
-- keymap("v", "K", ":m .-2<CR>==", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-J>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-K>", ":move '<-2<CR>gv-gv", opts)

-- Term Mode --
keymap("t", "<Tab><Tab>", "<C-\\><C-n>", opts)

-- Plugins and more --

keymap("v", "<C-r>", "<CMD>SearchReplaceSingleBufferVisualSelection<CR>", opts)
keymap("v", "<C-s>", "<CMD>SearchReplaceWithinVisualSelection<CR>", opts)
keymap("v", "<C-c>", "<CMD>SearchReplaceWithinVisualSelectionCWord<CR>", opts)
keymap("n", "<leader>q", "<CMD>q!<CR>", opts)
keymap("n", "<leader>Q", "<CMD>qa!<CR>", opts)
