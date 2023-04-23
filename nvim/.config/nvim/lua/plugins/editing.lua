return {
  -- use . after plugin map
  { 'tpope/vim-repeat' },

  -- useful surround shortcuts
  { 'tpope/vim-surround' },

-- powerful substitution and case conversions
  {'tpope/vim-abolish'},

-- complementary pairs of mappings
  {'tpope/vim-unimpaired'},

  { 'lukas-reineke/indent-blankline.nvim', config = function()
    require("indent_blankline").setup {
      show_current_context = true,
      show_current_context_start = false,
    }
  end
  },

  -- smart commenting
  { 'numToStr/Comment.nvim',
    version = nil,
    branch = 'master',
    config = function()
    require('Comment').setup {}
  end
  },

  { "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true
  },

  -- fuzzy search
  {'ggVGc/vim-fuzzysearch',
    init = function()
      vim.g.fuzzysearch_prompt = '/'
      vim.g.fuzzysearch_match_spaces  = 1
    end
  },
  {'godlygeek/tabular'},   -- tabular formatting
  {'plasticboy/vim-markdown'},   -- markdown support 

  -- -- ripgrep search 
  -- {'jremmen/vim-ripgrep',   
  --   init = function()
  --     -- use smartcase by default
  --     vim.g.rg_command = 'rg --vimgrep -S'
  --   end
  -- },
   {'BurntSushi/ripgrep'},

  --
  -- highlight yanked region
  {'machakann/vim-highlightedyank'},

  -- distraction free writing
  -- {'junegunn/goyo.vim'}, 
  {"folke/zen-mode.nvim",
    config = function()
      require("plugins.config.zenmode")
    end
  },

  -- use quickfix for bulk change/replace
  {'stefandtw/quickfix-reflector.vim'},

  -- indendion level objects 
  {'michaeljsmith/vim-indent-object'},

  -- Python objects 
  {'jeetsukumaran/vim-pythonsense'},

  -- jump to search matches
  {'easymotion/vim-easymotion'},
}

