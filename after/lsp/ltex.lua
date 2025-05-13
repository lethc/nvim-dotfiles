return {
    settings = {
        ltex = {
            language = "en-GB",
            -- language =  "es",
            -- dictionary = {"en-GB":["nvim", "linux"]},
            -- In markdown file add lang: es, https://valentjn.github.io/ltex/advanced-usage.html#magic-comments
        },
        enabled = {
            "bibtex",
            "gitcommit",
            "markdown",
            "org",
            "tex",
            "restructuredtext",
            "rsweave",
            "latex",
            "quarto",
            "rmd",
            "context",
            "html",
            "xhtml",
            "mail",
            "plaintext",
        },
    },
    -- filetypes = { "bib", "gitcommit", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc", "markdown" }
    filetypes = { "org", "latex" },
}
