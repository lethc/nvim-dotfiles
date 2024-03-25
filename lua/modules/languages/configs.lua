local icons = require("configs.ui.icons")
local config = {}

config.nvim_treesitter = function()
    local nvim_treesitter_configs_status_ok, nvim_treesitter_configs = pcall(require, "nvim-treesitter.configs")
    if not nvim_treesitter_configs_status_ok then
        return
    end

    -- syntax for mdx files (astro)
    -- local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
    -- ft_to_parser.mdx = "markdown"

    nvim_treesitter_configs.setup({
        -- ensure_installed = "all", -- one of "all" or a list of languages --vim, vim-doc
        ensure_installed = {
            "c",
            "lua",
            "query",
            "regex",
            "bash",
            "markdown",
            "markdown_inline",
            "sql",
            "css",
            "html",
            "typescript",
            "tsx",
            "hyprlang",
            "rust",
            "python",
            "php",
            "json",
            -- "latex",
            "cpp",
            "javascript",
            "java",
            "xml",
            "yaml",
            "yuck",
            "http",
            "csv",
            "c",
            "c_sharp",
            "go",
            "git_config",
            "gitcommit",
            "gitignore",
            "git_rebase",
            "diff",
            "cmake",
            "toml",
            "vim",
            "vimdoc",
            "scss",
        },
        ignore_install = { "latex" }, -- List of parsers to ignore installing
        auto_install = true,
        highlight = {
            enable = true, -- false will disable the whole extension
            additional_vim_regex_highlighting = { "markdown" },
            -- disable = { "markdown" },-- list of language that will be disabled
            -- disable = function(lang, bufnr) -- Disable in files with more than 5K
            --   return vim.api.nvim_buf_line_count(bufnr) > 5000
            -- end,
            disable = function(lang, bufnr)
                return vim.fn.strlen(vim.fn.getbufoneline(bufnr, 1)) > 300
                    or vim.fn.getfsize(vim.fn.expand("%")) > 1024 * 1024
            end,
        },
        indent = {
            enable = true,
        },
        autopairs = {
            enable = true,
        },
        autotag = {
            enable = true,
        },
        rainbow = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn", -- set to `false` to disable one of the mappings
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["ii"] = "@conditional.inner",
                    ["ai"] = "@conditional.outer",
                    ["il"] = "@loop.inner",
                    ["al"] = "@loop.outer",
                    ["at"] = "@comment.outer",
                    -- You can also use captures from other query groups like `locals.scm`
                    ["as"] = "@scope",
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>oa"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>oA"] = "@parameter.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
                goto_next = {
                  [']i'] = "@conditional.inner",
                  [']a'] = "@conditional.outer",
                },
                goto_previous = {
                  ['[i'] = "@conditional.inner",
                  ['[a'] = "@conditional.outer",
                }
            },
        },
    })

    vim.filetype.add({
        pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
    })
    -- vim.filetype.add {
    --   pattern = { [".*.conf"] = "hyprlang" },
    -- }
