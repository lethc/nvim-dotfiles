return {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = {
        "html",
        "blade",
        "javascriptreact",
        "typescriptreact",
        "svelte",
        "php",
        -- "astro",
    },
    root_markers = { "index.html", ".git" },
    init_options = { provideFormatter = true },
}
