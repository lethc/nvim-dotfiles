local icons = require("config.icons")

return {
	{
		"nvim-lualine/lualine.nvim",
		event = "BufRead", -- ¿?
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			{
				"preservim/vim-pencil",
				init = function()
					vim.g["pencil#wrapModeDefault"] = "hard"
					vim.g["pencil#textwidth"] = 116
					-- vim.g["pencil#textwidth"] = 90
					vim.g["pencil#autoformat"] = 1 -- Enable autoformat by default (1) or disable (0)
				end,
			},
			{
				"Bekaboo/dropbar.nvim",
				opts = {
					menu = {
						win_configs = {
							border = "rounded",
						},
					},
					bar = {
						enable = false,
						padding = { left = 0, right = 0 },
					},
				},
			},
		},
		config = function()
			local status_ok, lualine = pcall(require, "lualine")
			if not status_ok then
				return
			end
			local function lsp_clients()
				local clients = vim.lsp.get_clients({ bufnr = 0 })
				if #clients == 0 then
					return ""
				end
				local names = {}
				for _, c in ipairs(clients) do
					table.insert(names, c.name)
				end
				return " " .. table.concat(names, ", ")
			end

			local spaces = {
				function()
					return ""
				end,
				padding = -1,
			}
			--LSP
			local branch = {
				icon = "",
				"branch",

				padding = { left = 0.1, right = 1 },
			}
			local diff = {
				"diff",
				colored = true,
				symbols = icons.git_status,
			}
			local diagnostics = {
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn", "hint", "info" },
				symbols = icons.diagnostics,
				colored = true,
				always_visible = false,
			}
			local separator2 = {
				function()
					return ""
				end,
				padding = { left = 0, right = 0 },
				separator = { left = "", right = "" },
			}
			local custom_icons = {
				function()
					return ""
				end,
				separator = { left = "", right = "" },
			}
			local modes = {
				"mode",
				separator = { left = "", right = "" },
				padding = { left = 0.8, right = 1 },
			}
			local location = {
				"location",
				separator = { left = "", right = "" },
				padding = { left = 1, right = 0.5 },
			}
			local progress = {
				"progress",
				-- separator = { left = "", right = "" },
				-- color = { bg = "#171717", fg = "#E1E1E1" },
				-- padding = 0.8,
				padding = { left = 1, right = 0.5 },
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

			local theme = {
				normal = {
					a = { bg = "None" },
					-- a = { bg = "None", gui = "bold" },
					b = { bg = "None" },
					c = { bg = "None" },
					x = { bg = "None" },
					y = { bg = "None" },
					z = { bg = "None" },
				},
				insert = {
					a = { bg = "None" },
					b = { bg = "None" },
					c = { bg = "None" },
					x = { bg = "None" },
					y = { bg = "None" },
					z = { bg = "None" },
				},
				visual = {
					a = { bg = "None" },
					b = { bg = "None" },
					c = { bg = "None" },
					x = { bg = "None" },
					y = { bg = "None" },
					z = { bg = "None" },
				},
				replace = {
					a = { bg = "None" },
					b = { bg = "None" },
					c = { bg = "None" },
					x = { bg = "None" },
					y = { bg = "None" },
					z = { bg = "None" },
				},
				command = {
					a = { bg = "None" },
					b = { bg = "None" },
					c = { bg = "None" },
					x = { bg = "None" },
					y = { bg = "None" },
					z = { bg = "None" },
				},
				inactive = {
					a = { bg = "None", gui = "bold" },
					b = { bg = "None", gui = "bold" },
					c = { bg = "None", gui = "bold" },
					x = { bg = "None", gui = "bold" },
					y = { bg = "None", gui = "bold" },
					z = { bg = "None", gui = "bold" },
				},
			}

			lualine.setup({
				options = {
					globalstatus = true,
					icons_enabled = true,
					theme = theme,
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
						separator2,
						{
							function()
								return "ℕ →"
							end,
						},
						{
							"tabs",
							mode = 0,
							show_modified_status = true, -- Shows a symbol next to the tab name if the file has been modified.
							tabs_color = {
								active = {
									fg = "#BF616A",
								},
								inactive = "",
							},
							-- separator = { left = "", right = "" },
							-- padding = -1,
							padding = { left = -1, right = 1 },
							separator = { left = "", right = "" },
							symbols = { modified = "+", removed = "-" }, -- Changes the symbols used by the diff.
						},
						{
							"macro_recording",
							"%S",
						},
					},
					lualine_x = {
						{
							"%{PencilMode()}",
						},
						{ getWords },
						{
							lsp_clients,
						},
					},
					lualine_y = {},
					lualine_z = {
						diff,
						diagnostics,
						separator2,
						branch,
						{
							function()
								return ""
							end,
							padding = 0.1,
						},
						progress,
						location,
						{
							function()
								-- return "%P%L"
								return " 󰗚  %L "
							end,
							padding = 0.3,
						},
					},
				},
				tabline = {
					lualine_a = {
						{
							function()
								-- return "%P%L"
								if vim.bo.modified then
									return "  "
								else
									return " 󱗆 "
								end
							end,
							color = function()
								if vim.bo.modified then
									return { bg = "", fg = "#e06c75" } -- Red background when buffer is modified
								else
									return { bg = "", fg = nil } -- Default colors
								end
							end,
						},
						{
							function()
								return ""
							end,
						},
					},
					lualine_b = { "%{%v:lua.dropbar()%}" },
					lualine_x = {
						function()
							return " "
						end,
					},
				},
			})
		end,
	},
	{
		"yavorski/lualine-macro-recording.nvim",
		event = "RecordingEnter",
	},
}
