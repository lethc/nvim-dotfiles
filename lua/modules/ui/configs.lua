local icons = require("configs.ui.icons")
local config = {}

config.catppuccin = function()
    local catppuccin_status_ok, catppuccin = pcall(require, "catppuccin")
    if not catppuccin_status_ok then
        return
    end
    catppuccin.setup({
        background = {
            light = "latte",
            dark = "mocha",
        },
        color_overrides = {
            latte = {
                rosewater = "#c14a4a",
                flamingo = "#c14a4a",
                red = "#c14a4a",
                maroon = "#c14a4a",
                pink = "#945e80",
                mauve = "#945e80",
                peach = "#c35e0a",
                yellow = "#b47109",
                green = "#6c782e",
                teal = "#4c7a5d",
                sky = "#4c7a5d",
                sapphire = "#4c7a5d",
                blue = "#45707a",
                lavender = "#45707a",
                text = "#654735",
                subtext1 = "#73503c",
                subtext0 = "#805942",
                overlay2 = "#8c6249",
                overlay1 = "#8c856d",
                overlay0 = "#a69d81",
                surface2 = "#bfb695",
                surface1 = "#d1c7a3",
                surface0 = "#e3dec3",
                base = "#f9f5d7",
                mantle = "#f0ebce",
                crust = "#e8e3c8",
            },
            mocha = {
                rosewater = "#ea6962",
                flamingo = "#ea6962",
                red = "#ea6962",
                maroon = "#ea6962",
                pink = "#d3869b",
                mauve = "#d3869b",
                peach = "#e78a4e",
                yellow = "#d8a657",
                green = "#a9b665",
                teal = "#89b482",
                sky = "#89b482",
                sapphire = "#89b482",
                blue = "#7daea3",
                lavender = "#7daea3",
                text = "#ebdbb2",
                subtext1 = "#d5c4a1",
                subtext0 = "#bdae93",
                overlay2 = "#a89984",
                overlay1 = "#928374",
                overlay0 = "#595959",
                surface2 = "#4d4d4d",
                surface1 = "#404040",
                surface0 = "#292929",
                base = "#1d2021",
                mantle = "#191b1c",
                crust = "#141617",
            },
        },
        transparent_background = false,
        show_end_of_buffer = false,
        integration_default = false,
        integrations = {
            barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
            cmp = true,
            gitsigns = true,
            hop = true,
            illuminate = { enabled = true },
            native_lsp = { enabled = true, inlay_hints = { background = true } },
            neogit = true,
            neotree = true,
            semantic_tokens = true,
            treesitter = true,
            treesitter_context = true,
            vimwiki = true,
            which_key = true,
            aerial = true,
            fidget = true,
            mason = true,
            neotest = true,
            dap_ui = true,
            telescope = {
                enabled = true,
                style = "nvchad",
            },
        },
        highlight_overrides = {
            all = function(colors)
                return {
                    CmpItemMenu = { fg = colors.surface2 },
                    CursorLineNr = { fg = colors.text },
                    FloatBorder = { bg = colors.base, fg = colors.surface0 },
                    GitSignsChange = { fg = colors.peach },
                    LineNr = { fg = colors.overlay0 },
                    LspInfoBorder = { link = "FloatBorder" },
                    NeoTreeDirectoryIcon = { fg = colors.subtext1 },
                    NeoTreeDirectoryName = { fg = colors.subtext1 },
                    NeoTreeFloatBorder = { link = "TelescopeResultsBorder" },
                    NeoTreeGitConflict = { fg = colors.red },
                    NeoTreeGitDeleted = { fg = colors.red },
                    NeoTreeGitIgnored = { fg = colors.overlay0 },
                    NeoTreeGitModified = { fg = colors.peach },
                    NeoTreeGitStaged = { fg = colors.green },
                    NeoTreeGitUnstaged = { fg = colors.red },
                    NeoTreeGitUntracked = { fg = colors.green },
                    NeoTreeIndent = { fg = colors.surface1 },
                    NeoTreeNormal = { bg = colors.mantle },
                    NeoTreeNormalNC = { bg = colors.mantle },
                    NeoTreeRootName = { fg = colors.subtext1, style = { "bold" } },
                    NeoTreeTabActive = { fg = colors.text, bg = colors.mantle },
                    NeoTreeTabInactive = { fg = colors.surface2, bg = colors.crust },
                    NeoTreeTabSeparatorActive = { fg = colors.mantle, bg = colors.mantle },
                    NeoTreeTabSeparatorInactive = { fg = colors.crust, bg = colors.crust },
                    NeoTreeWinSeparator = { fg = colors.base, bg = colors.base },
                    NormalFloat = { bg = colors.base },
                    Pmenu = { bg = colors.mantle, fg = "" },
                    PmenuSel = { bg = colors.surface0, fg = "" },
                    VertSplit = { bg = colors.base, fg = colors.surface0 },
                    WhichKeyFloat = { bg = colors.mantle },
                    YankHighlight = { bg = colors.surface2 },
                    FidgetTask = { fg = colors.subtext1 },
                    FidgetTitle = { fg = colors.peach },

                    IblIndent = { fg = colors.surface0 },
                    IblScope = { fg = colors.overlay0 },

                    Boolean = { fg = colors.mauve },
                    Number = { fg = colors.mauve },
                    Float = { fg = colors.mauve },

                    PreProc = { fg = colors.mauve },
                    PreCondit = { fg = colors.mauve },
                    Include = { fg = colors.mauve },
                    Define = { fg = colors.mauve },
                    Conditional = { fg = colors.red },
                    Repeat = { fg = colors.red },
                    Keyword = { fg = colors.red },
                    Typedef = { fg = colors.red },
                    Exception = { fg = colors.red },
                    Statement = { fg = colors.red },

                    Error = { fg = colors.red },
                    StorageClass = { fg = colors.peach },
                    Tag = { fg = colors.peach },
                    Label = { fg = colors.peach },
                    Structure = { fg = colors.peach },
                    Operator = { fg = colors.peach },
                    Title = { fg = colors.peach },
                    Special = { fg = colors.yellow },
                    SpecialChar = { fg = colors.yellow },
                    Type = { fg = colors.yellow, style = { "bold" } },
                    Function = { fg = colors.green, style = { "bold" } },
                    Delimiter = { fg = colors.subtext1 },
                    Ignore = { fg = colors.subtext1 },
                    Macro = { fg = colors.teal },

                    TSAnnotation = { fg = colors.mauve },
                    TSAttribute = { fg = colors.mauve },
                    TSBoolean = { fg = colors.mauve },
                    TSCharacter = { fg = colors.teal },
                    TSCharacterSpecial = { link = "SpecialChar" },
                    TSComment = { link = "Comment" },
                    TSConditional = { fg = colors.red },
                    TSConstBuiltin = { fg = colors.mauve },
                    TSConstMacro = { fg = colors.mauve },
                    TSConstant = { fg = colors.text },
                    TSConstructor = { fg = colors.green },
                    TSDebug = { link = "Debug" },
                    TSDefine = { link = "Define" },
                    TSEnvironment = { link = "Macro" },
                    TSEnvironmentName = { link = "Type" },
                    TSError = { link = "Error" },
                    TSException = { fg = colors.red },
                    TSField = { fg = colors.blue },
                    TSFloat = { fg = colors.mauve },
                    TSFuncBuiltin = { fg = colors.green },
                    TSFuncMacro = { fg = colors.green },
                    TSFunction = { fg = colors.green },
                    TSFunctionCall = { fg = colors.green },
                    TSInclude = { fg = colors.red },
                    TSKeyword = { fg = colors.red },
                    TSKeywordFunction = { fg = colors.red },
                    TSKeywordOperator = { fg = colors.peach },
                    TSKeywordReturn = { fg = colors.red },
                    TSLabel = { fg = colors.peach },
                    TSLiteral = { link = "String" },
                    TSMath = { fg = colors.blue },
                    TSMethod = { fg = colors.green },
                    TSMethodCall = { fg = colors.green },
                    TSNamespace = { fg = colors.yellow },
                    TSNone = { fg = colors.text },
                    TSNumber = { fg = colors.mauve },
                    TSOperator = { fg = colors.peach },
                    TSParameter = { fg = colors.text },
                    TSParameterReference = { fg = colors.text },
                    TSPreProc = { link = "PreProc" },
                    TSProperty = { fg = colors.blue },
                    TSPunctBracket = { fg = colors.text },
                    TSPunctDelimiter = { link = "Delimiter" },
                    TSPunctSpecial = { fg = colors.blue },
                    TSRepeat = { fg = colors.red },
                    TSStorageClass = { fg = colors.peach },
                    TSStorageClassLifetime = { fg = colors.peach },
                    TSStrike = { fg = colors.subtext1 },
                    TSString = { fg = colors.teal },
                    TSStringEscape = { fg = colors.green },
                    TSStringRegex = { fg = colors.green },
                    TSStringSpecial = { link = "SpecialChar" },
                    TSSymbol = { fg = colors.text },
                    TSTag = { fg = colors.peach },
                    TSTagAttribute = { fg = colors.green },
                    TSTagDelimiter = { fg = colors.green },
                    TSText = { fg = colors.green },
                    TSTextReference = { link = "Constant" },
                    TSTitle = { link = "Title" },
                    TSTodo = { link = "Todo" },
                    TSType = { fg = colors.yellow, style = { "bold" } },
                    TSTypeBuiltin = { fg = colors.yellow, style = { "bold" } },
                    TSTypeDefinition = { fg = colors.yellow, style = { "bold" } },
                    TSTypeQualifier = { fg = colors.peach, style = { "bold" } },
                    TSURI = { fg = colors.blue },
                    TSVariable = { fg = colors.text },
                    TSVariableBuiltin = { fg = colors.mauve },

                    ["@annotation"] = { link = "TSAnnotation" },
                    ["@attribute"] = { link = "TSAttribute" },
                    ["@boolean"] = { link = "TSBoolean" },
                    ["@character"] = { link = "TSCharacter" },
                    ["@character.special"] = { link = "TSCharacterSpecial" },
                    ["@comment"] = { link = "TSComment" },
                    ["@conceal"] = { link = "Grey" },
                    ["@conditional"] = { link = "TSConditional" },
                    ["@constant"] = { link = "TSConstant" },
                    ["@constant.builtin"] = { link = "TSConstBuiltin" },
                    ["@constant.macro"] = { link = "TSConstMacro" },
                    ["@constructor"] = { link = "TSConstructor" },
                    ["@debug"] = { link = "TSDebug" },
                    ["@define"] = { link = "TSDefine" },
                    ["@error"] = { link = "TSError" },
                    ["@exception"] = { link = "TSException" },
                    ["@field"] = { link = "TSField" },
                    ["@float"] = { link = "TSFloat" },
                    ["@function"] = { link = "TSFunction" },
                    ["@function.builtin"] = { link = "TSFuncBuiltin" },
                    ["@function.call"] = { link = "TSFunctionCall" },
                    ["@function.macro"] = { link = "TSFuncMacro" },
                    ["@include"] = { link = "TSInclude" },
                    ["@keyword"] = { link = "TSKeyword" },
                    ["@keyword.function"] = { link = "TSKeywordFunction" },
                    ["@keyword.operator"] = { link = "TSKeywordOperator" },
                    ["@keyword.return"] = { link = "TSKeywordReturn" },
                    ["@label"] = { link = "TSLabel" },
                    ["@math"] = { link = "TSMath" },
                    ["@method"] = { link = "TSMethod" },
                    ["@method.call"] = { link = "TSMethodCall" },
                    ["@namespace"] = { link = "TSNamespace" },
                    ["@none"] = { link = "TSNone" },
                    ["@number"] = { link = "TSNumber" },
                    ["@operator"] = { link = "TSOperator" },
                    ["@parameter"] = { link = "TSParameter" },
                    ["@parameter.reference"] = { link = "TSParameterReference" },
                    ["@preproc"] = { link = "TSPreProc" },
                    ["@property"] = { link = "TSProperty" },
                    ["@punctuation.bracket"] = { link = "TSPunctBracket" },
                    ["@punctuation.delimiter"] = { link = "TSPunctDelimiter" },
                    ["@punctuation.special"] = { link = "TSPunctSpecial" },
                    ["@repeat"] = { link = "TSRepeat" },
                    ["@storageclass"] = { link = "TSStorageClass" },
                    ["@storageclass.lifetime"] = { link = "TSStorageClassLifetime" },
                    ["@strike"] = { link = "TSStrike" },
                    ["@string"] = { link = "TSString" },
                    ["@string.escape"] = { link = "TSStringEscape" },
                    ["@string.regex"] = { link = "TSStringRegex" },
                    ["@string.special"] = { link = "TSStringSpecial" },
                    ["@symbol"] = { link = "TSSymbol" },
                    ["@tag"] = { link = "TSTag" },
                    ["@tag.attribute"] = { link = "TSTagAttribute" },
                    ["@tag.delimiter"] = { link = "TSTagDelimiter" },
                    ["@text"] = { link = "TSText" },
                    ["@text.danger"] = { link = "TSDanger" },
                    ["@text.diff.add"] = { link = "diffAdded" },
                    ["@text.diff.delete"] = { link = "diffRemoved" },
                    ["@text.emphasis"] = { link = "TSEmphasis" },
                    ["@text.environment"] = { link = "TSEnvironment" },
                    ["@text.environment.name"] = { link = "TSEnvironmentName" },
                    ["@text.literal"] = { link = "TSLiteral" },
                    ["@text.math"] = { link = "TSMath" },
                    ["@text.note"] = { link = "TSNote" },
                    ["@text.reference"] = { link = "TSTextReference" },
                    ["@text.strike"] = { link = "TSStrike" },
                    ["@text.strong"] = { link = "TSStrong" },
                    ["@text.title"] = { link = "TSTitle" },
                    ["@text.todo"] = { link = "TSTodo" },
                    ["@text.todo.checked"] = { link = "Green" },
                    ["@text.todo.unchecked"] = { link = "Ignore" },
                    ["@text.underline"] = { link = "TSUnderline" },
                    ["@text.uri"] = { link = "TSURI" },
                    ["@text.warning"] = { link = "TSWarning" },
                    ["@todo"] = { link = "TSTodo" },
                    ["@type"] = { link = "TSType" },
                    ["@type.builtin"] = { link = "TSTypeBuiltin" },
                    ["@type.definition"] = { link = "TSTypeDefinition" },
                    ["@type.qualifier"] = { link = "TSTypeQualifier" },
                    ["@uri"] = { link = "TSURI" },
                    ["@variable"] = { link = "TSVariable" },
                    ["@variable.builtin"] = { link = "TSVariableBuiltin" },

                    ["@lsp.type.class"] = { link = "TSType" },
                    ["@lsp.type.comment"] = { link = "TSComment" },
                    ["@lsp.type.decorator"] = { link = "TSFunction" },
                    ["@lsp.type.enum"] = { link = "TSType" },
                    ["@lsp.type.enumMember"] = { link = "TSProperty" },
                    ["@lsp.type.events"] = { link = "TSLabel" },
                    ["@lsp.type.function"] = { link = "TSFunction" },
                    ["@lsp.type.interface"] = { link = "TSType" },
                    ["@lsp.type.keyword"] = { link = "TSKeyword" },
                    ["@lsp.type.macro"] = { link = "TSConstMacro" },
                    ["@lsp.type.method"] = { link = "TSMethod" },
                    ["@lsp.type.modifier"] = { link = "TSTypeQualifier" },
                    ["@lsp.type.namespace"] = { link = "TSNamespace" },
                    ["@lsp.type.number"] = { link = "TSNumber" },
                    ["@lsp.type.operator"] = { link = "TSOperator" },
                    ["@lsp.type.parameter"] = { link = "TSParameter" },
                    ["@lsp.type.property"] = { link = "TSProperty" },
                    ["@lsp.type.regexp"] = { link = "TSStringRegex" },
                    ["@lsp.type.string"] = { link = "TSString" },
                    ["@lsp.type.struct"] = { link = "TSType" },
                    ["@lsp.type.type"] = { link = "TSType" },
                    ["@lsp.type.typeParameter"] = { link = "TSTypeDefinition" },
                    ["@lsp.type.variable"] = { link = "TSVariable" },
                }
            end,
            latte = function(colors)
                return {
                    IblIndent = { fg = colors.mantle },
                    IblScope = { fg = colors.surface1 },

                    LineNr = { fg = colors.surface1 },
                }
            end,
        },
    })
    vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, bg = "none", fg = "#eedaad" })
    vim.api.nvim_set_hl(0, "NavicText", { default = true, bg = "none", fg = "#eedaad" })
    vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, bg = "none", fg = "#eedaad" })
