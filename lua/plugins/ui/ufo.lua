return {
	"kevinhwang91/nvim-ufo",
	event = "BufReadPost",
	-- event = { "BufRead", "BufNewFile" },
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		local ufo_status_ok, ufo = pcall(require, "ufo")
		if not ufo_status_ok then
			return
		end
		local handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local totalLines = vim.api.nvim_buf_line_count(0)
			local foldedLines = endLnum - lnum
			local suffix = (" 󰁂 %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					-- str width returned from truncate() may less than 2nd argument, need padding
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			local rAlignAppndx = math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
			suffix = (" "):rep(rAlignAppndx) .. suffix
			table.insert(newVirtText, { suffix, "MoreMsg" })
			return newVirtText
		end
		ufo.setup({
			fold_virt_text_handler = handler,
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
			open_fold_hl_timeout = 150,
			close_fold_kinds_for_ft = {
				default = { "imports", "comment" },
				json = { "array" },
				c = { "comment", "region" },
			},
			preview = {
				win_config = {
					border = { "", "─", "", "", "", "─", "", "" },
					-- border = "rounded",
					winhighlight = "Normal:Folded",
					winblend = 0,
				},
				mappings = {
					scrollU = "<C-u>",
					scrollD = "<C-d>",
					jumpTop = "[",
					jumpBot = "]",
				},
			},
		})
		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
		vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
		vim.keymap.set("n", "Z", function()
			local winid = require("ufo").peekFoldedLinesUnderCursor()
			if not winid then
				-- choose one of coc.nvim and nvim lsp
				-- vim.fn.CocActionAsync("definitionHover") -- coc.nvim
				-- vim.lsp.buf.hover()
				vim.cmd([[ Lspsaga hover_doc ]])
			end
		end)
	end,
}
