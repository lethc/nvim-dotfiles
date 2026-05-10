return {
    "https://github.com/fresh2dev/zellij.vim.git",
    lazy = false,
    config = function()
        vim.cmd([[
                let g:zellij_navigator_no_default_mappings = 1
                nnoremap <silent> <C-h> :ZellijNavigateLeft<CR>
                nnoremap <silent> <C-j> :ZellijNavigateDown<CR>
                nnoremap <silent> <C-k> :ZellijNavigateUp<CR>
                nnoremap <silent> <C-l> :ZellijNavigateRight<CR>
            ]])
    end,
}
