return {

  -- statusbar
  { 'nvim-lualine/lualine.nvim',
    config = function()
      require("plugins.config.lualine")
    end
  },

  -- tabbar
  { 
    'nanozuki/tabby.nvim',
    config = function()
      require('tabby.tabline').use_preset('tab_only')
    end
  },

  -- vertical scrollbars
  { 'dstein64/nvim-scrollview', config = function()
    require('scrollview').setup({
      current_only = true,
    })
  end
  },

  -- filetree
  { "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },

  -- show keybinding help window
  { 'folke/which-key.nvim' },
  { 'simrat39/symbols-outline.nvim', config = function()
    require("symbols-outline").setup()
  end },

  -- enhanced terminal usage
  { "akinsho/toggleterm.nvim", version = '*', config = function()
    require("toggleterm").setup {
      open_mapping = [[<c-\>]],
      direction = 'float',
    }
  end
  },

  -- pretty diagnostics list
  { "folke/trouble.nvim", config = function()
    require("trouble").setup {}
  end
  },

  -- show blank lines
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = false,
      }
    end
  },

  -- smooth vim and tmux navigation
  {'christoomey/vim-tmux-navigator'},
}
