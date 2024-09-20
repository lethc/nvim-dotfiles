local M = {}

M.options = function()
    local N = {
        title = true,
        titlelen = 0,
        titlestring = '%{expand("%:p")} [%{mode()}]',
        guifont = { "Maple Mono NF:h10" },                                   -- the font used in graphical neovim applications
        -- guifont = { "SF Mono:h11" }, -- the font used in graphical neovim applications
        backup = false,
        -- laststatus = 0, -- hide the bottom bar
        swapfile = false,
        termguicolors = true,
        colorcolumn = "100",
        errorbells = true,
        visualbell = true,
        fileformats = "unix,mac,dos",
        -- magic = true,
        encoding = "utf-8",
        fileencoding = "utf-8", -- the encoding written to a file
        clipboard = "unnamedplus", -- allows neovim to access the system clipboard
        wildignorecase = true,
        wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
        autochdir = false, -- Change dictory automatically
        mouse = "nv", --:h mapmode
        mousefocus = true,
        mousemoveevent = true,
        mousescroll = { "ver:1", "hor:6" },
        foldtext = "",
        mousemodel = "extend",
        pumheight = 10, -- pop up menu height
        cursorline = true, -- highlight the current line
        number = true, -- set numbered lines
        relativenumber = true, -- set relative numbered lines
        numberwidth = 4, -- set number column width to 2 {default 4}
        hlsearch = true, -- highlight all matches on previous search pattern
        ignorecase = true, -- ignore case in search patterns
        completeopt = { "menuone", "noselect" },
        conceallevel = 2, -- so that `` is visible in markdown files
        showmode = false, -- we don't need to see things like -- INSERT -- anymore
        showtabline = 0, -- always show tabs or buffers
        smartcase = true, -- smart case
        smartindent = true, -- make indenting smarter again
        tabstop = 4, -- insert 2 spaces for a tab
        shiftwidth = 4, -- the number of spaces inserted for each indentation
        splitbelow = true, -- force all horizontal splits to go below current window
        splitright = true, -- force all vertical splits to go to the right of current window
        timeout = true,
        timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
        undofile = true, -- enable persistent undo
        updatetime = 100, -- faster completion (4000ms default)
        writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
        expandtab = true, -- convert tabs to spaces
        signcolumn = "yes:2", -- always show the sign column, otherwise it would shift the text each time
        wrap = true, -- display lines as one long line
        linebreak = true, -- companion to wrap, don't split words
        breakindent = true, -- break indentation for long lines
        breakindentopt = { shift = 2 },
        -- showbreak = "↳ ", -- character for line break
        showbreak = "  ↳ ", -- character for line break
        scrolloff = 3, --99(cursor in center)                                       -- minimal number of screen lines to keep above and below the cursor
        sidescrolloff = 8, -- minimal number of screen columns either side of cursor if wrap is `false`
        shortmess = { c = true, W = true, a = true, F = true, I = true, s = true }, --controls which messages are displayed in the status line, c = about completions
        spell = false,
        spelllang = { "en_gb", "es" },
        guicursor = "n-v-c-sm:block,i-ci-ve:ver25-blinkwait300-blinkon200-blinkoff150,r-cr-o:hor20-blinkwait300-blinkon200-blinkoff150",
        foldcolumn = "0", -- '1' is not bad
        foldlevel = 99, -- Using ufo provider need a large value, feel free to decrease the value
        foldlevelstart = 99,
        foldenable = true,
        -- cmdheight = 2, -- more space in the neovim command line for displaying messages
        -- inccommand = "split", --search-replace
        -- fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
    }

    for k, v in pairs(N) do
        vim.opt[k] = v
    end
    return N
end

return M
