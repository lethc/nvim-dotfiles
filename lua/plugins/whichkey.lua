return {
	"folke/which-key.nvim",
	config = function()
		local status_ok, which_key = pcall(require, "which-key")
		if not status_ok then
			return
		end

		local setup = {
			plugins = {
				marks = true, -- shows a list of your marks on ' and `
				registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				spelling = {
					enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
					suggestions = 20, -- how many suggestions should be shown in the list?
				},
				-- the presets plugin, adds help for a bunch of default keybindings in Neovim
				-- No actual key bindings are created
				presets = {
					operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
					motions = true, -- adds help for motions
					text_objects = true, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = true, -- misc bindings to work with windows
					z = true, -- bindings for folds, spelling and others prefixed with z
					g = true, -- bindings for prefixed with g
				},
			},
			-- add operators that will trigger motion and text object completion
			-- to enable all native operators, set the preset / operators plugin above
			-- operators = { gc = "Comments" },
			key_labels = {
				-- override the label used to display some keys. It doesn't effect WK in any other way.
				-- For example:
				-- ["<space>"] = "SPC",
				-- ["<cr>"] = "RET",
				-- ["<tab>"] = "TAB",
			},
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "➜", -- symbol used between a key and it's label
				group = "+", -- symbol prepended to a group
			},
			popup_mappings = {
				scroll_down = "<c-d>", -- binding to scroll down inside the popup
				scroll_up = "<c-u>", -- binding to scroll up inside the popup
			},
			window = {
				border = "rounded", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
				padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
				winblend = 0,
			},
			layout = {
				height = { min = 4, max = 25 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 3, -- spacing between columns
				align = "center", -- align columns left, center or right
			},
			ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
			hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
			show_help = true, -- show help message on the command line when the popup is visible
			triggers = "auto", -- automatically setup triggers
			-- triggers = {"<leader>"} -- or specify a list manually
			triggers_blacklist = {
				-- list of mode / prefixes that should never be hooked by WhichKey
				-- this is mostly relevant for key maps that start with a native binding
				-- most people should not need to change this
				i = { "j", "k" },
				v = { "j", "k" },
			},
		}

		local opts = {
			mode = "n", -- NORMAL mode
			prefix = "<leader>",
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = true, -- use `nowait` when creating keymaps
		}

		local mappings = {
			["a"] = { "<cmd>Alpha<cr>", "Alpha" },
			["w"] = { "<cmd>w!<CR>", "Save" },
			-- ["q"] = { "<cmd>q!<CR>", "Quit" },
			-- ["Q"] = { "<cmd>qa!<CR>", "Quit All" },
			["i"] = { "<cmd>Telescope notify<CR>", "Notify" },
			["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
      c = {
        name = "Control Switch",
        c = { "<cmd>CodeiumEnable<CR>", "Activate Codeium" },
        C = { "<cmd>CodeiumDisable<CR>", "Desactivate Codeium" },
      },
			r = {
				name = "Search-Replace",
				s = { "<CMD>SearchReplaceSingleBufferSelections<CR>", "SearchReplaceSingleBuffer [s]elction list" },
				o = { "<CMD>SearchReplaceSingleBufferOpen<CR>", "[o]pen" },
				w = { "<CMD>SearchReplaceSingleBufferCWord<CR>", "[w]ord" },
				W = { "<CMD>SearchReplaceSingleBufferCWORD<CR>", "[W]ORD" },
				e = { "<CMD>SearchReplaceSingleBufferCExpr<CR>", "[e]xpr" },
				f = { "<CMD>SearchReplaceSingleBufferCFile<CR>", "[f]ile" },
				b = {
					name = "Search-Replace-MultiBuffer",
					s = { "<CMD>SearchReplaceMultiBufferSelections<CR>", "SearchReplaceMultiBuffer [s]elction list" },
          o = { "<CMD>SearchReplaceMultiBufferOpen<CR>", "[o]pen" },
          w = { "<CMD>SearchReplaceMultiBufferCWord<CR>", "[w]ord" },
          W = { "<CMD>SearchReplaceMultiBufferCWORD<CR>", "[W]ORD" },
          e = { "<CMD>SearchReplaceMultiBufferCExpr<CR>", "[e]xpr" },
          f = { "<CMD>SearchReplaceMultiBufferCFile<CR>", "[f]ile" },
				},
			},
			m = {
				name = "Markdown-Files",
				f = { "<cmd>MkdnFoldSection<cr>", "Fold" },
				F = { "<cmd>MkdnFoldSection<cr>", "Unfold" },
				-- l = { "<cmd>MkdnNewListItem<cr>", "NewList" },
				l = { "<cmd>MkdnExtendList<cr>", "NewListNoMove" },
				r = { "<cmd>MkdnTableNewRowBelow<cr>", "TableNewRowBelow" },
				R = { "<cmd>MkdnTableNewRowAbove<cr>", "TableNewRowAfter" },
				c = { "<cmd>MkdnTableNewColAfter<cr>", "TableNewColAfter" },
				C = { "<cmd>MkdnTableNewColBefore<cr>", "TableNewColBefore" },
				t = { "<cmd>MkdnTableFormat <cr>", "FormatTable" },
				n = { "<cmd>MkdnCreateLink<cr>", "CreateLink" },
				N = { "<cmd>MkdnDestroyLink<cr>", "DestroyLink" },
			},
			p = {
				name = "Preview",
				d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "definition" },
				D = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", "Type definition" },
				i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Implementation" },
				x = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "Close all" },
				r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "References" },
				h = { "<cmd>Bracey<CR>", "Preview HTML" },
				p = { "<cmd>PlantUMLRun<CR>", "Plantuml" },
			},

			L = {
				name = "Lazy",
				c = { "<cmd>Lazy check<cr>", "Check" },
				i = { "<cmd>Lazy install<cr>", "Install" },
				S = { "<cmd>Lazy sync<cr>", "Sync" },
				s = { "<cmd>Lazy show<cr>", "Status" },
				u = { "<cmd>Lazy update<cr>", "Update" },
			},

			g = {
				name = "Git",
				j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
				k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
				l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
				p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
				r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
				R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
				s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
				u = {
					"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
					"Undo Stage Hunk",
				},
				o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
				b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
				c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
				C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit" },
				d = {
					"<cmd>Gitsigns diffthis HEAD<cr>",
					"Diff",
				},
			},

			d = {
				name = "Debug",
				b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
				c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
				i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
				o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
				O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
				r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
				l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
				g = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
				x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
				u = {
					name = "Rust",
					a = { "<cmd>RustCodeAction<cr>" },
					d = { "<cmd>RustDebuggables<cr>" },
					r = { "<cmd>RustRun<cr>" },
				},
			},

			-- nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
			-- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
			-- require("dapui").open()
			-- require("dapui").close()
			-- require("dapui").toggle()

			l = {
				name = "LSP",
				T = {
					name = "Telescope",
					l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
					q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
					a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
					j = {
						"<cmd>lua vim.diagnostic.goto_next({buffer=0})<<CR>",
						"Next Diagnostic",
					},
					k = {
						"<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
						"Prev Diagnostic",
					},
					r = { "<cmd>lua vim.lsp.buf.rename()<<cr>" },
					w = {
						"<cmd>Telescope diagnostics<cr>",
						"Workspace Diagnostics",
					},
					d = {
						"<cmd>Telescope diagnostics bufnr=0<cr>",
						"Document Diagnostics",
					},
					s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
					S = {
						"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
						"Workspace Symbols",
					},
					K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "show hover" },
				},
				-- GO TO
				g = {
					-- Go to definition
					-- Use <C-t> to jump back
					name = "Go To...",
					d = { "<cmd>Lspsaga goto_definition<cr>", "Go to Definition" },
					D = { "<cmd>Lspsaga goto_type_definition<cr>", "Go to Type Definition" },
					i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to Implementation" },
				},
				p = {
					name = "Peek...",
					d = { "<cmd>Lspsaga peek_definition<cr>", "Peek Definition" },
					D = { "<cmd>Lspsaga peek_type_definition<cr>", "Peek Type Definition" },
				},
				-- Call hierarchy
				c = {
					name = "Call hierarchy",
					i = { "<cmd>Lspsaga incoming_calls<cr>", "Incomming Calls" },
					o = { "<cmd>Lspsaga outgoing_calls<cr>", "Outgoing Calls" },
				},
        s = {
          name = "Status LSP",
					s = { "<cmd>LspStop<cr>", "Stop LSP" },
					l = { "<cmd>LspStart ltex<cr>", "Start ltex" },
        },
				-- LspInfo
				i = { "<cmd>LspInfo<cr>", "Info" },
				-- Code action
				a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
				-- Show buffer diagnostics
				d = {
					"<cmd>Lspsaga show_buf_diagnostics<cr>",
					"Document Diagnostics",
				},
				-- Show workspace diagnostics
				w = {
					"<cmd>Lspsaga show_workspace_diagnostics<cr>",
					"Workspace Diagnostics",
				},
				-- Show cursor diagnostics
				u = {
					"<cmd>Lspsaga show_cursor_diagnostics<cr>",
					"Cursor Diagnostic",
				},
				-- Show line diagnostics
				l = {
					"<cmd>Lspsaga show_line_diagnostics<cr>",
					"Line Diagnostic",
				},
				-- Format file
				f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
				-- Diagnostic jump
				j = {
					"<cmd>Lspsaga diagnostic_jump_next<CR>",
					"Next Diagnostic",
				},
				k = {
					"<cmd>Lspsaga diagnostic_jump_prev<cr>",
					"Prev Diagnostic",
				},
				-- Rename all occurrences of the hovered word for the entire file
				r = { "<cmd>Lspsaga rename<cr>", "Rename" },
				-- Rename all occurrences of the hovered word for the selected files
				R = { "<cmd>Lspsaga rename ++project<cr>", "Rename Project" },
				-- LSP finder - Find the symbol's definition
				S = { "<cmd>Lspsaga lsp_finder<cr>", "Document Symbols" },
				-- Keep hover
				K = { "<cmd>Lspsaga hover_doc ++keep<cr>", "Keep hover" },
				-- Toggle outline
				o = { "<cmd>Lspsaga outline<cr>", "Toggle outline" },
			},
			s = {
				name = "Search",
				s = { "<cmd>Telescope smart_open<cr>", "Smart Open" },
				b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
				c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
				h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
				M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
				r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
				R = { "<cmd>Telescope registers<cr>", "Registers" },
				k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
				C = { "<cmd>Telescope commands<cr>", "Commands" },
				m = { "<cmd>Telescope macros<cr>", "Macros" },
				t = {
					name = "Trouble.nvim",
					t = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
					w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Trouble" },
					d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Trouble" },
					r = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
					a = { "<cmd>TroubleToggle quickfix<cr>", "QuickFix" },
					l = { "<cmd>TroubleToggle lsp_references<cr>", "lsp_references" },
					c = { "<cmd>TroubleClose<cr>", "Close Trouble" },
					o = { "<cmd>TroubleRefresh<cr>", "Refresh Trouble" },
				},
			},

			t = {
				name = "Terminal",
				c = { "<cmd>Compile<cr>", "Compiler File" },
				v = { "<cmd>vsplit | set norelativenumber | set nonumber  | terminal<cr>", "Vertical Terminal" },
				h = { "<cmd>split | set norelativenumber | set nonumber  | terminal<cr>", "Horizontal Terminal" },
			},

			o = {
				name = "Obsidian",
				o = { "<cmd>ObsidianOpen<cr>", "Open File" },
				t = { "<cmd>ObsidianToday<cr>", "Open Today File" },
				y = { "<cmd>ObsidianYesterday<cr>", "Open Yesterday File" },
				s = { "<cmd>ObsidianSearch<CR>", "Obsidian Search" },
				q = { "<cmd>ObsidianQuickSwitch<CR>", "Quick Switch" },
				f = { "<cmd>ObsidianFollowLink<CR>", "Follow Link" },
				p = { "<cmd>PeekOpen<CR>", "Open Peek" },
				c = { "<cmd>PeekClose<CR>", "Close Peek" },
			},
		}

		which_key.setup(setup)
		which_key.register(mappings, opts)
	end,
}
