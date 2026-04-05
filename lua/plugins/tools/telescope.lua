local icons = require("config.icons")

return {
	{
		"nvim-telescope/telescope.nvim",
		-- tag = '0.1.4',
		cmd = "Telescope",
		keys = {
			-- {
			--     "<leader>b",
			--     "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({previewer = false}))<CR>",
			--     desc = "Buffers",
			-- },
			{
				"<leader>sf",
				"<Cmd>lua require('telescope.builtin').find_files({previewer = true})<CR>",
				desc = "Telescope find files",
			},
			{ "<leader>sF", "<Cmd>Telescope live_grep<CR>", desc = "Telescope live grep" },
			{ "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Telescope old files" },
			{
				"<leader>sb",
				"<Cmd>lua require('telescope.builtin').buffers({sort_lastused = true, previewer = true})<CR>",
				desc = "Telescope buffers",
			},
			{
				"<leader>b",
				"<Cmd>lua require('telescope.builtin').buffers({sort_lastused = true, previewer = true})<CR>",
				desc = "Telescope buffers",
			},
			{ "<leader>si", "<Cmd>Telescope notify<CR>", desc = "Telescope Notify" },
			-- { "<leader>n", "<Cmd>Telescope file_browser<CR>", desc = "Telescope file browser" },
		},
		dependencies = {
			-- "nvim-telescope/telescope-file-browser.nvim",
			-- {
			-- 	"danielfalk/smart-open.nvim",
			-- 	branch = "0.2.x",
			-- 	"kkharji/sqlite.lua",
			-- 	-- Only required if using match_algorithm fzf
			-- 	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			-- },
		},
		config = function()
			local telescope_status_ok, telescope = pcall(require, "telescope")
			if not telescope_status_ok then
				return
			end
			local actions = require("telescope.actions")
			telescope.setup({
				defaults = {
					prompt_prefix = " " .. icons.common.search .. " ",
					selection_caret = "  ",
					-- selection_caret = " ",
					entry_prefix = "  ",
					initial_mode = "insert",
					selection_strategy = "reset",
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.5,
							results_width = 0.9,
						},
						vertical = {
							mirror = false,
							prompt_position = "top",
							preview_cutoff = 0.2,
							preview_height = 0.4,
						},
						height = 0.9,
						width = 0.8,
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
					},
					file_sorter = require("telescope.sorters").get_fuzzy_file,
					file_ignore_patterns = {
						"node_modules",
						".git",
						"target",
						"vendor",
					},
					generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
					path_display = { shorten = 5 },
					winblend = 0,
					border = {},
					-- borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
					color_devicons = true,
					set_env = { ["COLORTERM"] = "truecolor" },
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
					buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
					mappings = {
						i = {
							["<C-c>"] = actions.delete_buffer,
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,
							["<A-j>"] = actions.move_selection_next,
							["<A-k>"] = actions.move_selection_previous,
							["<ESC>"] = actions.close,
							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["<CR>"] = actions.select_default,
							["<C-s>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							-- ["<C-t>"] = actions.select_tab,
							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,
							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,
							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<C-l>"] = actions.complete_tag,
							["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
							["<C-h>"] = "which_key",
							-- ["<C-o>"] = trouble.open_with_trouble,
						},
						n = {
							["<C-c>"] = actions.delete_buffer,
							["<esc>"] = actions.close,
							["<CR>"] = actions.select_default,
							["<C-s>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,
							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["j"] = actions.move_selection_next,
							["k"] = actions.move_selection_previous,
							["H"] = actions.move_to_top,
							["M"] = actions.move_to_middle,
							["L"] = actions.move_to_bottom,
							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["gg"] = actions.move_to_top,
							["G"] = actions.move_to_bottom,
							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,
							["<A-k>"] = actions.preview_scrolling_up,
							["<A-j>"] = actions.preview_scrolling_down,
							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,
							["?"] = actions.which_key,
							-- ["<C-o>"] = trouble.open_with_trouble,
						},
					},
				},
				pickers = {
					buffers = {
						show_all_buffers = false,
						sort_mru = true,
						mappings = {
							i = {
								["<c-d>"] = "delete_buffer",
							},
						},
					},
					-- file_browser = {
					-- 	hidden = true,
					-- },
					find_files = {
						-- theme = "dropdown",
						hidden = true,
					},
					live_grep = {
						hidden = true,
						only_sort_text = true,
					},
				},
				extensions = {
					-- fzf = {
					--   fuzzy = true,
					--   override_generic_sorter = false,
					--   override_file_sorter = true,
					--   case_mode = "smart_case",
					-- },
					-- file_browser = {
					-- 	initial_mode = "insert",
					-- 	dir_icon = "󰉋",
					-- },
					-- smart_open = {
					-- 	show_scores = false,
					-- 	ignore_patterns = { "*.git/*", "*/tmp/*" },
					-- 	match_algorithm = "fzf",
					-- 	disable_devicons = false,
					-- },
					advanced_git_search = {
						-- See Config
					},
				},
			})
			-- telescope.load_extension("macros")
			-- telescope.load_extension("fzf")
			-- telescope.load_extension("file_browser")
			-- telescope.load_extension("notify")
			-- telescope.load_extension("smart_open")
			telescope.load_extension("advanced_git_search")

			vim.api.nvim_create_autocmd("User", {
				pattern = "TelescopePreviewerLoaded",
				callback = function()
					vim.opt.number = true
				end,
			})
		end,
	},
}
