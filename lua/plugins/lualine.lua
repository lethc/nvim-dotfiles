return{
 'nvim-lualine/lualine.nvim',
 config = function()

    local status_ok, lualine = pcall(require, "lualine")
    -- local conditions = require "user.conditions"
    if not status_ok then
      return
    end

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = { error = " ", warn = " " },
      colored = false,
      update_in_insert = false,
      always_visible = true,
    }

    local diff = {
      "diff",
      colored = false,
      symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
      cond = hide_in_width
    }

    local mode = {
      "mode",
      fmt = function(str)
        return "-- " .. str .. " --"
      end,
    }

    local filetype = {
      "filetype",
      icons_enabled = true,
      --icon = nil,
    }

    local branch = {
      "branch",
      icons_enabled = true,
      icon = "",
    }

    local location = {
      "location",
      padding = 0,
    }

    local progress2 = {
      "progress",
      fmt = function()
        return "%P/%L"
      end,
      color = {},
    }

    local lsp = {
      function(msg)
        msg = msg or "LS Inactive"
        local buf_clients = vim.lsp.buf_get_clients()
        if next(buf_clients) == nil then
          -- TODO: clean up this if statement
          if type(msg) == "boolean" or #msg == 0 then
            return "LS Inactive"
          end
          return msg
        end
        local buf_ft = vim.bo.filetype
        local buf_client_names = {}
        local copilot_active = false

        -- add client
        for _, client in pairs(buf_clients) do
          if client.name ~= "null-ls" and client.name ~= "copilot" then
            table.insert(buf_client_names, client.name)
          end

          if client.name == "copilot" then
            copilot_active = true
          end
        end

        -- add formatter
        local formatters = require "plugins.lsp.null-ls"
        local supported_formatters = formatters.list_registered(buf_ft)
        vim.list_extend(buf_client_names, supported_formatters)

        -- add linter
        local linters = require "plugins.lsp.null-ls"
        local supported_linters = linters.list_registered(buf_ft)
        vim.list_extend(buf_client_names, supported_linters)

        local unique_client_names = vim.fn.uniq(buf_client_names)

        local language_servers = "[" .. table.concat(unique_client_names, ", ") .. "]"

        if copilot_active then
          language_servers = language_servers .. "%#SLCopilot#" .. " " .. user.icons.git.Octoface .. "%*"
        end

        return language_servers
      end,
      color = { gui = "bold" },
      -- cond = conditions.hide_in_width,
    }

    -- cool function for progress
    local progress = function()
      local current_line = vim.fn.line(".")
      local total_lines = vim.fn.line("$")
      local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
      local line_ratio = current_line / total_lines
      local index = math.ceil(line_ratio * #chars)
      return chars[index]
    end

    local spaces = function()
      return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { branch, diagnostics },
        lualine_b = { mode },
        lualine_c = {},
        -- lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_x = { lsp, diff, spaces, "encoding", filetype },
        lualine_y = { location },
        lualine_z = { progress2 },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    })
 end

}
