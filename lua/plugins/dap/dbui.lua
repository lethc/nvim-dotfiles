return {
	"rcarriga/nvim-dap-ui",
  config = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_show_database_icon = 1
    vim.g.db_ui_force_echo_notifications = 1
    vim.g.db_ui_win_position = "right"
    vim.g.db_ui_winwidth = 80
    vim.g.db_ui_save_location = "/home/luis501/.config/db_ui/"

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
      buffers = "󰕸",
      add_connection = "󰆺",
      connection_ok = "✓",
      connection_error = "✕",
    }

    -- opening it in a new tab
    vim.keymap.set("n", "<leader><leader>db", ":tab DBUI<cr>", {})

    -- just close the tab, but context related of the keybinding
    vim.keymap.set("n", "<leader><leader>tq", ":tabclose<cr>")

    vim.keymap.set("n", "<leader>du", ":DBUIToggle<cr>")
    --vim.g.dbs = {
    --   'mysql://luis501:mysql@localhost:3306/DB_user'
    --}
  end,
}