end
config.mason_nvim = function()
    local mason_status_ok, mason = pcall(require, "mason")
    if not mason_status_ok then
        return
    end
    local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
    if not mason_lspconfig_status_ok then
        return
    end
    local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
    if not lspconfig_status_ok then
        return
    end
    local mason_tool_installer_status_ok, mason_tool_installer = pcall(require, "mason-tool-installer")
    if not mason_tool_installer_status_ok then
        return
    end
    local servers = {
        "lua_ls",
        "cssls",
        "cssmodules_ls",
        "emmet_ls",
        "html",
        "tsserver",
        "pyright", --"To Debug, https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Python"
        "bashls", --"To Debug, activate: bash-debug-adapter"
        "jsonls",
        -- "yamlls",
        "jdtls", --"to Debug, activate: java-test, java-debug-adapter"
        -- "intelephense",
        "phpactor",
        "gopls",
        "rust_analyzer",
        "clangd", --"to Debug, Install in your system codelldb"
        "texlab",
        "ltex",
        "marksman",
        "tailwindcss",
        "astro",
        "csharp_ls",
        -- "blade-formatter",
        -- "php-debug-adapter",
        -- "pint",
    }
    local settings = {
        ui = {
            border = "rounded",
            icons = icons.mason,
        },
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4,
    }
    -- local handlers = { --handler for mason_lspconfig
    --   function(server_name) -- default handler (optional)
    --     require("lspconfig")[server_name].setup({})
    --   end,
    -- }
    mason.setup(settings)
    mason_lspconfig.setup({
        ensure_installed = servers,
        automatic_installation = true,
        -- handlers = handlers,
    })
    mason_tool_installer.setup({
        ensure_installed = {
            "prettier",
            "prettierd",
            "stylua",
            "isort",
            "black",
            "pylint",
            "eslint_d",
        },
    })
    local opts = {}
    for _, server in pairs(servers) do
        opts = {
            on_attach = require("modules.languages.handlers").on_attach,
            capabilities = require("modules.languages.handlers").capabilities,
        }
        server = vim.split(server, "@")[1]
        local require_ok, conf_opts = pcall(require, "modules.languages.settings." .. server)
        if require_ok then
            opts = vim.tbl_deep_extend("force", conf_opts, opts)
        end
        -- if server == "rust_analyzer" then
        --   local rust_opts = require("plugins.lsp.settings.rust")
        --   -- opts = vim.tbl_deep_extend("force", rust_opts, opts)
        --   local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
        --   if not rust_tools_status_ok then
        --     return
        --   end
        --
        --   rust_tools.setup(rust_opts)
        --   goto continue
        -- end
        lspconfig[server].setup(opts)
        -- ::continue::
    end
    local signs = {
        { name = "DiagnosticSignError", text = " " },
        { name = "DiagnosticSignWarn", text = " " },
        { name = "DiagnosticSignHint", text = "󰌵" },
        { name = "DiagnosticSignInfo", text = "" },
    }
    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end
    local lsp_config = {
        virtual_text = false, -- disable virtual text
        signs = { active = signs }, -- show signs
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }
    vim.diagnostic.config(lsp_config)
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end
config.lsp_saga = function()
    local lsp_saga_status_ok, lsp_saga = pcall(require, "lspsaga")
    if not lsp_saga_status_ok then
        return
    end
    lsp_saga.setup({
        ui = {
            -- This option only works in Neovim 0.9
            title = true,
            -- Border type can be single, double, rounded, solid, shadow.
            lines = { "┗", "┣", "┃", "━", "┏" },
            border = "single",
            devicon = true,
            actionfix = " ",
            imp_sign = "󰳛 ",
            expand = "",
            collapse = "",
            code_action = "",
            -- incoming = "󰏷 ",
            -- outgoing = "󰏻 ",
            -- hover = " ",
            kind = {},
        },
        symbol_in_winbar = {
            enable = false,
            separator = " ",
            ignore_patterns = {},
            hide_keyword = true,
            show_file = true,
            folder_level = 2,
            respect_root = false,
            color_mode = true,
        },
        code_action = {
            num_shortcut = true,
            show_server_name = false,
            extend_gitsigns = false,
        },
        definition = {
            width = 0.6,
            height = 0.5,
            diagnostic_only_current = false,
            keys = {
                edit = "<C-x>o",
                vsplit = "<C-x>v",
                split = "<C-x>i",
                tabe = "<C-x>t",
                quit = { "q", "<C-x>q", "<ESC>" },
                close = "<C-x>k",
            },
        },
        finder = {
            silent = true,
            default = "def+ref+imp",
            layout = "float",
            filter = {},
            -- max_height = 0.6,
            keys = {
                shuttle = "[]",
                toggle_or_open = { "<CR>", "o" },
                -- jump_to = "e",
                vsplit = "v",
                split = "i",
                tabe = "t",
                tabnew = "n",
                quit = { "q", "<C-x>q", "<Esc>" },
                close = { "<C-x>k" },
            },
        },
    })
    -- vim.wo.winbar = require("lspsaga.symbol.winbar"):get_bar()
    require("lspsaga.symbol.winbar").get_bar()
    local keymap = vim.keymap.set

    -- Diagnostic jump with filters such as only jumping to an error
    keymap("n", "[e", function()
        require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end)
    keymap("n", "]e", function()
        require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
    end)

    -- Hover Doc
    -- If there is no hover doc,
    -- there will be a notification stating that
    -- there is no information available.
    -- To disable it just use ":Lspsaga hover_doc ++quiet"
    -- Pressing the key twice will enter the hover window
    keymap("n", "H", "<cmd>Lspsaga hover_doc<CR>")

    -- Floating terminal
    -- keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
