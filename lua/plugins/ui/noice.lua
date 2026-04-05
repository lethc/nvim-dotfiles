return {
	{
		"folke/noice.nvim",
		dependencies = {
			{
				"rcarriga/nvim-notify",
				config = function()
					local notify_status_ok, notify = pcall(require, "notify")
					if not notify_status_ok then
						return
					end
					vim.notify = notify
					notify.setup({
						background_colour = "#151B23",
						render = "wrapped-compact",
						stages = "fade",
						max_width = "75",
						max_height = "25",
						minimum_width = "35",
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
					-- vim.cmd("command! Message :lua require('notify').print_history()<CR>")
				end,
			},
		},
		event = "BufReadPre",
		-- event = "VeryLazy",
		-- lazy = true,
		config = function()
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
						lua = {
							pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
							icon = "",
							lang = "lua",
						},
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
						enabled = false,
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
						enabled = false,
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
				-- routes = { -- Old route/deprecated because it is not allowing the display of notifications like !echo "hi"
				--     {
				--         filter = {
				--             event = "msg_show",
				--             any = {
				--                 { find = "%d+L, %d+B" },
				--                 { find = "; after #%d+" },
				--                 { find = "; before #%d+" },
				--             },
				--         },
				--         view = "mini",
				--     },
				-- }, --- @see section on routes
				routes = {
					{
						filter = { event = "msg_show", kind = { "shell_out", "shell_err" } },
						view = "notify",
						opts = {
							level = "info",
							skip = false,
							replace = false,
						},
					},
				},
				status = {}, --- @see section on statusline components
				format = {}, --- @see section on formatting
			})
		end,
	},
}