end

config.themery = function()
    local themery_status_ok, themery = pcall(require, "themery")
    if not themery_status_ok then
        return
    end
    themery.setup({
        themes = {
            "default",
            "canon",
            "catppuccin",
            "tokyonight",
            "evergarden",
            "pencil",
            "canonl",
            "no-clown-fiesta",
        },
        themeConfigFile = "~/.config/nvim/lua/configs/ui/colorscheme.lua", -- Described below
        livePreview = true, -- Apply theme while browsing. Default to true.
    })
end
config.lualine = function()
    local M = {}

    local status_ok, lualine = pcall(require, "lualine")
    if not status_ok then
        return
    end

    M.winbar_symbol = function()
        local navic = require("nvim-navic")

        if navic.is_available() then
            return navic.get_location()
        end

        local winwidth = vim.api.nvim_win_get_width(0)
        local filename = vim.fn.expand("%:.")

        local winbar = filename

        local rest_length = winwidth - #winbar - 3
        local ts_status = ""

        if rest_length > 5 then
            local size = math.floor(rest_length * 0.8)

            ts_status = require("nvim-treesitter").statusline({
                indicator_size = size,
                separator = "  ",
            }) or ""

            if ts_status ~= nil and ts_status ~= "" then
                ts_status = ts_status:gsub("%s+", " ")
            end
        end

        return ts_status
    end
    -- local status_lsp_ok, lsp_progress = pcall(require, "lsp-progress")
    -- if not status_lsp_ok then
    --   return
    -- end
    -- lsp_progress.setup({
    --   format = function(messages)
    --     local active_clients = vim.lsp.get_active_clients()
    --     local client_count = #active_clients
    --     if #messages > 0 then
    --       return " LSP:" .. client_count .. " " .. table.concat(messages, " ")
    --     end
    --     if #active_clients <= 0 then
    --       return " LSP:" .. client_count
    --     else
    --       local client_names = {}
    --       for i, client in ipairs(active_clients) do
    --         if client and client.name ~= "" then
    --           table.insert(client_names, "[" .. client.name .. "]")
    --           -- print("client[" .. i .. "]:" .. vim.inspect(client.name))
    --         end
    --       end
    --       return " LSP:" .. client_count .. " " .. table.concat(client_names, " ")
    --     end
    --   end,
    --   console_log = false,
    -- })
    -- vim.cmd([[
    -- augroup lualine_augroup
    --     autocmd!
    --     autocmd User LspProgressStatusUpdated lua require("lualine").refresh()
    -- augroup END
    -- ]])
    local spaces = {
        function()
            return " "
        end,
        padding = -1,
    }
    --LSP
    local branch = {
        "branch",
        icon = "",
        padding = { left = 0.1, right = 1 },
        separator = { left = "", right = "" },
    }
    local diff = {
        "diff",
        colored = true,
        symbols = icons.git_status,
        -- separator = { left = "", right = "" },
        separator = { left = "", right = "" },
    }
    local diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn", "hint", "info" },
        symbols = icons.diagnostics,
        colored = true,
        always_visible = false,
    }
    local custom_icons = {
        function()
            return ""
        end,
        separator = { left = "", right = "" },
    }
    local modes = {
        "mode",
        separator = { left = "", right = "" },
        padding = 0.8,
    }
    local location = {
        "location",
        separator = { left = "", right = "" },
        -- color = { bg = "#171717", fg = "#E1E1E1" },
        padding = 0.8,
    }
    local progress = {
        "progress",
        -- separator = { left = "", right = "" },
        -- color = { bg = "#171717", fg = "#E1E1E1" },
        padding = 0.8,
    }
    local function getWords()
        if vim.bo.filetype == "tex" or vim.bo.filetype == "txt" or vim.bo.filetype == "markdown" then
            if vim.fn.wordcount().visual_words == 1 then
                return tostring(vim.fn.wordcount().visual_words) .. " word"
            elseif not (vim.fn.wordcount().visual_words == nil) then
                return tostring(vim.fn.wordcount().visual_words) .. " words"
            else
                return tostring(vim.fn.wordcount().words) .. " words"
            end
        else
            return ""
        end
    end
    local function num()
        return vim.fn.tabpagenr()
    end

    lualine.setup({
        options = {
            globalstatus = true,
            icons_enabled = true,
            theme = "canon",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                tabline = {
                    "alpha",
                    "dashboard",
                    "Outline",
                    "NvimTree",
                    "starter",
                    "Trouble",
                    "qf",
                    "NeogitStatus",
                    "NeogitCommitMessage",
                    "NeogitPopup",
                },
                statusline = {
                    "starter",
                    "alpha",
                    "dashboard",
                    "Outline",
                    -- "NvimTree",
                },
            },
            always_divide_middle = true,
        },
        sections = {
            lualine_a = {
                custom_icons,
                modes,
            },
            lualine_b = {},
            lualine_c = {
                spaces,
                branch,
                -- { "filetype", icon_only = true, separator = "",                                               padding = {
                --   left = 1, right = 0 } },
                -- { "filename", path = 1,         symbols = { modified = "  ", readonly = "", unnamed = "" } },
                diff,
                diagnostics,
                -- { "require('lsp-progress').progress()" },
                -- num,
                -- { require("NeoComposer.ui").status_recording },
            },
            lualine_x = {
                "filetype",
                {
                    function()
                        return "󰣞"
                    end,
                },
                {
                    "filename",
                    path = 1,
                    show_modified_status = false, -- Shows a symbol next to the tab name if the file has been modified.
                    -- symbols = icons.file_status_symbol,
                    symbols = {
                        modified = "[󰗧]", -- Text to show when the buffer is modified
                        alternate_file = "#", -- Text to show to identify the alternate file
                        directory = "", -- Text to show when the buffer is a directory
                    },
                },
                { getWords },
            },
            lualine_y = {},
            lualine_z = {
                {
                    "tabs",
                    mode = 0,
                    show_modified_status = true, -- Shows a symbol next to the tab name if the file has been modified.
                    -- tabs_color = {
                    --     active = "lualine_a_normal",
                    --     -- active = {
                    --     --   fg = "#E1E1E1";
                    --     --   bg = "#323232";
                    --     -- },
                    --     inactive = "lualine_b_normal",
                    -- },
                    -- separator = { left = "", right = "" },
                    separator = { left = "", right = "" },
                    symbols = { modified = " +", removed = " -" }, -- Changes the symbols used by the diff.
                },
                {
                    function()
                        return "󰓩"
                    end,
                },
                location,
                {
                    function()
                        return "  "
                    end,
                    -- separator = { left = "", right = "" },
                    -- color = { bg = "#171717", fg = "#E1E1E1" },
                    padding = 0.1,
                },
                progress,
                {
                    function()
                        -- return "%P%L"
                        return " 󰗚  %L "
                    end,
                    -- separator = { left = "", right = "" },
                    -- color = { bg = "#171717", fg = "#E1E1E1" },
                    padding = 0.3,
                },
            },
        },
        tabline = {
            lualine_a = {
                { "filetype", icon_only = true },
                { "filename", path = 0, symbols = icons.file_status_symbol, separator = { right = " " } },
                -- separator = { left = "", right = " " },
            },
            lualine_c = {
                M.winbar_symbol,
            },
            lualine_x = {
                function()
                    return " "
                end,
                -- this is to avoid annoying highlight (high contrast color)
                -- when no winbar_symbol, diagnostics and diff is available.
                -- { "diagnostics", sources = { "nvim_diagnostic" } },
                -- "diff",
                {
                    require("noice").api.statusline.mode.get,
                    cond = require("noice").api.statusline.mode.has,
                    color = { fg = "#F4BF75" },
                },
                -- "g:mpv_visualizer",
                "g:mpv_title",
                -- "g:mpv_percent",
                {
                    function()
                        return " 󰲸 "
                    end,
                    color = "black",
                    on_click = require("mpv").toggle_player,
                },
            },
        },
    })
