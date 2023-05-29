return {
	"numToStr/FTerm.nvim",
	config = function()
		require("FTerm").setup({
			ft = "FTerm",
			cmd = os.getenv("SHELL"),
			border = "rounded",
			dimensions = {
				height = 0.8,
				width = 0.8,
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


		-- Code Runner - execute commands in a floating terminal
		local runners = { lua = "lua", javascript = "node", java = "java", python = "python" }
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
			ft = "fterm_ncdu", -- You can also override the default filetype, if you want
			cmd = "ncdu",
			dimensions = {
				height = 0.9,
				width = 0.9,
			},
		})

		-- Use this to toggle ncdu in a floating terminal
		vim.keymap.set("n", "<A-g>", function()
			ncdu:toggle()
		end)

		local gitui = fterm:new({
			ft = "fterm_gitui", -- You can also override the default filetype, if you want
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

		local joshuto = fterm:new({
			ft = "FTerm",
			cmd = "joshuto",
			dimensions = {
				height = 0.9,
				width = 0.9,
			},
		})

		-- Use this to toggle gitui in a floating terminal
		-- function _JOSHUTO()
		-- 	joshuto:toggle()
		-- end

		vim.keymap.set("n", "<A-h>", function()
			joshuto:toggle()
		end)
	end,
}
