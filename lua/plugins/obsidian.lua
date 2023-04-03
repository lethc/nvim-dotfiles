return {
  'epwalsh/obsidian.nvim',
  prioriy = 100,
  -- event = "InsertEnter",
  dependencies = {
    'junegunn/fzf.vim'
  },
  opts = {
    dir = "~/Sync/lummyn",
    completion = {
      nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
    },
    daily_notes = {
      folder = "Diary/2023/March",
    }
  }
}

