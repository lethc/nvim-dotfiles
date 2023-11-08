return {
  -- ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  a = {
    name = "Harpoon",
    a = { [[<cmd>lua require("harpoon.mark").add_file()<CR>]], "Add File" },
    m = { [[<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]], "Toggle Menu" },
    q = { [[<cmd>lua require("harpoon.ui").nav_file(1)<CR>]], "Go to 1" },
    w = { [[<cmd>lua require("harpoon.ui").nav_file(2)<CR>]], "Go to 2" },
    e = { [[<cmd>lua require("harpoon.ui").nav_file(3)<CR>]], "Go to 3" },
    r = { [[<cmd>lua require("harpoon.ui").nav_file(4)<CR>]], "go to 4" },
    t = { [[<cmd>lua require("harpoon.ui").nav_file(5)<CR>]], "go to 5" },
    y = { [[<cmd>lua require("harpoon.ui").nav_file(6)<CR>]], "go to 6" },
    u = { [[<cmd>lua require("harpoon.ui").nav_file(7)<CR>]], "go to 7" },
    i = { [[<cmd>lua require("harpoon.ui").nav_file(8)<CR>]], "go to 8" },
    o = { [[<cmd>lua require("harpoon.ui").nav_file(9)<CR>]], "go to 9" },
  },
  b = {
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({sort_lastused = true, previewer = false}))<cr>",
    "Buffers",
  },

  c = {
    name = "Search-Replace",
    b = {
      name = "Search-Replace-MultiBuffer",
      e = { "<CMD>SearchReplaceMultiBufferCExpr<CR>", "[e]xpr" },
      f = { "<CMD>SearchReplaceMultiBufferCFile<CR>", "[f]ile" },
      o = { "<CMD>SearchReplaceMultiBufferOpen<CR>", "[o]pen" },
      s = {
        "<CMD>SearchReplaceMultiBufferSelections<CR>",
        "SearchReplaceMultiBuffer [s]elction list",
      },
      w = { "<CMD>SearchReplaceMultiBufferCWord<CR>", "[w]ord" },
      W = { "<CMD>SearchReplaceMultiBufferCWORD<CR>", "[W]ORD" },
    },
    e = { "<CMD>SearchReplaceSingleBufferCExpr<CR>", "[e]xpr" },
    f = { "<CMD>SearchReplaceSingleBufferCFile<CR>", "[f]ile" },
    o = { "<CMD>SearchReplaceSingleBufferOpen<CR>", "[o]pen" },
    s = { "<CMD>SearchReplaceSingleBufferSelections<CR>", "SearchReplaceSingleBuffer [s]elction list" },
    w = { "<CMD>SearchReplaceSingleBufferCWord<CR>", "[w]ord" },
    W = { "<CMD>SearchReplaceSingleBufferCWORD<CR>", "[W]ORD" },
  },

  d = {
    name = "Debug",
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
    l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
    O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
    g = {
      name = "Debug Rust",
      a = { "<cmd>RustCodeAction<cr>", "Code Action" },
      d = { "<cmd>RustDebuggables<cr>", "Run Debug" },
      r = { "<cmd>RustRun<cr>", "Run Code" },
    },
    x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
  },

  e = {
    name = "Explore",
    d = { [[<cmd>lua require("mini.files").open()<CR>]], "Directory" },
    e = { [[<cmd>lua require("mini.files").open(vim.api.nvim_buf_get_name(0))<CR>]], "File files" },
  },
  f = {
    name = "DiffView",
    c = { "<cmd>DiffviewClose<cr>", "Close DiffView" },
    f = { "<cmd>DiffviewFocusFiles<cr>", "Focus Files DiffView" },
    j = { "<cmd>DiffviewFileHistory %<cr>", "History Current File DiffView" },
    h = { "<cmd>DiffviewFileHistory<cr>", "History Files DiffView" },
    r = { "<cmd>DiffviewRefresh<cr>", "Refresh DiffView" },
    t = { "<cmd>DiffviewToggleFiles<cr>", "Toggle Files DiffView" },
    v = { "<cmd>DiffviewOpen<cr>", "Open DiffView" },
  },

  g = {
    name = "Git",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
  },

  i = {
    name = "Directory",
    i = { "<cmd>cd %:p:h<cr>:pwd<CR>", "Change Directory" },
    c = { "<cmd>lcd %:p:h<cr>:pwd<CR>", "Change Directory only for current window" },
    v = { "<cmd>pwd<cr>", "View Current Directory" },
  },

  l = {
    name = "LSP",
    -- Code action
    a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
    -- Call hierarchy
    c = {
      name = "Call hierarchy",
      i = { "<cmd>Lspsaga incoming_calls<cr>", "Incomming Calls" },
      o = { "<cmd>Lspsaga outgoing_calls<cr>", "Outgoing Calls" },
    },
    -- Show buffer diagnostics
    d = {
      "<cmd>Lspsaga show_buf_diagnostics<cr>",
      "Document Diagnostics",
    },
    -- Format file
    -- f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
    f = { [[<CMD>lua require("conform").format({ async = true, lsp_fallback = true })<CR>]], "Format" },
    g = {
      -- Go to definition
      -- Use <C-t> to jump back
      name = "Go To",
      i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to Implementation" },
      d = { "<cmd>Lspsaga goto_definition<cr>", "Go to Definition" },
      D = { "<cmd>Lspsaga goto_type_definition<cr>", "Go to Type Definition" },
    },
    -- LspInfo
    i = { "<cmd>LspInfo<cr>", "Info" },
    -- Diagnostic jump
    j = {
      "<cmd>Lspsaga diagnostic_jump_next<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>Lspsaga diagnostic_jump_prev<cr>",
      "Prev Diagnostic",
    },
    -- Keep hover
    K = { "<cmd>Lspsaga hover_doc ++keep<cr>", "Keep hover" },
    -- Show line diagnostics
    l = {
      "<cmd>Lspsaga show_line_diagnostics<cr>",
      "Line Diagnostic",
    },
    n = { "<cmd>Navbuddy<cr>", "Navbuddy" },
    -- Toggle outline
    o = { "<cmd>Lspsaga outline<cr>", "Toggle outline" },
    O = { "<cmd>Lspsaga term_toggle<cr>", "Toggle Terminal" },
    -- Peek Definition
    p = {
      name = "Peek...",
      d = { "<cmd>Lspsaga peek_definition<cr>", "Peek Definition" },
      D = { "<cmd>Lspsaga peek_type_definition<cr>", "Peek Type Definition" },
    },
    -- Rename all occurrences of the hovered word for the entire file
    r = { "<cmd>Lspsaga rename<cr>", "Rename" },
    -- Rename all occurrences of the hovered word for the selected files
    R = { "<cmd>Lspsaga rename ++project<cr>", "Rename Project" },
    -- Show LSP Status
    s = {
      name = "Status LSP",
      l = { "<cmd>LspStart ltex<cr>", "Start ltex" },
      s = { "<cmd>LspStop<cr>", "Stop LSP" },
      t = { "<cmd>LspStart tailwindcss<cr>", "Start ltex" },
    },
    -- LSP finder - Find the symbol's definition
    S = { "<cmd>Lspsaga finder def+ref+im<cr>", "Document Symbols" },
    t = {
      name = "Telescope",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      d = {
        "<cmd>Telescope diagnostics bufnr=0<cr>",
        "Document Diagnostics",
      },
      j = {
        "<cmd>lua vim.diagnostic.goto_next({buffer=0})<<CR>",
        "Next Diagnostic",
      },
      k = {
        "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
        "Prev Diagnostic",
      },
      K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "show hover" },
      l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "rename" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      S = {
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        "Workspace Symbols",
      },
      w = {
        "<cmd>Telescope diagnostics<cr>",
        "Workspace Diagnostics",
      },
    },
    -- Show cursor diagnostics
    u = {
      "<cmd>Lspsaga show_cursor_diagnostics<cr>",
      "Cursor Diagnostic",
    },
    -- Show Tailwind CSS values
    v = { "<cmd>TWValues<cr>", "Show tailwind CSS values" },
    -- Show workspace diagnostics
    w = {
      "<cmd>Lspsaga show_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    W = {
      "<cmd>Lspsaga show_workspace_diagnostics ++normal<cr>",
      "Workspace Diagnostics split",
    },
  },

  m = {
    name = "Markdown-Files",
    c = { "<cmd>MkdnTableNewColAfter<cr>", "TableNewColAfter" },
    C = { "<cmd>MkdnTableNewColBefore<cr>", "TableNewColBefore" },
    f = { "<cmd>MkdnFoldSection<cr>", "Fold" },
    F = { "<cmd>MkdnFoldSection<cr>", "Unfold" },
    -- l = { "<cmd>MkdnNewListItem<cr>", "NewList" },
    l = { "<cmd>MkdnExtendList<cr>", "NewListNoMove" },
    n = { "<cmd>MkdnCreateLink<cr>", "CreateLink" },
    N = { "<cmd>MkdnDestroyLink<cr>", "DestroyLink" },
    r = { "<cmd>MkdnTableNewRowBelow<cr>", "TableNewRowBelow" },
    R = { "<cmd>MkdnTableNewRowAbove<cr>", "TableNewRowAfter" },
    t = { "<cmd>MkdnTableFormat <cr>", "FormatTable" },
  },

  o = {
    name = "Obsidian",
    c = { "<cmd>PeekClose<CR>", "Close Peek" },
    e = { "<cmd>ObsidianTemplate<CR>", "Chose Template" },
    f = { "<cmd>ObsidianFollowLink<CR>", "Follow Link" },
    o = { "<cmd>ObsidianOpen<cr>", "Open File" },
    p = { "<cmd>PeekOpen<CR>", "Open Peek" },
    q = { "<cmd>ObsidianQuickSwitch<CR>", "Quick Switch" },
    s = { "<cmd>ObsidianSearch<CR>", "Obsidian Search" },
    t = { "<cmd>ObsidianToday<cr>", "Open Today File" },
    y = { "<cmd>ObsidianYesterday<cr>", "Open Yesterday File" },
  },

  p = {
    name = "Preview",
    h = { "<cmd>Bracey<CR>", "Preview HTML" },
    m = { "<cmd>MarkdownPreview<CR>", "Markdown" },
    M = { "<cmd>MarkdownPreviewStop<CR>", "Stop Markdown" },
    p = { "<cmd>PlantUMLRun<CR>", "Plantuml" },
    t = {
      "<cmd>VimtexCompile<CR>",
      "LaTeX",
      w = { "<cmd>VimtexCountWords<CR>", "spell word" },
      t = { "<cmd>VimtexCompile<CR>", "LaTeX" }
    },
  },

  r = {
    name = "Run Code",
    c = { "<cmd>RunCode<CR>", "Run Code" },
    f = { "<cmd>RunFile<CR>", "Run File" },
    p = { "<cmd>RunProject<CR>", "Run Project" },
    o = { "<cmd>CompilerOpen<CR>", "Open Compiler" },
  },

  s = {
    name = "Search",
    b = {
      "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Buffers",
    },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = {
      "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Find files",
    },
    F = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
    h = {
      name = "Help",
      c = { "<cmd>Telescope commands<cr>", "Commands" },
      h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    },
    i = { "<cmd>Telescope notify<CR>", "Notifications" },
    l = { "<cmd>Telescope registers<cr>", "Registers History" },
    m = { "<cmd>Telescope macros<cr>", "Macros" },
    n = { "<cmd>Telescope file_browser<cr>", "Telescope File Browser" },
    s = { "<cmd>Telescope smart_open<cr>", "Smart Open" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    t = {
      name = "Trouble.nvim",
      a = { "<cmd>TroubleToggle quickfix<cr>", "QuickFix" },
      c = { "<cmd>TroubleClose<cr>", "Close Trouble" },
      d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Trouble" },
      l = { "<cmd>TroubleToggle lsp_references<cr>", "lsp_references" },
      o = { "<cmd>TroubleRefresh<cr>", "Refresh Trouble" },
      r = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
      t = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
      w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Trouble" },
    },
  },

  t = {
    name = "Terminal",
    c = { "<cmd>Compile<cr>", "Compiler File" },
    h = { "<cmd>split | set norelativenumber | set nonumber  | terminal<cr>", "Horizontal Terminal" },
    v = { "<cmd>vsplit | set norelativenumber | set nonumber  | terminal<cr>", "Vertical Terminal" },
  },

  v = {
    name = "view",
    m = { "<cmd>mkview<cr>", "Make view" },
    l = { "<cmd>loadview<cr>", "Load View" },
  },

  w = {
    name = "Switch On",
    a = { "<cmd>lua require('asciitree').setup()<CR>", "AsciiTree" },
    b = { "<cmd>Block<CR>", "Toggle Block" },
    c = { "<cmd>ColorizerToggle<CR>", "Colours in current file" },
    d = { "<cmd>DBUIToggle<CR>", "Database UI" },
    e = { "<cmd>Themery<CR>", "Colorscheme picker" },
    h = { "<cmd>UndotreeToggle<CR>", "Current File History" },
    i = { "<cmd>CodeiumEnable<CR>", "Codeium" },
    I = { "<cmd>CodeiumDisable<CR>", "No Codeium" },
    m = { "<cmd>MinimapToggle<CR>", "MinMap" },
    o = { "<cmd>CccPick<CR>", "ColorPicker" },
    p = { "<cmd>lua require('clipboard-image').setup()<CR>", "Clipboard Images" },
    t = { "<cmd>TransparentEnable<CR>", "Transparency" },
    T = { "<cmd>TransparentDisable<CR>", "No Transparency" },
  },

  z = {
    name = "Lazy",
    a = { "<cmd>Lazy show<cr>", "Status" },
    c = { "<cmd>Lazy check<cr>", "Check" },
    i = { "<cmd>Lazy install<cr>", "Install" },
    s = { "<cmd>Lazy sync<cr>", "Sync" },
    u = { "<cmd>Lazy update<cr>", "Update" },
  },
}
