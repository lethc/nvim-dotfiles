local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- General settings
local general = augroup("GeneralSettings", { clear = true })

autocmd("FileType", {
  group = general,
  pattern = { "qf", "help", "man", "lspinfo" },
  callback = function()
    vim.keymap.set("n", "q", ":close<CR>", { buffer = true, silent = true })
  end,
})

autocmd("TextYankPost", {
  group = general,
  desc = "Highlight yanked text",
  callback = function()
    vim.hl.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

autocmd("BufWinEnter", {
  group = general,
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

autocmd("BufWinEnter", {
  group = general,
  callback = function()
    vim.opt.fillchars = {
      eob = " ",
      fold = " ",
      foldopen = "",
      foldsep = " ",
      foldclose = "",
    }
  end,
})

autocmd("FileType", {
  group = general,
  pattern = "qf",
  command = "set nobuflisted",
})

autocmd("InsertEnter", {
  group = general,
  command = "set colorcolumn=117",
})

-- Git
local git = augroup("GitSettings", { clear = true })

autocmd("FileType", {
  group = git,
  pattern = "gitcommit",
  command = "setlocal wrap spell",
})

-- Markdown
local markdown = augroup("MarkdownSettings", { clear = true })

autocmd("FileType", {
  group = markdown,
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = false
    vim.opt_local.spell = true
    vim.opt_local.textwidth = 116
    vim.opt_local.shiftwidth = 2
  end,
})

-- Auto resize
local resize = augroup("AutoResize", { clear = true })

autocmd("VimResized", {
  group = resize,
  command = "tabdo wincmd =",
})

-- Alpha
local alpha = augroup("AlphaSettings", { clear = true })

autocmd("User", {
  group = alpha,
  pattern = "AlphaReady",
  command = "set showtabline=0 laststatus=0 noruler",
})

-- Zsh as sh
local zsh = augroup("ZshAsSh", { clear = true })

autocmd({ "BufWinEnter", "FileType" }, {
  group = zsh,
  callback = function()
    if vim.bo.filetype == "zsh" then
      vim.bo.filetype = "sh"
    end
  end,
})

-- Signcolumn
local signcolumn = augroup("AlwaysSigncolumn", { clear = true })

autocmd({ "BufEnter", "WinEnter" }, {
  group = signcolumn,
  callback = function()
    local ft = vim.bo.filetype
    if not ft:match("nofile")
      and not ft:match("prompt")
      and ft ~= "neo-tree"
      and ft ~= "alpha"
      and ft ~= "minifiles"
    then
      vim.opt_local.signcolumn = "yes:2"
    end
  end,
})

autocmd("WinLeave", {
  group = signcolumn,
  command = "set signcolumn=yes:2",
})

-- Obsidian template
local obsidian = augroup("ObsidianAutoTemplate", { clear = true })

autocmd("BufReadPost", {
  group = obsidian,
  pattern = "*.md",
  callback = function(args)
    local path = vim.fn.expand("%:p")
    if path:match("^" .. vim.fn.expand("~/Home/"))
      and vim.fn.line("$") == 1
      and vim.fn.getline(1) == ""
    then
      vim.cmd("Obsidian template template_idea")

      autocmd("CursorMoved", {
        buffer = args.buf,
        once = true,
        callback = function()
          vim.cmd("normal! G")
        end,
      })
    end
  end,
})
