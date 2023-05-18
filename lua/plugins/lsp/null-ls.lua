return {
  -- "jay-babu/mason-null-ls.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    -- local mason_null_ls_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
    -- if not mason_null_ls_status_ok then
    --   return
    -- end

    local null_ls_status_ok, null_ls = pcall(require, "null-ls")
    if not null_ls_status_ok then
      return
    end

    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics

    -- mason_null_ls.setup({
    --   -- ensure_installed = { "stylua", "jq", "black", "google_java_format", "phpcsfixer", "prettier" },
    --   automatic_setup = true,
    -- })

    null_ls.setup({
      debug = false,
      sources = {
        formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
        formatting.black.with({ extra_args = { "--fast" } }),
        formatting.stylua,
        formatting.google_java_format,
        -- diagnostics.flake8
      },
    })
  end,
}