end
config.nvim_notify = function()
    local notify_status_ok, notify = pcall(require, "notify")
    if not notify_status_ok then
        return
    end
    vim.notify = notify
    notify.setup({
        background_colour = "NotifyBackground",
        render = "default",
        stages = "slide",
        max_width = "75",
        max_height = "25",
        minimum_width = "55",
        minimum_height = "10",
        fps = 30,
        icons = {
            DEBUG = " ",
            ERROR = " ",
            INFO = " ",
            TRACE = " ",
            WARN = " ",
        },
        level = 2,
        timeout = 1000,
        top_down = true,
    })
    vim.cmd("command! Message :lua require('notify').print_history()<CR>")
end
config.nvim_noice = function()
    local noice_status_ok, noice = pcall(require, "noice")
    if not noice_status_ok then
        return
    end
    noice.setup({
        cmdline = {
            enabled = true, -- enables the Noice cmdline UI
            view = "cmdline", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
            opts = {}, -- global options for the cmdline. See section on views
            format = {
                cmdline = { pattern = "^:", icon = "", lang = "vim" },
                search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
                help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
                input = {}, -- Used by input()
            },
        },
        messages = {
            enabled = true, -- enables the Noice messages UI
            view = "notify", -- default view for messages
            view_error = "notify", -- view for errors
            view_warn = "notify", -- view for warnings
            view_history = "split", -- view for :messages
            view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
        },
        popupmenu = {
            enabled = true, -- enables the Noice popupmenu UI
            backend = "cmp", -- backend to use to show regular cmdline completions, alternative nui
            kind_icons = {}, -- set to `false` to disable icons
        },
        -- redirect = {
        --   view = "popup",
        --   filter = { event = "msg_show" },
        -- },
        commands = {
            history = {
                view = "split",
                opts = { enter = true, format = "details" },
                filter = {
                    any = {
                        { event = "notify" },
                        { error = true },
                        { warning = true },
                        { event = "msg_show", kind = { "" } },
                        { event = "lsp", kind = "message" },
                    },
                },
            },
            last = {
                view = "popup",
                opts = { enter = true, format = "details" },
                filter = {
                    any = {
                        { event = "notify" },
                        { error = true },
                        { warning = true },
                        { event = "msg_show", kind = { "" } },
                        { event = "lsp", kind = "message" },
                    },
                },
                filter_opts = { count = 1 },
            },
            errors = {
                view = "popup",
                opts = { enter = true, format = "details" },
                filter = { error = true },
                filter_opts = { reverse = true },
            },
        },
        notify = {
            enabled = true, -- false?
            view = "notify",
        },
        lsp = {
            progress = {
                enabled = true,
                format = "lsp_progress",
                format_done = "lsp_progress_done",
                throttle = 1000 / 30, -- frequency to update lsp progress message
                view = "mini",
            },
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true, -- false?
            },
            hover = {
                enabled = true,
                silent = false, -- set to true to not show a message if hover is not available
                view = nil, -- when nil, use defaults from documentation
                opts = {}, -- merged with defaults from documentation
            },
            signature = {
                enabled = true,
                auto_open = {
                    enabled = true,
                    trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
                    luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
                    throttle = 50, -- Debounce lsp signature help request by 50ms
                },
                view = nil, -- when nil, use defaults from documentation
                opts = {}, -- merged with defaults from documentation
            },
            message = {
                enabled = true,
                view = "notify",
                opts = {},
            },
            documentation = {
                view = "hover",
                opts = {
                    lang = "markdown",
                    replace = true,
                    render = "plain",
                    format = { "{message}" },
                    win_options = { concealcursor = "n", conceallevel = 3 },
                },
            },
        },
        markdown = {
            hover = {
                ["|(%S-)|"] = vim.cmd.help, -- vim help links
                ["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
            },
            highlights = {
                ["|%S-|"] = "@text.reference",
                ["@%S+"] = "@parameter",
                ["^%s*(Parameters:)"] = "@text.title",
                ["^%s*(Return:)"] = "@text.title",
                ["^%s*(See also:)"] = "@text.title",
                ["{%S-}"] = "@parameter",
            },
        },
        health = {
            checker = true, -- Disable if you don't want health checks to run
        },
        smart_move = {
            -- noice tries to move out of the way of existing floating windows.
            enabled = true, -- you can disable this behaviour here
            -- add any filetypes here, that shouldn't trigger smart move.
            excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
        },
        presets = {
            bottom_search = false, -- use a classic bottom cmdline for search
            command_palette = false, -- position the cmdline and popupmenu together
            long_message_to_split = false, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
        views = {}, ---@see section on views
        routes = {
            {
                filter = {
                    event = "msg_show",
                    any = {
                        { find = "%d+L, %d+B" },
                        { find = "; after #%d+" },
                        { find = "; before #%d+" },
                    },
                },
                view = "mini",
            },
        }, --- @see section on routes
        status = {}, --- @see section on statusline components
        format = {}, --- @see section on formatting
    })
end
config.indetscope = function()
    local indentscope_status_ok, indentscope = pcall(require, "mini.indentscope")
    if not indentscope_status_ok then
        return
    end
    indentscope.setup({
        symbol = "│",
    })
end
config.indent_blankline = function()
    local indent_status_ok, indent_blankline = pcall(require, "ibl")
    if not indent_status_ok then
        return
    end

    -- RAINBOW-DELIMITERS.NVIM INTEGRATION
    local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
    }
    local hooks = require("ibl.hooks")
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)

    -- local rainbow_delimiters = require 'rainbow-delimiters'
    --
    -- vim.g.rainbow_delimiters = {
    --   strategy = {
    --       [''] = rainbow_delimiters.strategy['global'],
    --       vim = rainbow_delimiters.strategy['local'],
    --   },
    --   query = {
    --       [''] = 'rainbow-delimiters',
    --       lua = 'rainbow-blocks',
    --   },
    --   highlight = highlight
    -- }

    indent_blankline.setup({
        -- indent = { highlight = highlight }
        scope = { highlight = highlight },
    })
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end
config.neoscroll_nvim = function()
    local neoscroll_status_ok, neoscroll = pcall(require, "neoscroll")
    if not neoscroll_status_ok then
        return
    end
    local t = {} -- Syntax: t[keys] = {function, {function arguments}}
    t["<S-k>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
    t["<S-j>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
    require("neoscroll.config").set_mappings(t)
    neoscroll.setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
        performance_mode = false, -- Disable "Performance Mode" on all buffers.
    })
