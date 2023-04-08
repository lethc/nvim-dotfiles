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

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Open a new tab
keymap("n", "<C-n>", "<cmd>tabnew<CR>", opts)

-- Save files
keymap("i", "<C-s>", "<cmd>w<CR>", opts)
keymap("n", "<C-s>", "<cmd>w<CR>", opts)

-- Quit nvim
keymap("i", "<C-q>", "<cmd>q<CR>", opts)
keymap("n", "<C-q>", "<cmd>q<CR>", opts)

-- Quit quick tab nvim (Save)
keymap("i", "<C-sq>", "<cmd>wq!<CR>", opts)
keymap("n", "<C-sq>", "<cmd>wq!<CR>", opts)

-- Quit quick all nvim (NO Save)
keymap("i", "<C-aq>", "<cmd>qa!<CR>", opts)
keymap("n", "<C-aq>", "<cmd>qa!<CR>", opts)

-- Color
keymap("n", "<C-x>", "<cmd>ColorHighlight<CR>", opts)

-- TZ-Ataraxiz (Focus mode)
keymap("n", "<C-i>", "<cmd>TZAtaraxis<CR>", opts)

-- keymap("n", "<C-l>", "<cmd>:set spell! spelllang={'eng_gb', 'es'}<CR>", opts)

-- Quick Terminal
--keymap("i", "<C-i>", "<cmd>ToggleTerm<CR>", opts)
--keymap("n", "<C-i>", "<cmd>ToggleTerm<CR>", opts)

-- Execute file
--JAVA
--keymap("i", "<C-,>", "<cmd>split | terminal java %<CR>", opts)
--keymap("n", "<C-,>", "<cmd>split | terminal java %<CR>", opts)
--PYTHON
--keymap("i", "<A-,>", "<cmd>!python3 %:p <CR>", opts)
--keymap("i", "<A-,>", "<cmd>split | terminal python3 %<CR>", opts)
--keymap("n", "<A-,>", "<cmd>split | terminal python3 %<CR>", opts)

--Execute files with Floaterm
--FloatermNew --autoclose=0 gcc % -o %< && ./%<
keymap("n", "<C-,>", "<cmd>FloatermNew --autoclose=0 python3 % -o %<CR>", opts)
keymap("n", "<A-,>", "<cmd>FloatermNew --autoclose=0 java % -o %<CR>", opts)
keymap("n", "<C-->", "<cmd>FloatermNew --autoclose=0 node % -o %<CR>", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Registers
-- let @c = $a; ,let @h = ciw"€üR"

-- Registers keybindings
keymap("n", "<C-m>", "<cmd>exe 'normal @c'<CR>", opts)