end
config.nvim_navbuddy = function()
    local navbuddy = require("nvim-navbuddy")
    local actions = require("nvim-navbuddy.actions")

    navbuddy.setup({
        window = {
            border = "single", -- "rounded", "double", "solid", "none"
            -- or an array with eight chars building up the border in a clockwise fashion
            -- starting with the top-left corner. eg: { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }.
            size = "60%", -- Or table format example: { height = "40%", width = "100%"}
            position = "50%", -- Or table format example: { row = "100%", col = "0%"}
            scrolloff = nil, -- scrolloff value within navbuddy window
            sections = {
                left = {
                    size = "20%",
                    border = nil, -- You can set border style for each section individually as well.
                },
                mid = {
                    size = "40%",
                    border = nil,
                },
                right = {
                    -- No size option for right most section. It fills to
                    -- remaining area.
                    border = nil,
                    preview = "leaf", -- Right section can show previews too.
                    -- Options: "leaf", "always" or "never"
                },
            },
        },
        node_markers = {
            enabled = true,
            icons = {
                leaf = "  ",
                leaf_selected = " → ",
                branch = " ",
            },
        },
        -- icons = icons.navbuddy,
        use_default_mappings = true, -- If set to false, only mappings set
        -- by user are set. Else default
        -- mappings are used for keys
        -- that are not set by user
        mappings = {
            ["<esc>"] = actions.close(), -- Close and cursor to original location
            ["q"] = actions.close(),

            ["j"] = actions.next_sibling(), -- down
            ["k"] = actions.previous_sibling(), -- up

            ["h"] = actions.parent(), -- Move to left panel
            ["l"] = actions.children(), -- Move to right panel
            ["0"] = actions.root(), -- Move to first panel

            ["v"] = actions.visual_name(), -- Visual selection of name
            ["V"] = actions.visual_scope(), -- Visual selection of scope

            ["y"] = actions.yank_name(), -- Yank the name to system clipboard "+
            ["Y"] = actions.yank_scope(), -- Yank the scope to system clipboard "+

            ["i"] = actions.insert_name(), -- Insert at start of name
            ["I"] = actions.insert_scope(), -- Insert at start of scope

            ["a"] = actions.append_name(), -- Insert at end of name
            ["A"] = actions.append_scope(), -- Insert at end of scope

            ["r"] = actions.rename(), -- Rename currently focused symbol

            ["d"] = actions.delete(), -- Delete scope

            ["f"] = actions.fold_create(), -- Create fold of current scope
            ["F"] = actions.fold_delete(), -- Delete fold of current scope

            ["c"] = actions.comment(), -- Comment out current scope

            ["<enter>"] = actions.select(), -- Goto selected symbol
            ["o"] = actions.select(),

            ["J"] = actions.move_down(), -- Move focused node down
            ["K"] = actions.move_up(), -- Move focused node up

            ["t"] = actions.telescope({ -- Fuzzy finder at current level.
                layout_config = { -- All options that can be
                    height = 0.60, -- passed to telescope.nvim's
                    width = 0.60, -- default can be passed here.
                    prompt_position = "top",
                    preview_width = 0.50,
                },
                layout_strategy = "horizontal",
            }),

            ["g?"] = actions.help(), -- Open mappings help window
        },
        lsp = {
            auto_attach = true, -- If set to true, you don't need to manually use attach function
            preference = nil, -- list of lsp server names in order of preference
        },
        source_buffer = {
            follow_node = true, -- Keep the current node in focus on the source buffer
            highlight = true, -- Highlight the currently focused node
            reorient = "smart", -- "smart", "top", "mid" or "none"
            scrolloff = nil, -- scrolloff value when navbuddy is open
        },
    })
