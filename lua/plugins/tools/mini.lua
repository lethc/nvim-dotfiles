return {
	"echasnovski/mini.ai",
	event = "CursorMoved",
	version = "*",
	config = function()
		local mini_ai_ok, mini_ai = pcall(require, "mini.ai")
		if not mini_ai_ok then
			return
		end
		local gen_spec = require("mini.ai").gen_spec
		mini_ai.setup({
			n_lines = 500,
			custom_textobjects = {
				-- b = pair("(", ")"),
				-- B = pair("{", "}"),
				-- r = pair("[", "]"),
				-- q = pair("'"),
				-- Q = pair('"'),
				-- a = pair("`"),

				F = gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
				["p"] = gen_spec.treesitter({ a = "@parameter.outer", i = "@parameter.outer" }),
				c = gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
				o = gen_spec.treesitter({
					a = { "@conditional.outer", "@loop.outer", "@block.outer" },
					i = { "@conditional.inner", "@loop.inner", "@block.inner" },
				}),
				[";"] = gen_spec.treesitter({ a = "@comment.outer", i = "@comment.inner" }),

				e = function(ai_type)
					if ai_type == "i" then
						local first_non_blank = vim.fn.nextnonblank(1)
						local final_non_blank = vim.fn.prevnonblank(vim.fn.line("$"))
						local from = { line = first_non_blank, col = 1 }
						local to = { line = final_non_blank, col = math.max(vim.fn.getline(final_non_blank):len(), 1) }

						return { from = from, to = to }
					elseif ai_type == "a" then
						local from = { line = 1, col = 1 }
						local to = { line = vim.fn.line("$"), col = math.max(vim.fn.getline("$"):len(), 1) }

						return { from = from, to = to }
					end
				end,
			},
		})
	end,
}
