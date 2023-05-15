return {

  -- projects
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {}
    end
  },

  -- jump to search matches
  {'easymotion/vim-easymotion'},



  -- { "jose-elias-alvarez/null-ls.nvim" },
  -- { "ChristianChiarulli/swenv.nvim" },
  -- { "stevearc/dressing.nvim" },

  -- -- git integration
  -- {
  --   'TimUntersberger/neogit',
  --   lazy = true,
  --   cmd = 'Neogit',
  --   config = function()
  --     require('neogit').setup {
  --       disable_commit_confirmation = true,
  --       integrations = {
  --         diffview = true
  --       }
  --     }
  --   end
  -- },

  -- {
  -- 'lewis6991/gitsigns.nvim',
  --   config = function()
  --     require('gitsigns').setup {}
  -- end
  -- },

  -- object finder
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim'},
    config = function()
      require("plugins.plugins_config.telescope")
    end
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'nvim-telescope/telescope-dap.nvim' },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  { 'nvim-telescope/telescope-file-browser.nvim' },
  -- { 'nvim-telescope/telescope-project.nvim' },

  -- -- tab bar
  -- {
  --   'nanozuki/tabby.nvim',
  --   config = function()
  --     require('tabby.tabline').use_preset('tab_only')
  --   end
  -- },

  -- -- vertical scrollbars
  -- {
  --   'dstein64/nvim-scrollview',
  --   config = function()
  --     require('scrollview').setup({
  --       current_only = true,
  --     })
  --   end
  -- },

  -- show keybinding help window
  {
    'folke/which-key.nvim',
    config = function()
      require("plugins.plugins_config.whichkey")
    end,
  },

  -- -- pretty diagnostics list
  -- { "folke/trouble.nvim", config = function()
  --   require("trouble").setup {}
  -- end
  -- },

  -- -- show blank lines
  -- {
  --   'lukas-reineke/indent-blankline.nvim',
  --   config = function()
  --     require("indent_blankline").setup {
  --       show_current_context = true,
  --       show_current_context_start = false,
  --     }
  --   end
  -- },

  -- enhanced terminal usage
  {
    "akinsho/toggleterm.nvim", version = '*',
    config = function()
      require("plugins.plugins_config.toggleterm")
    end
  },

}

