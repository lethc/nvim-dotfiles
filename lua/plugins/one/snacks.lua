return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = function()
		local home = os.getenv("HOME")
		local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ 
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ 
                                                   
             N  E  O  V  I  M                     
   ]]
		local keys = {
			{
				icon = " ",
				key = "n",
				desc = "New File",
				action = ":ene | startinsert | Lazy load lualine.nvim noice.nvim",
			},
			{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
			{ icon = " ", key = "F", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
			{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
			-- {
			--     icon = "󱎱 ",
			--     key = "h",
			--     desc = "Home",
			--     action = ":lua Snacks.dashboard.pick('files', {cwd = '" .. home .. "/Home'})",
			-- },
			-- {
			--     icon = " ",
			--     key = "o",
			--     desc = "Todos",
			--     action = ":e ~/Home/todo.md | Trouble todo focus=true filter = {tag = {TEST}}",
			-- },
			{
				icon = " ",
				key = "c",
				desc = "Config",
				action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
			},
			{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
			-- { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
			{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
		}
		return {
			bigfile = { enabled = true },
			quickfile = { enabled = true },
			statuscolumn = { enabled = false },
			scroll = { enabled = true },
			indentscope = { enabled = false },
			words = { enabled = true },
			terminal = {
				win = {
					wo = {
						winbar = "",
					},
				},
			},
			dashboard = {
				preset = {
					header = logo,
					keys = keys,
				},
				sections = {
					{ section = "header" },
					-- {
					--     pane = 2,
					--     section = "terminal",
					--     cmd = "colorscript -e square", -- Install shell-color-scripts-git
					--     height = 5,
					--     padding = 1,
					-- },
					{ section = "keys", gap = 1, padding = 1 },
					{
						pane = 2,
						icon = " ",
						title = "Recent Files",
						section = "recent_files",
						indent = 2,
						padding = 1,
					},
					{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
					-- {
					--     pane = 2,
					--     icon = " ",
					--     title = "Git Status",
					--     section = "terminal",
					--     enabled = Snacks.git.get_root() ~= nil,
					--     cmd = "hub status --short --branch --renames", -- Install hub
					--     height = 5,
					--     padding = 1,
					--     ttl = 5 * 60,
					--     indent = 3,
					-- },
					{ section = "startup" },
				},
			},
			notifier = {
				enabled = false,
				timeout = 3000, -- default timeout in ms
				width = { min = 40, max = 0.4 },
				height = { min = 1, max = 0.6 },
				-- editor margin to keep free. tabline and statusline are taken into account automatically
				margin = { top = 0, right = 1, bottom = 0 },
				padding = true, -- add 1 cell of left/right padding to the notification window
				sort = { "level", "added" }, -- sort by level and time
				icons = {
					error = " ",
					warn = " ",
					info = " ",
					debug = " ",
					trace = " ",
				},
				style = "compact",
				top_down = true, -- place notifications from top to bottom
				date_format = "%R", -- time format for notifications
			},
			styles = {
				notification = {
					-- wo = { wrap = true }, -- Wrap notifications
					border = "rounded",
					zindex = 100,
					ft = "markdown",
					wo = {
						winblend = 5,
						wrap = false,
						conceallevel = 2,
					},
					bo = { filetype = "snacks_notif" },
				},
				["notification.history"] = {
					border = "rounded",
					zindex = 100,
					width = 0.8,
					height = 0.8,
					minimal = false,
					title = "Notifications History",
					title_pos = "center",
					ft = "markdown",
					bo = { filetype = "snacks_notif_history" },
					wo = { winhighlight = "Normal:SnacksNotifierHistory" },
					keys = { q = "close" },
				},
			},
		}
	end,
	keys = {
		-- Git Related
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gL",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git Blame Line",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
		},
		{
			"<leader>gf",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Lazygit Current File History",
		},
		{
			"<leader>gO",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Lazygit Log (cwd)",
		},
		-- Other
		-- {
		--     "<S-q>",
		--     function()
		--         Snacks.bufdelete()
		--     end,
		--     desc = "Delete Buffer",
		-- },
		{
			"<leader>Un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
		-- {
		--     "<leader>si",
		--     function()
		--         Snacks.notifier.show_history()
		--     end,
		--     desc = "Notifications Show History",
		-- },
		{
			"<leader>T",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
		-- {
		--     "]]",
		--     function()
		--         Snacks.words.jump(vim.v.count1)
		--     end,
		--     desc = "Next Reference",
		-- },
		-- {
		--     "[[",
		--     function()
		--         Snacks.words.jump(-vim.v.count1)
		--     end,
		--     desc = "Prev Reference",
		-- },
		{
			"<leader>N",
			desc = "Neovim News",
			function()
				Snacks.win({
					file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
					width = 0.6,
					height = 0.6,
					wo = {
						spell = false,
						wrap = false,
						signcolumn = "yes",
						statuscolumn = " ",
						conceallevel = 3,
					},
				})
			end,
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd -- Override print to use snacks for `:=` command

				-- Create some toggle mappings
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>Us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>Uw")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>UL")
				Snacks.toggle.diagnostics():map("<leader>Ud")
				Snacks.toggle.line_number():map("<leader>Ul")
				Snacks.toggle
					.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					:map("<leader>uc")
				Snacks.toggle.treesitter():map("<leader>UT")
				Snacks.toggle
					.option("background", { off = "light", on = "dark", name = "Dark Background" })
					:map("<leader>Ub")
				Snacks.toggle.inlay_hints():map("<leader>Uh")
			end,
		})
	end,
}
