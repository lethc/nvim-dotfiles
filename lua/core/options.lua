local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt
-- a = true,
-- c = true,
-- I = true,
-- F = true, -- Don't give file info when editing a file, NOTE: this breaks autocommand messages
-- o = true, -- file-read message overwrites previous
-- O = true, -- file-read message overwrites previous
-- s = true,
-- t = true, -- truncate file messages at start
-- T = true, -- truncate non-file messages in middle
-- A = true, -- ignore annoying swap file messages
-- W = true, -- Don't show [w] or written when writing
opt.shortmess = "acIFoOstTAW"

-- Timings
opt.timeout = true
opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.ttimeoutlen = 10
opt.updatetime = 300 -- faster completion (4000ms default)

-- Window splitting and buffers
opt.splitkeep = "screen"
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.eadirection = "hor"
opt.switchbuf = "useopen,uselast"

-- Fold
opt.foldlevelstart = 99
opt.foldcolumn = "0" -- '1' is not bad
opt.foldenable = true
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldtext = ""
opt.cursorline = true -- highlight the current line
opt.cursorcolumn = false
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Wild
opt.wildcharm = ("\t"):byte()
opt.wildmode = "list:full"
opt.wildignorecase = true
opt.wildignore =
	".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**"
opt.wildoptions = { "pum", "fuzzy" }
-- pumblend = 0, -- Make popup window translucent

-- Display
opt.conceallevel = 2 -- so that `` is visible in markdown files
opt.linebreak = true -- companion to wrap, don't split words
opt.breakindent = true -- break indentation for long lines
opt.breakindentopt = { shift = 2 }
opt.signcolumn = "yes:2" -- always show the sign column, otherwise it would shift the text each time
-- opt.showbreak = "↳ " -- character for line break
opt.showbreak = "  ↳ " -- character for line break

-- List chars
vim.opt.list = true
vim.opt.listchars = {
	tab = "│ ",
	extends = "›",
	precedes = "‹",
	-- tab = "  ", -- Alternatives: '▷▷',
	-- extends = "…", -- Alternatives: … » ›
	-- precedes = "░", -- Alternatives: … « ‹
	-- trail = "•", -- BULLET (U+2022, UTF-8: E2 80 A2)
}

-- Indentation
opt.wrap = true -- display lines as one long line
opt.wrapmargin = 2
opt.shiftround = true
opt.expandtab = true -- convert tabs to spaces
opt.tabstop = 4 -- insert 2 spaces for a tab
opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
-- opt.textwidth = 99,
-- opt.autoindent = true,

opt.pumheight = 10 -- pop up menu height
opt.confirm = true
opt.completeopt = { "menuone", "noselect" }
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.autowriteall = true -- automatically :write before running commands and changing files
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.laststatus = 0 -- hide the bottom bar
opt.termguicolors = true
opt.guifont = "Illinois Mono:h16" -- the font used in graphical neovim applications
opt.guicursor =
	"n-v-c-sm:block,i-ci-ve:ver25-blinkwait300-blinkon200-blinkoff150,r-cr-o:hor20-blinkwait300-blinkon200-blinkoff150"
opt.cursorlineopt = "both"
opt.title = true
opt.titlelen = 0
opt.titlestring = '%{expand("%:p")} [%{mode()}]'
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
-- opt.guifont = { "SF Mono:h11" } -- the font used in graphical neovim applications

-- Utilities
opt.sessionoptions = {
	"globals",
	"buffers",
	"curdir",
	"winpos",
	"winsize",
	"help",
	"tabpages",
	"terminal",
}
opt.viewoptions = { "cursor", "folds" } -- save/restore just these (with `:{mk,load}view`)
opt.virtualedit = "block" -- allow cursor to move where there is no text in visual block mode

-- Jumplist
opt.jumpoptions = { "stack" } -- make the jumplist behave like a browser stack

-- Backups and Swaps
opt.backup = false
opt.undofile = true -- enable persistent undo
opt.swapfile = false

-- Match and search
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true -- smart case
opt.wrapscan = true -- Searches wrap around the end of the file
opt.smartindent = true
opt.smoothscroll = true
-- opt.scrolloff = 1 --99(cursor in center)                                       -- minimal number of screen lines to keep above and below the cursor
-- opt.sidescrolloff = 8 -- minimal number of screen columns either side of cursor if wrap is `false`
-- opt.sidescroll = 1

-- Spelling
opt.spell = false
opt.spelllang = { "en_gb", "es" }
-- opt.colorcolumn = "100"
opt.errorbells = true
opt.visualbell = true
opt.fileformats = { "unix", "mac", "dos" }
-- opt.magic = true

-- Mouse
-- mouse = "nv", --:h mapmode
-- mousefocus = true,
-- mousemoveevent = true,
opt.mousescroll = { "ver:1", "hor:6" }
-- mousemodel = "extend",

opt.encoding = "utf-8"
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.autochdir = false -- Change dictory automatically
opt.number = false -- set numbered lines
opt.relativenumber = false -- set relative numbered lines
opt.numberwidth = 4 -- set number column width to 2 {default 4}
opt.showtabline = 0 -- always show tabs or buffers
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.cmdheight = 0 -- more space in the neovim "cmdline" for displaying messages (0 hides it)
opt.undolevels = 10000
-- inccommand = "split", --search-replace
-- fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
