return {
  'epwalsh/obsidian.nvim',
  cmd = { "ObsidianSearch", "ObsidianQuickSwitch", "ObsidianOpen" },
  ft = "markdown",
  prioriy = 100,
  -- event = "InsertEnter",
  dependencies = {
    'junegunn/fzf.vim'
  },
  opts = {
    dir = "/home/lummyn/Sync/",
    completion = {
      nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
    },
    daily_notes = {
      -- folder = "Diary/2023/April/",
    }
  }
}
