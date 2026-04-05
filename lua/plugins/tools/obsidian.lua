return {
	{
		-- "epwalsh/obsidian.nvim",
		"obsidian-nvim/obsidian.nvim", -- "~" characters appear in the column bar when there're no more lines on the screen
		event = {
			"BufReadPre " .. vim.fn.expand("~") .. "/Home/**.md",
			"BufNewFile " .. vim.fn.expand("~") .. "/Home/**.md",
		},
		-- keys = { "<Leader>o" },
		-- dependencies = {
		--   'junegunn/fzf.vim'
		-- },
		config = function()
			local obsidian_status_ok, obsidian = pcall(require, "obsidian")
			if not obsidian_status_ok then
				return
			end
			local path = os.getenv("HOME") .. "/Home/"
			obsidian.setup({
				-- dir = path,
				workspaces = {
					{
						name = "Home",
						path = path,
					},
				},
				completion = {
					nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
				},
				daily_notes = {
					folder = "Daily_notes/",
				},
				-- mappings = {},
				frontmatter = {
					enabled = true,
				},
				templates = {
					subdir = "Templates",
					date_format = "%Y-%m-%d-%a",
					time_format = "%H:%M",
					substitutions = {
						yesterday = function()
							return os.date("%Y-%m-%d", os.time() - 86400)
						end,
						today = function()
							return os.date("%A %e %b")
						end,
					},
				},
				ui = {
					enable = true, -- set to false to disable all additional syntax features
					update_debounce = 200, -- update delay after a text change (in milliseconds)
					-- Define how various check-boxes are displayed
					-- checkboxes = {
					--     [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
					--     ["x"] = { char = "", hl_group = "ObsidianDone" },
					--     [">"] = { char = "", hl_group = "ObsidianRightArrow" },
					--     ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
					--     -- Replace the above with this if you don't have a patched font:
					--     -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
					--     -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },
					--
					--     -- You can also add more custom ones...
					-- },
					external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
					-- Replace the above with this if you don't have a patched font:
					-- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
					reference_text = { hl_group = "ObsidianRefText" },
					highlight_text = { hl_group = "ObsidianHighlightText" },
					tags = { hl_group = "ObsidianTag" },
					hl_groups = {
						-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
						ObsidianTodo = { bold = true, fg = "#f78c6c" },
						ObsidianDone = { bold = true, fg = "#89ddff" },
						ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
						ObsidianTilde = { bold = true, fg = "#ff5370" },
						ObsidianRefText = { underline = true, fg = "#c792ea" },
						ObsidianExtLinkIcon = { fg = "#c792ea" },
						ObsidianTag = { italic = true, fg = "#89ddff" },
						ObsidianHighlightText = { bg = "#75662e" },
					},
				},
				checkbox = {
					order = { " ", "x", ">", "~" },
				},
				attachments = {
					-- The default folder to place images in via `:ObsidianPasteImg`.
					-- If this is a relative path it will be interpreted as relative to the vault root.
					-- You can always override this per image by passing a full path to the command instead of just a filename.
					folder = "assets/img", -- This is the default
					img_text_func = function(client, path)
						path = client:vault_relative_path(path) or path
						return string.format("![%s](%s)", path.name, path)
					end,
				},
				-- follow_url_func = function(url)
				--     -- Open the URL in the default web browser.
				--     vim.fn.jobstart({ "xdg-open", url }) -- linux
				-- end,
				picker = {
					name = "telescope.nvim",
					-- name = "fzf-lua",
				},
				legacy_commands = false,

				-- Optional, customize how note IDs are generated given an optional title.
				note_id_func = function(title)
					-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
					-- In this case a note with the title 'My new note' will be given an ID that looks
					-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
					local suffix = ""
					if title ~= nil then
						-- If title is given, transform it into valid file name.
						suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
					else
						-- If title is nil, just add 4 random uppercase letters to the suffix.
						for _ = 1, 4 do
							suffix = suffix .. string.char(math.random(65, 90))
						end
					end
					return tostring(os.time()) .. "-" .. suffix
				end,
			})
			-- vim.keymap.set("n", "gf", function()
			--     if require("obsidian").util.cursor_on_markdown_link() then
			--         return "<cmd>Obsidian follow_link<CR>"
			--     else
			--         return "gf"
			--     end
			-- end, { noremap = false, expr = true })
		end,
	},
	{
		"Myzel394/easytables.nvim",
		ft = "markdown",
		config = function()
			require("easytables").setup({
				-- Your configuration comes here
			})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = "cd app && yarn install",
		-- build = function()
		--   vim.fn["mkdp#util#install"]()
		-- end,
		-- build = "cd app && npm install && git reset --hard",
		config = function()
			vim.cmd([[
        let g:mkdp_auto_start = 0
        let g:mkdp_auto_close = 1
        let g:mkdp_refresh_slow = 0
        let g:mkdp_command_for_global = 0
        let g:mkdp_open_to_the_world = 0
        let g:mkdp_open_ip = ''
        let g:mkdp_browser = ''
        let g:mkdp_echo_preview_url = 0

        " Function to open all previews in different windows

				" function OpenMarkdownPreview (url)
        " let appname = "qutebrowser"
        " let pid = system("pgrep -f " . appname)
        " if pid != ""
				"   execute "silent ! qutebrowser --target=window " . a:url
        " else
				"   execute "!qutebrowser " . a:url . " &"
        " endif
				" endfunction
        
        " Function to open all previews in the same window

        function OpenMarkdownPreview (url)
				  execute "! qutebrowser " . a:url . " &"
				endfunction

				let g:mkdp_browserfunc = 'OpenMarkdownPreview'
        let g:mkdp_preview_options = {
            \ 'mkit': {},
            \ 'katex': {},
            \ 'uml': {},
            \ 'maid': {},
            \ 'disable_sync_scroll': 0,
            \ 'sync_scroll_type': 'middle',
            \ 'hide_yaml_meta': 1,
            \ 'sequence_diagrams': {},
            \ 'flowchart_diagrams': {},
            \ 'content_editable': v:false,
            \ 'disable_filename': 0,
            \ 'toc': {}
            \ }
        let g:mkdp_markdown_css = ''
        let g:mkdp_highlight_css = ''
        let g:mkdp_port = ''
        let g:mkdp_page_title = '「${name}」'
        let g:mkdp_filetypes = ['markdown']
        let g:mkdp_theme = 'dark'
			]])
		end,
	},
}
