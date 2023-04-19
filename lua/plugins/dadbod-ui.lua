return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		"kristijanhusak/vim-dadbod-completion",
		"tpope/vim-dadbod",
		"tpope/vim-dotenv",
	},
  keys = {
    {"<leader>cu", "<cmd>:DBUIToggle<cr>", desc = "DBUIToggle"},
    {"<leader>cq", "<cmd>:tabclose<cr>", desc = "tabclose"},
    {"<leader>ct", "<cmd>:tab DBUI<cr>", desc = "tab-DBUI"},
  },
	config = function()
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_show_database_icon = 1
		vim.g.db_ui_force_echo_notifications = 1
		vim.g.db_ui_win_position = "right"
		vim.g.db_ui_winwidth = 80
		vim.g.db_ui_save_location = "/home/lummyn/.config/db_ui/"

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
				db = "▾ ",
				buffers = "▾ ",
				saved_queries = "▾ ",
				schemas = "▾ ",
				schema = "▾ פּ",
				tables = "▾ 藺",
				table = "▾ ",
			},
			collapsed = {
				db = "▸ ",
				buffers = "▸ ",
				saved_queries = "▸ ",
				schemas = "▸ ",
				schema = "▸ פּ",
				tables = "▸ 藺",
				table = "▸ ",
			},
			saved_query = "",
			new_query = "璘",
			tables = "離",
			buffers = "﬘",
			add_connection = "",
			connection_ok = "✓",
			connection_error = "✕",
		}

		-- opening it in a new tab
		-- vim.keymap.set("n", "<leader><leader>db", ":tab DBUI<cr>", {})

		-- just close the tab, but context related of the keybinding
		-- vim.keymap.set("n", "<leader><leader>tq", ":tabclose<cr>")

		-- vim.keymap.set("n", "<leader>du", ":DBUIToggle<cr>")
		--vim.g.dbs = {
		--   'mysql://luis501:mysql@localhost:3306/DB_user'
		--   'mysql://mysql:root@localhost:3306/DB_user'
		--}
	end,
}