end
config.nvim_ufo = function()
    local ufo_status_ok, ufo = pcall(require, "ufo")
    if not ufo_status_ok then
        return
    end
    local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local totalLines = vim.api.nvim_buf_line_count(0)
        local foldedLines = endLnum - lnum
        local suffix = (" 󰁂 %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
                table.insert(newVirtText, chunk)
            else
                chunkText = truncate(chunkText, targetWidth - curWidth)
                local hlGroup = chunk[2]
                table.insert(newVirtText, { chunkText, hlGroup })
                chunkWidth = vim.fn.strdisplaywidth(chunkText)
                -- str width returned from truncate() may less than 2nd argument, need padding
                if curWidth + chunkWidth < targetWidth then
                    suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
                end
                break
            end
            curWidth = curWidth + chunkWidth
        end
        local rAlignAppndx = math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
        suffix = (" "):rep(rAlignAppndx) .. suffix
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
    end
    ufo.setup({
        fold_virt_text_handler = handler,
        provider_selector = function(bufnr, filetype, buftype)
            return { "treesitter", "indent" }
        end,
        open_fold_hl_timeout = 150,
        close_fold_kinds_for_ft = {
            default = { "imports", "comment" },
            json = { "array" },
            c = { "comment", "region" },
        },
        preview = {
            win_config = {
                border = { "", "─", "", "", "", "─", "", "" },
                -- border = "rounded",
                winhighlight = "Normal:Folded",
                winblend = 0,
            },
            mappings = {
                scrollU = "<C-u>",
                scrollD = "<C-d>",
                jumpTop = "[",
                jumpBot = "]",
            },
        },
    })
    vim.keymap.set("n", "zR", require("ufo").openAllFolds)
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
    vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
    vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
    vim.keymap.set("n", "Z", function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
            -- choose one of coc.nvim and nvim lsp
            -- vim.fn.CocActionAsync("definitionHover") -- coc.nvim
            -- vim.lsp.buf.hover()
            vim.cmd([[ Lspsaga hover_doc ]])
        end
    end)
end
config.true_zen = function()
    local true_zen_status_ok, true_zen = pcall(require, "true-zen")
    if not true_zen_status_ok then
        return
    end
    true_zen.setup({
        modes = { -- configurations per mode
            ataraxis = {
                shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
                backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
                minimum_writing_area = { -- minimum size of main window
                    width = 90, --70
                    height = 44,
                },
                quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
                padding = { -- padding windows
                    left = 52,
                    right = 52,
                    top = 0,
                    bottom = 0,
                },
                callbacks = { -- run functions when opening/closing Ataraxis mode
                    open_pre = nil,
                    open_pos = nil,
                    close_pre = nil,
                    close_pos = nil,
                },
            },
            minimalist = {
                ignored_buf_types = { "nofile" }, -- save current options from any window except ones displaying these kinds of buffers
                options = { -- options to be disabled when entering Minimalist mode
                    number = false,
                    relativenumber = false,
                    showtabline = 0,
                    signcolumn = "no",
                    statusline = "",
                    cmdheight = 1,
                    laststatus = 0,
                    showcmd = false,
                    showmode = false,
                    ruler = false,
                    numberwidth = 1,
                },
                callbacks = { -- run functions when opening/closing Minimalist mode
                    open_pre = nil,
                    open_pos = nil,
                    close_pre = nil,
                    close_pos = nil,
                },
            },
            narrow = {
                --- change the style of the fold lines. Set it to:
                --- `informative`: to get nice pre-baked folds
                --- `invisible`: hide them
                --- function() end: pass a custom func with your fold lines. See :h foldtext
                folds_style = "informative",
                run_ataraxis = true, -- display narrowed text in a Ataraxis session
                callbacks = { -- run functions when opening/closing Narrow mode
                    open_pre = nil,
                    open_pos = nil,
                    close_pre = nil,
                    close_pos = nil,
                },
            },
            focus = {
                callbacks = { -- run functions when opening/closing Focus mode
                    open_pre = nil,
                    open_pos = nil,
                    close_pre = nil,
                    close_pos = nil,
                },
            },
        },
        integrations = {
            tmux = false, -- hide tmux status bar in (minimalist, ataraxis)
            kitty = { -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
                enabled = false,
                font = "+3",
            },
            twilight = true, -- enable twilight (ataraxis)
            lualine = true, -- hide nvim-lualine (ataraxis)
        },
    })
end
config.transparent = function()
    local transparent_status_ok, transparent = pcall(require, "transparent")
    if not transparent_status_ok then
        return
    end
    vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "ExtraGroup" })
    transparent.setup({
        groups = { -- table: default groups
            "Normal",
            "NormalNC",
            "Comment",
            "Constant",
            "Special",
            "Identifier",
            "Statement",
            "PreProc",
            "Type",
            "Underlined",
            "Todo",
            "String",
            "Function",
            "Conditional",
            "Repeat",
            "Operator",
            "Structure",
            "LineNr",
            "NonText",
            "SignColumn",
            "CursorLineNr",
            "EndOfBuffer",
        },
        extra_groups = {
            -- "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
            -- "NvimTreeNormal" -- NvimTree
        }, -- table: additional groups that should be cleared
        exclude_groups = {}, -- table: groups you don't want to clear
    })
