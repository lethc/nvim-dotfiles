return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local status_ok, lualine = pcall(require, "lualine")
		if not status_ok then
			return
		end

		local hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end
		local spaces = {
			function()
				return " "
			end,
			padding = -1,
		}

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = {
				"error",
				"warn",
				"hint",
			},
			symbols = {
				error = "󰅙 ",
				warn = " ",
				hint = "󰌵 ",
				info = "󰋼 ",
			},
			colored = true,
			always_visible = false,
		}

		local branch = {
			"branch",
			icon = "",
			separator = { left = "", right = "" },
			padding = 0.1,
		}

		local diff = {
			"diff",
			colored = true,
			symbols = {
				added = " ",
				modified = " ",
				removed = " ",
			},
			separator = { left = "", right = "" },
		}

		local filetype = {
			"filetype",
			icons_enabled = true,
		}

		local location = {
			"location",
		}

		local custom_icons = {
			function()
				return ""
			end,
			separator = { left = "", right = "" },
		}

		local modes = {
			"mode",
			separator = { left = "", right = "" },
			padding = 0.8,
		}

		local indent = function()
			return "" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
		end

		local lsp_progess = function()
			local msg
			local msg = msg or "LS Inactive"
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
			local null_ls = require("null-ls")
			local alternative_methods = {
				null_ls.methods.DIAGNOSTICS,
				null_ls.methods.DIAGNOSTICS_ON_OPEN,
				null_ls.methods.DIAGNOSTICS_ON_SAVE,
			}

			-- add client
			for _, client in pairs(buf_clients) do
				if client.name ~= "null-ls" and client.name ~= "copilot" then
					table.insert(buf_client_names, client.name)
				end

				if client.name == "copilot" then
					copilot_active = true
				end
			end

			function list_registered_providers_names(filetype)
				local s = require("null-ls.sources")
				local available_sources = s.get_available(filetype)
				local registered = {}
				for _, source in ipairs(available_sources) do
					for method in pairs(source.methods) do
						registered[method] = registered[method] or {}
						table.insert(registered[method], source.name)
					end
				end
				return registered
			end

			function list_registered(filetype)
				local registered_providers = list_registered_providers_names(filetype)
				local providers_for_methods = vim.tbl_flatten(vim.tbl_map(function(m)
					return registered_providers[m] or {}
				end, alternative_methods))
				return providers_for_methods
			end

			function formatters_list_registered(filetype)
				local registered_providers = list_registered_providers_names(filetype)
				return registered_providers[null_ls.methods.FORMATTING] or {}
			end

			-- formatters
			-- local supported_formatters = formatters_list_registered(buf_ft)
			-- vim.list_extend(buf_client_names, supported_formatters)

			-- linters
			local supported_linters = list_registered(buf_ft)
			vim.list_extend(buf_client_names, supported_linters)
			local unique_client_names = vim.fn.uniq(buf_client_names)

			local language_servers = " " .. table.concat(unique_client_names, ", ") .. ""

			if copilot_active then
				language_servers = language_servers .. "%#SLCopilot#" .. ""
			end

			return language_servers
		end

		lualine.setup({
			options = {
				globalstatus = true,
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard", "Outline" },
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
					{
						"filetype",
						icon_only = true,
						colored = true,
						padding = 1,
						color = { bg = "#2e383c" },
						separator = { left = "", right = " " },
					},
					{
						"filename",
						file_status = false,
						padding = 0.3,
						separator = { left = "", right = " " },
						color = { bg = "#2e383c" },
					},
					branch,
					diff,
					{ require("NeoComposer.ui").status_recording },
				},
				lualine_x = {
					diagnostics,
					{
						lsp_progess,
					},
					{
						function()
							return " 󰣇 "
						end,
						separator = { left = "", right = "" },
						color = { bg = "#83c092", fg = "#000000" },
						padding = 0.3,
					},
					{
						indent,
					},
					{
						function()
							return "  "
						end,
						separator = { left = "", right = "" },
						color = { bg = "#dbbc7f", fg = "#000000" },
						padding = 0.3,
					},
					"progress",
					{
						function()
							return "  "
						end,
						separator = { left = "", right = "" },
						color = { bg = "#7fbbb3", fg = "#000000" },
						padding = 0.1,
					},
					location,
					{
						function()
							-- return "%P%L"
							return " 󰗚  %L "
						end,
						separator = { left = "", right = "" },
						color = { bg = "#a7c080", fg = "#000000" },
						padding = 0.3,
					},
				},
				lualine_y = {},
				lualine_z = {
					-- {
					-- 	"datetime",
					-- 	-- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
					-- 	style = ("%H:%M"),
					-- },
				},
			},
		})
	end,
}
