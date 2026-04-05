return {
	"zaldih/themery.nvim",
	-- event = "VeryLazy",
	config = function()
		local themery_status_ok, themery = pcall(require, "themery")
		if not themery_status_ok then
			return
		end
		themery.setup({
			themes = {
				-- "zenbones",
				-- "kanagawabones",
				-- "horizon",
				-- "horizon-extended",
				-- "mellow",
				-- "carbonfox",
				-- "ethereal",
				-- "ashen",
				"default",
				"vague",
				"oasis",

				"canon",
				"canon-onedark",
				"canon-onelight",
				"canon-github",
				"canon-dark_horizon",
				-- "oxocarbon",
				-- "nightblossom",
				-- "oneiroi-melatonin",
				-- "electron-vue-darker",
				-- "candyland",
				-- "sequoia-insomnia",
				-- "nightfall",
				-- "helix",
				-- "bloodmoon",
				-- "witchesbrew",
				-- "imperial",
				-- "nes",
				-- "coal",
				-- "yugen",
				-- "poimandres",
				-- "onedark",
				-- "onelight",
				-- "onedark_vivid",
				-- "onedark_dark",
				-- "vaporwave",
				-- "no-clown-fiesta",
			},
			-- themeConfigFile = "~/.config/nvim/lua/configs/ui/colorscheme.lua", -- Described below
			livePreview = true, -- Apply theme while browsing. Default to true.
		})
		vim.keymap.set("n", "<leader>th", function()
			local currentTheme = themery.getCurrentTheme()
			if currentTheme and currentTheme.name == "canon-onedark" then
				themery.setThemeByName("canon-onelight", true)
			else
				themery.setThemeByName("canon-onedark", true)
			end
		end, { noremap = true })
	end,
}
