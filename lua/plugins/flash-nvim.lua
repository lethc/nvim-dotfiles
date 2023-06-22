return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@tpe Flash.Config
	opts = {
		-- labels = "abcdefghijklmnopqrstuvwxyz",
		labels = "asdfghjklqwertyuiopzxcvbnm",
		search = {
			-- search/jump in all windows
			multi_window = true,
			-- search direction
			forward = true,
			-- when `false`, find only matches in the given direction
			wrap = true,
			---@type Flash.Pattern.Mode
			-- Each mode will take ignorecase and smartcase into account.
			-- * exact: exact match
			-- * search: regular search
			-- * fuzzy: fuzzy search
			-- * fun(str): custom function that returns a pattern
			--   For example, to only match at the beginning of a word:
			--   mode = function(str)
			--     return "\\<" .. str
			--   end,
			mode = "exact",
			-- behave like `incsearch`
			incremental = false,
			filetype_exclude = { "notify", "noice", "alpha" },
			-- Optional trigger character that needs to be typed before
			-- a jump label can be used. It's NOT recommended to set this,
			-- unless you know what you're doing
			trigger = "",
		},
		jump = {
			-- save location in the jumplist
			jumplist = true,
			-- jump position
			pos = "start", ---@type "start" | "end" | "range"
			-- add pattern to search history
			history = false,
			-- add pattern to search register
			register = false,
			-- clear highlight after jump
			nohlsearch = false,
			-- automatically jump when there is only one match
			autojump = false,
		},
		highlight = {
			label = {
				-- add a label for the first match in the current window.
				-- you can always jump to the first match with `<CR>`
				current = true,
				-- show the label after the match
				after = true, ---@type boolean|number[]
				-- show the label before the match
				before = false, ---@type boolean|number[]
				-- position of the label extmark
				style = "overlay", ---@type "eol" | "overlay" | "right_align" | "inline"
				-- flash tries to re-use labels that were already assigned to a position,
				-- when typing more characters. By default only lower-case labels are re-used.
				reuse = "lowercase", ---@type "lowercase" | "all"
			},
			-- show a backdrop with hl FlashBackdrop
			backdrop = true,
			-- Highlight the search matches
			matches = true,
			-- extmark priority
			priority = 5000,
			groups = {
				match = "FlashMatch",
				current = "FlashCurrent",
				backdrop = "FlashBackdrop",
				label = "FlashLabel",
			},
		},
		-- action to perform when picking a label.
		-- defaults to the jumping logic depending on the mode.
		---@type fun(match:Flash.Match, state:Flash.State)|nil
		action = nil,
		-- initial pattern to use when opening flash
		pattern = "",
		-- You can override the default options for a specific mode.
		-- Use it with `require("flash").jump({mode = "forward"})`
		---@type table<string, Flash.Config>
		modes = {
			-- options used when flash is activated through
			-- a regular search with `/` or `?`
			search = {
				enabled = true, -- enable flash for search
				highlight = { backdrop = false },
				jump = { history = true, register = true, nohlsearch = true },
				search = {
					-- `forward` will be automatically set to the search direction
					-- `mode` is always set to `search`
					-- `incremental` is set to `true` when `incsearch` is enabled
				},
			},
			-- options used when flash is activated through
			-- `f`, `F`, `t`, `T`, `;` and `,` motions
			char = {
				enabled = true,
				-- by default all keymaps are enabled, but you can disable some of them,
				-- by removing them from the list.
				keys = { "f", "F", ";", "," },
				search = { wrap = false },
				highlight = { backdrop = true },
				jump = { register = false },
			},
			-- options used for treesitter selections
			-- `require("flash").treesitter()`
			treesitter = {
				labels = "abcdefghijklmnopqrstuvwxyz",
				jump = { pos = "range" },
				highlight = {
					label = { before = true, after = true, style = "inline" },
					backdrop = false,
					matches = false,
				},
			},
		},
	},
	keys = {
		-- {
		-- 	"s",
		-- 	mode = { "n", "x", "o" },
		-- 	function()
		-- 		-- default options: exact mode, multi window, all directions, with a backdrop
		-- 		require("flash").jump({})
		-- 	end,
		-- },
		{
			"T",
			mode = { "n", "o", "x" },
			function()
				require("flash").treesitter()
			end,
		},
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump({
					search = { forward = true, wrap = false, multi_window = false },
				})
			end,
		},
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump({
					search = { forward = false, wrap = false, multi_window = false },
				})
			end,
		},
	},
}
