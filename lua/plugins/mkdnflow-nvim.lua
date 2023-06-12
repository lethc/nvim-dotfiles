return {
	"jakewvincent/mkdnflow.nvim",
	-- rocks = "luautf8", -- Ensures optional luautf8 dependency is installed
  ft = "markdown",
	config = function()
		-- ** DEFAULT SETTINGS; TO USE THESE, PASS NO ARGUMENTS TO THE SETUP FUNCTION **
		require("mkdnflow").setup({
			modules = {
				bib = true,
				buffers = true,
				conceal = true,
				cursor = true,
				folds = true,
				links = true,
				lists = true,
				maps = true,
				paths = true,
				tables = true,
				yaml = false,
			},
			filetypes = { md = true, rmd = true, markdown = true },
			create_dirs = true,
			perspective = {
				priority = "first",
				fallback = "current",
				root_tell = false,
				nvim_wd_heel = false,
				update = false,
			},
			wrap = false,
			bib = {
				default_path = nil,
				find_in_root = true,
			},
			silent = false,
			links = {
				style = "markdown",
				name_is_source = false,
				conceal = false,
				context = 0,
				implicit_extension = nil,
				transform_implicit = false,
				transform_explicit = function(text)
					text = text:gsub(" ", "-")
					text = text:lower()
					text = os.date("%Y-%m-%d_") .. text
					return text
				end,
			},
			new_file_template = {
				use_template = false,
				placeholders = {
					before = {
						title = "link_title",
						date = "os_date",
					},
					after = {},
				},
				template = "# {{ title }}",
			},
			to_do = {
				symbols = { " ", "-", "X" },
				update_parents = true,
				not_started = " ",
				in_progress = "-",
				complete = "X",
			},
			tables = {
				trim_whitespace = true,
				format_on_move = true,
				auto_extend_rows = false,
				auto_extend_cols = false,
			},
			yaml = {
				bib = { override = false },
			},
			mappings = {
				MkdnEnter = false,--[[ { { "n", "v" }, "<CR>" }, ]]
				MkdnTab = false, --jump to the next cell in a table
				MkdnSTab = false,
				MkdnNextLink = { "n", "<Tab>" },
				MkdnPrevLink = { "n", "<S-Tab>" },
				MkdnNextHeading = { "n", "]]" },
				MkdnPrevHeading = { "n", "[[" },
				MkdnGoBack = false,
				MkdnGoForward = false,
				MkdnCreateLink = { {"n", "v"}, "<leader>mn" },
				MkdnCreateLinkFromClipboard = { { "n", "v" }, "<leader>pp" }, -- see MkdnEnter
				MkdnFollowLink = false, -- see MkdnEnter
				MkdnDestroyLink = { "n", "<A-r>" },
				MkdnTagSpan = { "v", "<S-CR>" },
				MkdnMoveSource = { "n", "<F2>" },
				MkdnYankAnchorLink = { "n", "yaa" },
				MkdnYankFileAnchorLink = { "n", "yfa" },
				MkdnIncreaseHeading = { "n", "+" },
				MkdnDecreaseHeading = { "n", "-" },
				MkdnToggleToDo = { { "n", "v" }, "<C-Space>" },
				MkdnNewListItem = { { "n" }, "<leader>ml" },
				MkdnNewListItemBelowInsert = { "n", "o" },
				MkdnNewListItemAboveInsert = { "n", "O" },
				MkdnExtendList = { { "n", "v" }, "<leader>mL" },
				MkdnUpdateNumbering = { "n", "<leader>nn" },
				MkdnTableNextCell = { "i", "<Tab>" },
				MkdnTablePrevCell = { "i", "<S-Tab>" },
				MkdnTableNextRow = { "i", "<CR>" },
				MkdnTablePrevRow = { "i", "<S-CR>" },
				MkdnTableNewRowBelow = { "n", "<leader>mr" },
				MkdnTableNewRowAbove = { "n", "<leader>mR" },
				MkdnTableNewColAfter = { "n", "<leader>mc" },
				MkdnTableNewColBefore = { "n", "<leader>iC" },
				MkdnFoldSection = { "n", "<leader>mf" },
				MkdnUnfoldSection = { "n", "<leader>mF" },
			},
		})
	end,
}
