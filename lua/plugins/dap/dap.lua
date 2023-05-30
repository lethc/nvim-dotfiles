return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap_status_ok, dap = pcall(require, "dap")
		if not dap_status_ok then
			return
		end

		local dap_ui_status_ok, dapui = pcall(require, "dapui")
		if not dap_ui_status_ok then
			return
		end

		-- dapui.setup()
		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸" },
			mappings = {
				-- Use a table to apply multiple mappings
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
			},
			-- Expand lines larger than the window
			-- Requires >= 0.7
			expand_lines = vim.fn.has("nvim-0.7"),
			-- Layouts define sections of the screen to place windows.
			-- The position can be "left", "right", "top" or "bottom".
			-- The size specifies the height/width depending on position. It can be an Int
			-- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
			-- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
			-- Elements are the elements shown in the layout (in order).
			-- Layouts are opened in order so that earlier layouts take priority in window sizing.
			layouts = {
				{
					elements = {
						-- Elements can be strings or table with id and size keys.
						{ id = "scopes", size = 0.25 },
						"breakpoints",
						"stacks",
						"watches",
					},
					size = 40, -- 40 columns
					position = "right",
				},
				{
					elements = {
						"repl",
						"console",
					},
					size = 0.25, -- 25% of total lines
					position = "bottom",
				},
			},
			floating = {
				max_height = nil, -- These can be integers or a float between 0 and 1.
				max_width = nil, -- Floats will be treated as percentage of your screen.
				border = "single", -- Border style. Can be "single", "double" or "rounded"
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			windows = { indent = 1 },
			render = {
				max_type_length = nil, -- Can be integer or nil.
			},
		})

		local icons = require("plugins.dap.icons.icons")

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = icons.ui.Bug, texthl = "DiagnosticSignError", linehl = "", numhl = "" }
		)

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open({})
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close({})
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close({})
		end

		require("dap-go").setup()

		require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

		------------- DAP cpp, c, rust -------------------
		dap.adapters.lldb = {
			type = "executable",
			command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
			name = "lldb",
		}

		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},

				-- 💀
				-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
				--
				--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
				--
				-- Otherwise you might get the following error:
				--
				--    Error on launch: Failed to attach to the target process
				--
				-- But you should be aware of the implications:
				-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
				-- runInTerminal = false,
			},
		}

		-- If you want to use this for Rust and C, add something like this:

		dap.configurations.c = dap.configurations.cpp
		-- dap.configurations.rust = dap.configurations.cpp

		------------- PHP -------------------
		dap.adapters.php = {
			type = "executable",
			command = "node",
			args = { "~/.dap-server/vscode-php-debug/out/phpDebug.js" },
		}

		dap.configurations.php = {
			{
				type = "php",
				request = "launch",
				name = "Listen for Xdebug",
				port = 9000,
			},
		}
	end,
}
