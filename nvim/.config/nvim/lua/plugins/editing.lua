return {

  -- ChatGPT integration
  {
    "jackMort/ChatGPT.nvim",
      event = "VeryLazy",
      dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
      },
      config = function()
        require("plugins.plugins_config.chatgpt")
      end,
  },

  -- use . after plugin map
  { 'tpope/vim-repeat' },

  -- unix shell commands
  { 'tpope/vim-eunuch' },

  -- use quickfix for bulk change/replace
  {'stefandtw/quickfix-reflector.vim'},

  -- useful surround shortcuts
  { 'tpope/vim-surround' },

  -- tabular formatting
  { 'godlygeek/tabular' },

-- powerful substitution and case conversions
  { 'tpope/vim-abolish' },

-- complementary pairs of mappings
  {'tpope/vim-unimpaired'},

  -- indendion level objects
  {'michaeljsmith/vim-indent-object'},

  -- jump to search matches
  {'easymotion/vim-easymotion'},

  -- distraction free writing
  {
    "folke/zen-mode.nvim",
    config = function()
      require("plugins.plugins_config.zen-mode")
    end
  },

  -- fast search
  { 'BurntSushi/ripgrep' },

  -- highlight yanked region
  {'machakann/vim-highlightedyank'},

  -- smart commenting
  {
    'numToStr/Comment.nvim',
    version = nil,
    branch = 'master',
    config = function()
      require('Comment').setup {}
    end
  },

}

