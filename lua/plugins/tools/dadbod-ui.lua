return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		"tpope/vim-dadbod",
		"kristijanhusak/vim-dadbod-completion",
		"tpope/vim-dotenv",
	},
	keys = { { "<leader><leader>db", ":DBUIToggle<cr>", desc = "Open Database client" } },
	config = function()
		vim.cmd([[
     autocmd FileType dbui nnoremap <buffer> v <Plug>(DBUI_SelectLineVsplit)
    ]])
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_show_database_icon = 1
		vim.g.db_ui_force_echo_notifications = 1
		vim.g.db_ui_win_position = "left"
		vim.g.db_ui_winwidth = 40

		vim.g.db_ui_table_helpers = {
			mysql = {
				Count = "select count(1) from {optional_schema}{table}",
				Explain = "EXPLAIN {last_query}",
			},
			sqlite = {
				Describe = "PRAGMA table_info({table})",
			},
		}

		vim.g.db_ui_icons = {
			expanded = {
				db = "▾ 󰆼",
				buffers = "▾ ",
				saved_queries = "▾ ",
				schemas = "▾ ",
				schema = "▾ 󰙅",
				tables = "▾ 󰓱",
				table = "▾ ",
			},
			collapsed = {
				db = "▸ 󰆼",
				buffers = "▸ ",
				saved_queries = "▸ ",
				schemas = "▸ ",
				schema = "▸ 󰙅",
				tables = "▸ 󰓱",
				table = "▸ ",
			},
			saved_query = "",
			new_query = "󰓰",
			tables = "󰓫",
			buffers = "󱈛",
			add_connection = "󰆺",
			connection_ok = "✓",
			connection_error = "✕",
		}
	end,
}
