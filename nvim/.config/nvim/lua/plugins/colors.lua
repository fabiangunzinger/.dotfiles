return {
  {
    "catppuccin/nvim",
    config = function()
      require("plugins.plugins_config.catppuccin")
    end
  },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
  },

	{ 'rose-pine/neovim', name = 'rose-pine' },

  { 'folke/tokyonight.nvim' }

}
