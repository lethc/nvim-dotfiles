return
{
   "oclay1st/maven.nvim",
   enabled = true,
   cmd = { "Maven", "MavenInit", "MavenExec", "MavenFavorites" },
   dependencies = {
      "MunifTanjim/nui.nvim",
   },
   opts = {}, -- options, see default configuration
   keys = {
      { '<leader>M', desc = '+Maven' ,  mode = { 'n', 'v' } },
      { '<leader>Mm', '<cmd>Maven<cr>', desc = 'Maven Projects' },
      { '<leader>Mf', '<cmd>MavenFavorites<cr>', desc = 'Maven Favorite Commands' }
   }
}