end
config.nvim_navic = function()
    local nvim_navic_status_ok, nvim_navic = pcall(require, "nvim-navic")
    if not nvim_navic_status_ok then
        return
    end
    nvim_navic.setup({
        -- icons = icons.lsp,
        highlight = true,
        separator = " " .. icons.common.separator,
        lsp = {
            auto_attach = true, -- If set to true, you don't need to manually use attach function
            preference = { "rust-analyzer" }, -- list of lsp server names in order of preference
            -- preference = { "rust_analyzer", }, -- Mason server
        },
    })
    vim.g.navic_silence = true
end
config.trouble_nvim = function()
    local trouble_status_ok, trouble = pcall(require, "trouble")
    if not trouble_status_ok then
        return
    end
    trouble.setup({
        position = "bottom", -- position of the list can be: bottom, top, left, right
        height = 10, -- height of the trouble list when position is top or bottom
        width = 50, -- width of the list when position is left or right
        icons = true, -- use devicons for filenames
        mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
        severity = nil, -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
        fold_open = "", -- icon used for open folds
        fold_closed = "", -- icon used for closed folds
        group = true, -- group results by file
        padding = true, -- add an extra new line on top of the list
        action_keys = {
            -- key mappings for actions in the trouble list
            -- map to {} to remove a mapping, for example:
            -- close = {},
            close = "q", -- close the list
            cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
            refresh = "r", -- manually refresh
            jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
            open_split = { "<c-x>" }, -- open buffer in new split
            open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
            open_tab = { "<c-t>" }, -- open buffer in new tab
            jump_close = { "o" }, -- jump to the diagnostic and close the list
            toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
            switch_severity = "s", -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
            toggle_preview = "P", -- toggle auto_preview
            hover = "K", -- opens a small popup with the full multiline message
            preview = "p", -- preview the diagnostic location
            close_folds = { "zM", "zm" }, -- close all folds
            open_folds = { "zR", "zr" }, -- open all folds
            toggle_fold = { "zA", "za" }, -- toggle fold of current file
            previous = "k", -- previous item
            next = "j", -- next item
        },
        indent_lines = true, -- add an indent guide below the fold icons
        auto_open = false, -- automatically open the list when you have diagnostics
        auto_close = false, -- automatically close the list when you have no diagnostics
        auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
        auto_fold = false, -- automatically fold a file trouble list at creation
        auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
        signs = {
            -- icons / text used for a diagnostic
            error = "󰅚",
            warning = "",
            hint = "󰌶",
            information = "",
            other = "󰗡",
        },
        use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
    })
