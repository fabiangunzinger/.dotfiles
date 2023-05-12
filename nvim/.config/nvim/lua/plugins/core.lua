return {

  -- common dependencies
  { 'nvim-lua/plenary.nvim' },

  -- smart commenting
  {
    'numToStr/Comment.nvim',
    version = nil,
    branch = 'master',
    config = function()
      require('Comment').setup {}
    end
  },

  -- smooth vim and tmux navigation
  {'christoomey/vim-tmux-navigator'},

  -- filetree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require('plugins.plugins_config.nvim-tree')
    end
  },
}
