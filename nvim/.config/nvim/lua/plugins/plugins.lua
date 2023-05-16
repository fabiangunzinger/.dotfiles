return {

  -- common dependencies
  { 'nvim-lua/plenary.nvim' },

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

  -- statusbar
  { 'nvim-lualine/lualine.nvim',
    config = function()
      require("plugins.plugins_config.lualine")
    end
  },

  -- show keybinding help window
  {
    'folke/which-key.nvim',
    config = function()
      require("plugins.plugins_config.whichkey")
    end,
  },

  -- completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'f3fora/cmp-spell' },
      { 'ray-x/cmp-treesitter' },
      { 'kdheepak/cmp-latex-symbols' },
      { 'jmbuhr/cmp-pandoc-references' },
      { 'L3MON4D3/LuaSnip' },
      { 'honza/vim-snippets' },
      { 'onsails/lspkind-nvim' },
    },
    config = function()
      require("plugins.plugins_config.cmp")
    end
  },

  -- lsp
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      {'neovim/nvim-lspconfig'},
      {
        'williamboman/mason.nvim',
        build = function()
          vim.cmd('MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    },
    config = function()
      require('plugins.plugins_config.lsp')
    end
  },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    version = 1,
    dependencies = {
      'honza/vim-snippets',
      config = function()
        require("luasnip.loaders.from_snipmate").lazy_load()
      end,
    },
    config = function()
      require("plugins.plugins_config.luasnip")
    end,
  },

  -- syntax highlighs
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require("plugins.plugins_config.treesitter")
    end
  },

  -- testing
  { "nvim-neotest/neotest-python" },
  { "nvim-neotest/neotest" },

  -- debugging
  { 'mfussenegger/nvim-dap' },
  { 'rcarriga/nvim-dap-ui' },
  { "mfussenegger/nvim-dap-python" },

  -- enhanced terminal usage
  {
    "akinsho/toggleterm.nvim", version = '*',
    config = function()
      require("plugins.plugins_config.toggleterm")
    end
  },

  -- quarto support
  {
    'quarto-dev/quarto-nvim',
    dev = false,
    dependencies = {
      { 'hrsh7th/nvim-cmp' },
      { 'jmbuhr/otter.nvim'},
    },
    config = function()
      require("plugins.plugins_config.quarto")
    end
  },

  -- use . after plugin map
  { 'tpope/vim-repeat' },

  -- unix shell commands
  { 'tpope/vim-eunuch' },

  -- useful surround shortcuts
  { 'tpope/vim-surround' },

-- powerful substitution and case conversions
  { 'tpope/vim-abolish' },

-- complementary pairs of mappings
  {'tpope/vim-unimpaired'},

  -- use quickfix for bulk change/replace
  {'stefandtw/quickfix-reflector.vim'},

  -- smart commenting
  {
    'numToStr/Comment.nvim',
    version = nil,
    branch = 'master',
    config = true,
  },

  -- tabular formatting
  { 'godlygeek/tabular' },

  -- indention level objects
  {'michaeljsmith/vim-indent-object'},

  -- distraction free writing
  {
    "folke/zen-mode.nvim",
    config = function()
      require("plugins.plugins_config.zen-mode")
    end
  },

  -- highlight yanked region
  {'machakann/vim-highlightedyank'},

  -- lspconfig setup for neovim config files
  {
    "folke/neodev.nvim",
    config = function()
      require("plugins.plugins_config.neodev")
    end,
  },

  -- git
  {
    'akinsho/git-conflict.nvim',
    version = "*",
    config = function()
      require("plugins.plugins_config.git-conflict")
    end
  },

  -- send code to repl
  {
    'jpalardy/vim-slime',
    config = function()
      require("plugins.plugins_config.slime")
    end,
  },

  -- fast search
  { 'BurntSushi/ripgrep' },

  -- smooth vim and tmux navigation
  {'christoomey/vim-tmux-navigator'},

  -- measure startuptime
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  -- colorschemes
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "gruvbox"
    end
  },

  -- copilot
  {
    "github/copilot.vim",
    config = function()
      require("plugins.plugins_config.copilot")
    end,
  },

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

  -- -- projects
  -- {
  --   "ahmedkhalf/project.nvim",
  --   config = function()
  --     require("project_nvim").setup {}
  --   end
  -- },
  --
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

  -- { "jose-elias-alvarez/null-ls.nvim" },
  -- { "ChristianChiarulli/swenv.nvim" },
  -- { "stevearc/dressing.nvim" },

  -- -- pretty diagnostics list
  -- { "folke/trouble.nvim", config = function()
  --   require("trouble").setup {}
  -- end
  -- },

}
