return {
	{
		"numToStr/FTerm.nvim",
		keys = {
			{ "<A-g>", "<cmd><cr>", desc = "Gitui" },
			{ "<A-c>", "<cmd><cr>", desc = "ncdu" },
			-- { "<A-y>", "<cmd><cr>", desc = "Yazi" },
			-- { "<A-d>",           "<cmd>FTermToggle<cr>", desc = "FTerm" },
			-- { "<leader>tf",      "<cmd>FTermToggle<cr>", desc = "Toggle Terminal" },
			{ "<leader><Enter>", "<cmd>FTermEnter<cr>", desc = "Execute in Terminal" },
		},
		config = function()
			local fterm_status_ok, fterm = pcall(require, "FTerm")
			if not fterm_status_ok then
				return
			end
			fterm.setup({
				ft = "terminal",
				cmd = os.getenv("SHELL"),
				border = "rounded",
				-- border     = 'none',
				dimensions = {
					-- height = 0.8,
					-- width = 0.8,
					height = 0.5,
					width = 1,
					x = 0, -- X axis of the terminal window
					y = 1, -- Y axis of the terminal window
				},
				auto_close = true,
			})
			--Open the terminal
			vim.api.nvim_create_user_command("FTermOpen", require("FTerm").open, { bang = true })
			--Toggle the terminal
			vim.api.nvim_create_user_command("FTermToggle", require("FTerm").toggle, { bang = true })
			--Close the terminal
			vim.api.nvim_create_user_command("FTermClose", require("FTerm").close, { bang = true })
			--Remove the terminal
			vim.api.nvim_create_user_command("FTermExit", require("FTerm").exit, { bang = true })
			vim.api.nvim_create_user_command("FTermEnter", require("FTerm").scratch, { bang = true })

			-- Code Runner - execute commands in a floating terminal
			local runners = { lua = "lua", javascript = "node", java = "java", python = "python", php = "php" }
			local aux = { cpp = "./*" }

			vim.keymap.set("n", "<leader><Enter>", function()
				local buf = vim.api.nvim_buf_get_name(0)
				local ftype = vim.filetype.match({ filename = buf })
				local exec = runners[ftype]
				if exec ~= nil then
					require("FTerm").scratch({ cmd = { exec, buf } })
				end
			end)

			local fterm = require("FTerm")

			local ncdu = fterm:new({
				ft = "terminal", -- You can also override the default filetype, if you want
				cmd = "ncdu",
				dimensions = {
					height = 0.9,
					width = 0.9,
				},
			})

			-- Use this to toggle ncdu in a floating terminal
			vim.keymap.set("n", "<A-c>", function()
				ncdu:toggle()
			end)

			vim.api.nvim_create_user_command("Ncdu", function()
				require("FTerm").run("ncdu")
			end, { bang = true })

			local gitui = fterm:new({
				ft = "terminal", -- You can also override the default filetype, if you want
				cmd = "gitui",
				dimensions = {
					height = 0.9,
					width = 0.9,
				},
			})

			-- Use this to toggle gitui in a floating terminal
			vim.keymap.set("n", "<A-g>", function()
				gitui:toggle()
			end)

			local yazi = fterm:new({
				ft = "terminal",
				cmd = "yazi",
				dimensions = {
					height = 0.9,
					width = 0.9,
				},
			})
			vim.keymap.set("n", "<A-y>", function()
				yazi:toggle()
			end)

			-- vim.api.nvim_create_user_command('Yazi', function()
			--     require('FTerm').run('yazi')
			-- end, { bang = true })

			-- Stratch Terminal
			-- require('FTerm').scratch({ cmd = 'yazi' })

			vim.api.nvim_create_user_command("Yazi2", function()
				require("FTerm").scratch({ cmd = { "yazi" } })
			end, { bang = true })
		end,
	},
}
