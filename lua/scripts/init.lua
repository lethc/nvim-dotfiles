-- vim.cmd([[ hi! CursorLineBG guibg=#61afef guifg=#1e222a ]])
vim.cmd([[ hi! CursorLineBG guibg=#d4b87a guifg=#1e222a ]])

-- Load keymaps after plugins are set up
local ok_keymaps, err_keymaps = pcall(require, "config.keymaps")

if not ok_keymaps and not err_keymaps:find("not found") then
	vim.notify("Error loading config.keymaps: " .. err_keymaps, vim.log.levels.ERROR)
end

-- Load additional functions
local ok_functs, err_functs = pcall(require, "config.functs")
if not ok_functs and not err_functs:find("not found") then
	vim.notify("Error loading config.functions: " .. err_functs, vim.log.levels.ERROR)
end
-- vim.deprecate = function() end -- Hide deprecation warnings (plugins should update soon)
-- MD_to_Anki script
local md_to_anki = require("scripts.md_to_anki")
-- <leader>ak : ejecuta md-to-anki preguntando -n, -i y --sync
vim.keymap.set("n", "<leader>ak", md_to_anki.run, {
  desc = "md-to-anki: generar flashcards desde la nota actual",
})
-- <leader>aK (opcional): ejecuta con los valores por defecto, sin preguntar nada
vim.keymap.set("n", "<leader>aK", md_to_anki.run_rapido, {
  desc = "md-to-anki: generar flashcards (rapido, sin preguntas)",
})