end
config.alpha = function()
    local status_ok, alpha = pcall(require, "alpha")
    if not status_ok then
        return
    end
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
        -- [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
        -- [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
        -- [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
        -- [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
        -- [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
        -- [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
        -- [[                                                   ]],
        [[                                                              ]],
        [[                                                              ]],
        [[ ███╗   ███╗██╗   ██╗    ██╗  ██╗ ██████╗ ███╗   ███╗███████╗ ]],
        [[ ████╗ ████║╚██╗ ██╔╝    ██║  ██║██╔═══██╗████╗ ████║██╔════╝ ]],
        [[ ██╔████╔██║ ╚████╔╝     ███████║██║   ██║██╔████╔██║█████╗   ]],
        [[ ██║╚██╔╝██║  ╚██╔╝      ██╔══██║██║   ██║██║╚██╔╝██║██╔══╝   ]],
        [[ ██║ ╚═╝ ██║   ██║       ██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗ ]],
        [[ ╚═╝     ╚═╝   ╚═╝       ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝ ]],
        [[                                                              ]],
    }
    dashboard.section.buttons.val = {
        dashboard.button("h", "  Home", ":e ~/Home/Templates/Today.md<CR>"),
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
        dashboard.button("r", "󱎫  Recently used files", ":Telescope oldfiles <CR>"),
        dashboard.button("F", "󰚞  Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
        dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
        -- (function()
        --   local group = { type = "group", opts = { spacing = 0 } }
        --   group.val = {
        --     {
        --       type = "text",
        --       val = "Sessions",
        --       opts = {
        --         position = "center",
        --       },
        --     },
        --   }
        --   local path = vim.fn.stdpath("data") .. "/possession"
        --   local files = vim.split(vim.fn.glob(path .. "/*.json"), "\n")
        --   for i, file in pairs(files) do
        --     local basename = vim.fs.basename(file):gsub("%.json", "")
        --     local button =
        --         dashboard.button(tostring(i), "󰑓 " .. basename, "<cmd>PossessionLoad " .. basename .. "<cr>")
        --     table.insert(group.val, button)
        --   end
        --   return group
        -- end)(),
    }

    local function footer()
        -- NOTE: requires the fortune-mod package to work
        -- local handle = io.popen("fortune")
        -- local fortune = handle:read("*a")
        -- handle:close()
        -- return fortune
        return "~There's no place like Home~"
    end

    dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = "Keyword"
    dashboard.section.header.opts.hl = "Identifier"
    dashboard.section.buttons.opts.hl = "Character"

    dashboard.opts.opts.noautocmd = true
    -- vim.cmd([[autocmd User AlphaReady echo 'ready']])
    alpha.setup(dashboard.opts)
end

return config
