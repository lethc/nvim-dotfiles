local M = {}

M.options = function()
    local N = {
        -- Message output on vim actions
        shortmess = {
            t = true, -- truncate file messages at start
            A = true, -- ignore annoying swap file messages
            o = true, -- file-read message overwrites previous
            O = true, -- file-read message overwrites previous
            T = true, -- truncate non-file messages in middle
            F = true, -- Don't give file info when editing a file, NOTE: this breaks autocommand messages
            s = true,
            c = true,
            W = true, -- Don't show [w] or written when writing
            a = true,
            I = true,
        }, --controls which messages are displayed in the status line, c = about completions

        -- Timings
        timeout = true,
        timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
        ttimeoutlen = 10,
        updatetime = 300, -- faster completion (4000ms default)

        -- Window splitting and buffers
        splitkeep = "screen",
        splitbelow = true, -- force all horizontal splits to go below current window
        splitright = true, -- force all vertical splits to go to the right of current window
        eadirection = "hor",
        switchbuf = "useopen,uselast",

        -- Fold
        foldlevelstart = 99,
        foldcolumn = "0", -- '1' is not bad
        foldenable = true,
        foldlevel = 99, -- Using ufo provider need a large value, feel free to decrease the value
        cursorline = true, -- highlight the current line
        cursorcolumn = false,

        -- Wild
        wildcharm = ("\t"):byte(),
        wildmode = "list:full",
        wildignorecase = true,
        wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
        wildoptions = { "pum", "fuzzy" },
        -- pumblend = 0, -- Make popup window translucent

        -- Display
        conceallevel = 2, -- so that `` is visible in markdown files
        linebreak = true, -- companion to wrap, don't split words
        breakindent = true, -- break indentation for long lines
        breakindentopt = { shift = 2 },
        signcolumn = "yes:2", -- always show the sign column, otherwise it would shift the text each time
        -- showbreak = "↳ ", -- character for line break
        showbreak = "  ↳ ", -- character for line break

        -- List chars
        list = true,
        listchars = {
            eol = nil,
            -- tab = "  ", -- Alternatives: '▷▷',
            tab = "│ ",
            -- extends = "…", -- Alternatives: … » ›
            -- precedes = "░", -- Alternatives: … « ‹
            extends = "›", -- Alternatives: … »
            precedes = "‹", -- Alternatives: … «
            -- trail = "•", -- BULLET (U+2022, UTF-8: E2 80 A2)
        },

        -- Indentation
        wrap = true, -- display lines as one long line
        wrapmargin = 2,
        -- textwidth = 99,
        -- autoindent = true,
        shiftround = true,
        expandtab = true, -- convert tabs to spaces
        tabstop = 4, -- insert 2 spaces for a tab
        shiftwidth = 4, -- the number of spaces inserted for each indentation
        ---
        pumheight = 10, -- pop up menu height
        confirm = true,
        completeopt = { "menuone", "noselect" },
        hlsearch = true, -- highlight all matches on previous search pattern
        autowriteall = true, -- automatically :write before running commands and changing files
        clipboard = "unnamedplus", -- allows neovim to access the system clipboard
        laststatus = 0, -- hide the bottom bar
        termguicolors = true,
        guifont = { "Maple Mono NF:h10" }, -- the font used in graphical neovim applications
        -- guifont = { "SF Mono:h11" }, -- the font used in graphical neovim applications
        guicursor = "n-v-c-sm:block,i-ci-ve:ver25-blinkwait300-blinkon200-blinkoff150,r-cr-o:hor20-blinkwait300-blinkon200-blinkoff150",
        cursorlineopt = { "both" },
        title = true,
        titlelen = 0,
        titlestring = '%{expand("%:p")} [%{mode()}]',
        showmode = false, -- we don't need to see things like -- INSERT -- anymore

        -- Utilities
        sessionoptions = {
            "globals",
            "buffers",
            "curdir",
            "winpos",
            "winsize",
            "help",
            "tabpages",
            "terminal",
        },
        viewoptions = { "cursor", "folds" }, -- save/restore just these (with `:{mk,load}view`)
        virtualedit = "block", -- allow cursor to move where there is no text in visual block mode

        -- Jumplist
        jumpoptions = { "stack" }, -- make the jumplist behave like a browser stack

        -- Backups and Swaps
        backup = false,
        undofile = true, -- enable persistent undo
        swapfile = false,

        -- Match and search
        ignorecase = true, -- ignore case in search patterns
        smartcase = true, -- smart case
        wrapscan = true, -- Searches wrap around the end of the file
        smartindent = true, -- make indenting smarter again
        scrolloff = 3, --99(cursor in center)                                       -- minimal number of screen lines to keep above and below the cursor
        sidescrolloff = 8, -- minimal number of screen columns either side of cursor if wrap is `false`
        sidescroll = 1,

        -- Spelling
        spell = false,
        spelllang = { "en_gb", "es" },

        colorcolumn = "100",
        errorbells = true,
        visualbell = true,
        fileformats = "unix,mac,dos",
        -- magic = true,

        -- Mouse
        mouse = "nv", --:h mapmode
        mousefocus = true,
        mousemoveevent = true,
        mousescroll = { "ver:1", "hor:6" },
        mousemodel = "extend",

        encoding = "utf-8",
        fileencoding = "utf-8", -- the encoding written to a file
        autochdir = false, -- Change dictory automatically
        number = true, -- set numbered lines
        relativenumber = true, -- set relative numbered lines
        numberwidth = 4, -- set number column width to 2 {default 4}
        showtabline = 0, -- always show tabs or buffers
        writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
        cmdheight = 1, -- more space in the neovim "cmdline" for displaying messages (0 hides it)
        -- inccommand = "split", --search-replace
        -- fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
        foldtext = "",
    }

    for k, v in pairs(N) do
        vim.opt[k] = v
    end
    return N
end

return M