end
config.rust_tools = function()
    local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
    if not rust_tools_status_ok then
        return
    end
    rust_tools.setup({
        server = {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            on_attach = function(_, bufnr)
                -- Hover actions
                vim.keymap.set("n", "<leader>u", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
                -- Code action groups
                vim.keymap.set("n", "<Leader>x", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
            end,
        },
        tools = {
            on_initialized = function()
                vim.cmd([[
                  augroup RustLSP
                    autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                    autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                    autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
                  augroup END
                ]])
            end,
            hover_actions = {
                auto_focus = true,
            },
        },
    })
end
config.dap = function()
    local dap_status_ok, dap = pcall(require, "dap")
    if not dap_status_ok then
        return
    end

    local dap_ui_status_ok, dapui = pcall(require, "dapui")
    if not dap_ui_status_ok then
        return
    end
    -- dapui.setup()
    dapui.setup({
        icons = icons.dap_ui.base,
        mappings = {
            -- Use a table to apply multiple mappings
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            edit = "e",
            repl = "r",
            toggle = "t",
        },
        -- Expand lines larger than the window
        -- Requires >= 0.7
        expand_lines = vim.fn.has("nvim-0.7"),
        -- Layouts define sections of the screen to place windows.
        -- The position can be "left", "right", "top" or "bottom".
        -- The size specifies the height/width depending on position. It can be an Int
        -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
        -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
        -- Elements are the elements shown in the layout (in order).
        -- Layouts are opened in order so that earlier layouts take priority in window sizing.
        layouts = {
            {
                elements = {
                    -- Elements can be strings or table with id and size keys.
                    { id = "scopes", size = 0.25 },
                    "breakpoints",
                    "stacks",
                    "watches",
                },
                size = 40, -- 40 columns
                position = "right",
            },
            {
                elements = {
                    "repl",
                    "console",
                },
                size = 0.25, -- 25% of total lines
                position = "bottom",
            },
        },
        floating = {
            max_height = nil, -- These can be integers or a float between 0 and 1.
            max_width = nil, -- Floats will be treated as percentage of your screen.
            border = "single", -- Border style. Can be "single", "double" or "rounded"
            mappings = {
                close = { "q", "<Esc>" },
            },
        },
        windows = { indent = 1 },
        render = {
            max_type_length = nil, -- Can be integer or nil.
        },
    })
    vim.fn.sign_define(
        "DapBreakpoint",
        { text = icons.dap_ui.sign.breakpoint, texthl = "DiagnosticSignError", linehl = "", numhl = "" }
    )
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
    end

    -- require("dap-go").setup()
    require("dap-python").setup("~/env/.virtualenvs/debugpy/bin/python")

    ------------- DAP cpp, c, rust -------------------
    dap.adapters.lldb = {
        type = "executable",
        command = "/usr/bin/codelldb", -- adjust as needed, must be absolute path
        name = "lldb",
    }

    dap.configurations.cpp = {
        {
            name = "Launch",
            type = "lldb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {},

            -- 💀
            -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
            --
            --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
            --
            -- Otherwise you might get the following error:
            --
            --    Error on launch: Failed to attach to the target process
            --
            -- But you should be aware of the implications:
            -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
            -- runInTerminal = false,
        },
    }

    -- If you want to use this for Rust and C, add something like this:

    dap.configurations.c = dap.configurations.cpp
    -- dap.configurations.rust = dap.configurations.cpp

    ------------- Bash -------------------

    dap.adapters.bashdb = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/bash-debug-adapter",
        name = "bashdb",
    }

    dap.configurations.sh = {
        {
            type = "bashdb",
            request = "launch",
            name = "Launch file",
            showDebugOutput = true,
            pathBashdb = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
            pathBashdbLib = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
            trace = true,
            file = "${file}",
            program = "${file}",
            cwd = "${workspaceFolder}",
            pathCat = "cat",
            pathBash = "/bin/bash",
            pathMkfifo = "mkfifo",
            pathPkill = "pkill",
            args = {},
            env = {},
            terminalKind = "integrated",
        },
    }

    ------------- PHP -------------------
    dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { "~/.dap-server/vscode-php-debug/out/phpDebug.js" },
    }

    dap.configurations.php = {
        {
            type = "php",
            request = "launch",
            name = "Listen for Xdebug",
            port = 9000,
        },
    }
