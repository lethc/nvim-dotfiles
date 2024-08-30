local funcs = require("configs.core.functs")
local opt = require("configs.base.options")
local keymaps = require("configs.base.keymaps")

local configs = {}
local opts = { noremap = true, silent = true }
opt.options()
configs["base_keymaps"] = function()
    funcs.keymaps("n", opts, keymaps.normal)
    funcs.keymaps("i", opts, keymaps.insert)
    funcs.keymaps("v", opts, keymaps.visual)
    funcs.keymaps("x", opts, keymaps.visual_block)
    funcs.keymaps("t", opts, keymaps.terminal)
end
configs["remember_folds"] = function()
    local function remember(mode)
        -- avoid complications with some special filetypes
        local ignoredFts = {
            "TelescopePrompt",
            "DressingSelect",
            "DressingInput",
            "toggleterm",
            "gitcommit",
            "replacer",
            "harpoon",
            "help",
            "qf",
            "minifiles",
        }
        if vim.tbl_contains(ignoredFts, vim.bo.filetype) or vim.bo.buftype ~= "" or not vim.bo.modifiable then
            return
        end

        if mode == "save" then
            vim.cmd("mkview 1")
        else
            pcall(function()
                vim.cmd("loadview 1")
            end) -- pcall, since new files have no view yet
        end
    end
    vim.api.nvim_create_autocmd("BufWinLeave", {
        pattern = "?*",
        callback = function()
            remember("save")
        end,
    })
    vim.api.nvim_create_autocmd("BufWinEnter", {
        pattern = "?*",
        callback = function()
            remember("load")
        end,
    })
end
configs["auto_commands"] = function()
    vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd BufWinEnter * :set fillchars=eob:\ ,fold:\ ,foldopen:,foldsep:\ ,foldclose:
    autocmd FileType qf set nobuflisted
    " autocmd BufEnter * silent! lcd %:p:h "Change directory
    " autocmd VimLeave * set guicursor=a:ver90-blinkwait300-blinkon200-blinkoff150 augroup
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal nowrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | set laststatus=0 | set noruler | autocmd BufUnload <buffer> set showtabline=2
    " autocmd User AlphaReady set noruler | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _zshAsBash
    autocmd!
    autocmd BufWinEnter,FileType * silent! if &ft == 'zsh' | set filetype=sh | endif
  augroup end

  " autgroup _ufo "Trying to disable sagaoutline uggly ufo lines, need more research
  "   autocmd!
  "   autocmd BufReadPost,BufNewFile sagaoutline :UfoDisable :UfoDetach
  " autgroup end

  "augroup remember_folds
  "  autocmd!
  "  autocmd BufWinLeave * mkview
  "  autocmd BufWinEnter * silent! loadview
  "augroup end
]])
end

return configs