end
config.nvim_jdtls = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if not status_cmp_ok then
        return
    end
    capabilities.textDocument.completion.completionItem.snippetSupport = false
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    local status, jdtls = pcall(require, "jdtls")
    if not status then
        return
    end
    -- Determine OS
    local home = os.getenv("HOME")
    if vim.fn.has("mac") == 1 then
        WORKSPACE_PATH = home .. "/workspace/"
        CONFIG = "mac"
    elseif vim.fn.has("unix") == 1 then
        WORKSPACE_PATH = home .. "/workspace/"
        CONFIG = "linux"
    else
        print("Unsupported system")
    end
    -- Find root of project
    local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
    local root_dir = require("jdtls.setup").find_root(root_markers)
    if root_dir == "" then
        return
    end
    local extendedClientCapabilities = jdtls.extendedClientCapabilities
    extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = WORKSPACE_PATH .. project_name
    local bundles = {}
    JAVA_DAP_ACTIVE = true
    if JAVA_DAP_ACTIVE then
        vim.list_extend(
            bundles,
            vim.split(vim.fn.glob(home .. "/.local/share/nvim/mason/packages/java-test/extension/server/*.jar"), "\n")
        )
        -- vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.dap-server/vscode-java-test/server/*.jar"), "\n"))
        vim.list_extend(
            bundles,
            vim.split(
                vim.fn.glob(
                    home
                        .. "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
                    -- home .. "/.dap-server/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
                ),
                "\n"
            )
        )
    end
    local config = {
        -- The command that starts the language server
        -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
        cmd = {
            "java", -- or '/path/to/java11_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.
            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.protocol=true",
            "-Dlog.level=ALL",
            "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
            "-Xms1g",
            "--add-modules=ALL-SYSTEM",
            "--add-opens",
            "java.base/java.util=ALL-UNNAMED",
            "--add-opens",
            "java.base/java.lang=ALL-UNNAMED",
            "-jar",
            vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
            -- Must point to the                                                     Change this to
            -- eclipse.jdt.ls installation                                           the actual version
            "-configuration",
            home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. CONFIG,
            -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
            -- Must point to the                      Change to one of `linux`, `win` or `mac`
            -- eclipse.jdt.ls installation            Depending on your system.
            -- See `data directory configuration` section in the README
            "-data",
            workspace_dir,
        },

        on_attach = require("modules.languages.handlers").on_attach,
        capabilities = capabilities,
        -- This is the default if not provided, you can remove it. Or adjust as needed.
        -- One dedicated LSP server & client will be started per unique root_dir
        root_dir = root_dir,

        -- Here you can configure eclipse.jdt.ls specific settings
        -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        -- or https://github.com/redhat-developer/vscode-java#supported-vs-code-settings
        -- for a list of options
        settings = {
            java = {
                -- jdt = {
                --   ls = {
                --     vmargs = "-XX:+UseParallelGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -Dsun.zip.disableMemoryMapping=true -Xmx1G -Xms100m"
                --   }
                -- },
                eclipse = {
                    downloadSources = true,
                },
                configuration = {
                    updateBuildConfiguration = "interactive",
                },
                maven = {
                    downloadSources = true,
                },
                implementationsCodeLens = {
                    enabled = true,
                },
                referencesCodeLens = {
                    enabled = true,
                },
                references = {
                    includeDecompiledSources = true,
                },
                inlayHints = {
                    parameterNames = {
                        enabled = "all", -- literals, all, none
                    },
                },
                format = {
                    enabled = false,
                    -- settings = {
                    --   profile = "asdf"
                    -- }
                },
            },
            signatureHelp = { enabled = true },
            completion = {
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*",
                    "org.hamcrest.CoreMatchers.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.mockito.Mockito.*",
                },
            },
            contentProvider = { preferred = "fernflower" },
            extendedClientCapabilities = extendedClientCapabilities,
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                },
                useBlocks = true,
            },
        },
        flags = {
            allow_incremental_sync = true,
        },
        -- Language server `initializationOptions`
        -- You need to extend the `bundles` with paths to jar files
        -- if you want to use additional eclipse.jdt.ls plugins.
        --
        -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
        --
        -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
        init_options = {
            bundles = bundles,
            -- bundles = {
            --   vim.fn.glob(" "/.config/nvim/vscode-java-test/server/*.jar"om.microsoft.java.debug.plugin-*.jar", 1)
            -- },
        },
    }
    -- require('jdtls').setup_dap()

    vim.cmd(
        "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)"
    )
    vim.cmd(
        "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)"
    )
    vim.cmd("command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()")
    -- vim.cmd "command! -buffer JdtJol lua require('jdtls').jol()"
    vim.cmd("command! -buffer JdtBytecode lua require('jdtls').javap()")
    -- vim.cmd "command! -buffer JdtJshell lua require('jdtls').jshell()"
    -- This starts a new client & server,
    -- or attaches to an existing client & server depending on the `root_dir`.
    jdtls.start_or_attach(config)
end
config.null_ls = function()
    local null_ls_status_ok, null_ls = pcall(require, "null-ls")
    if not null_ls_status_ok then
        return
    end
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics
    null_ls.setup({
        debug = false,
        sources = {
            formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
            formatting.black.with({ extra_args = { "--fast" } }),
            formatting.stylua,
            formatting.shfmt,
            formatting.google_java_format,
            -- diagnostics.flake8
        },
    })
end
config.conform_nvim = function()
    local conform_nvim_status_ok, conform_nvim = pcall(require, "conform")
    if not conform_nvim_status_ok then
        return
    end
    require("conform.formatters.prettierd").args = {
        "--jsx-single-quote",
        "--single-quote",
        -- "--no-semi",
        "--tab-width=4",
        "$FILENAME",
    }
    local util = require("conform.util")
    local java_google_format = {
        meta = {
            url = "https://github.com/google/google-java-format",
            description = "google-java-format is a program that reformats Java source code to comply with Google Java Style.",
        },
        command = "google-java-format",
        args = { "-" },
        stdin = true,
    }
    conform_nvim.setup({
        formatters_by_ft = {
            -- astro = { "prettierd" },
            -- mdx = { "prettierd" },
            javascript = { "prettierd" },
            typescript = { "prettierd" },
            javascriptreact = { "prettierd" },
            typescriptreact = { "prettierd" },
            lua = { "stylua" },
            java = { "java_google_format" },
            json = { "jq" },
            cmake = { "cmake_format" },
            sh = { "shfmt" },
            yaml = { "yamlfmt" },
            markdown = { "prettier" },
            -- html = { "prettier" },
            python = { "isort", "black" },
            blade = { "blade-formatter" },
            php = { "pint" },
            css = { "prettierd" },
            html = { "prettierd" },
        },
        -- format_on_save = {
        --   -- These options will be passed to conform.format()
        --   timeout_ms = 500,
        --   lsp_fallback = true,
        -- },
        formatters = {
            java_google_format = java_google_format,
            pint = {
                meta = {
                    url = "https://github.com/laravel/pint",
                    description = "Laravel Pint is an opinionated PHP code style fixer for minimalists. Pint is built on top of PHP-CS-Fixer and makes it simple to ensure that your code style stays clean and consistent.",
                },
                command = util.find_executable({
                    vim.fn.stdpath("data") .. "/mason/bin/pint",
                    "vendor/bin/pint",
                }, "pint"),
                args = { "$FILENAME" },
                stdin = false,
            },
        },
        -- format_on_save = {
        -- 	-- I recommend these options. See :help conform.format for details.
        -- 	lsp_fallback = true,
        -- 	timeout_ms = 500,
        -- },
    })
    -- require("conform").formatters.my_formatter = {
    --   command = "google-java-format",
    -- }
    -- vim.keymap.set("", "<leader>fm", function()
    --   require("conform").format({ async = true, lsp_fallback = true })
    -- end, { desc = "Format Buffer" })
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   pattern = "*",
    --   callback = function(args)
    --     require("conform").format({ buf = args.buf })
    --   end,
    -- })
end
return config
