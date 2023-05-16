return {

  -- measure startuptime
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
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

  -- colorschemes
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "gruvbox"
    end
  },

  { "catppuccin/nvim" },

  { 'rose-pine/neovim' },


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

  -- indention level objects
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

  -- lspconfig setup for neovim config files
  {
    "folke/neodev.nvim",
    config = function()
      require("plugins.plugins_config.neodev")
    end,
  },

  -- quarto support
  {
    'quarto-dev/quarto-nvim',
    dev = false,
    dependencies = {
      { 'hrsh7th/nvim-cmp' },
      { 'jmbuhr/otter.nvim', dev = false },
      config = function()
        require("plugins.plugins_config.quarto")
      end
    },
  },

  -- send code to repl
  {
    'jpalardy/vim-slime',
    config = function()
      require("plugins.plugins_config.slime")
    end,
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
          pcall(vim.cmd, 'MasonUpdate')
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
  { "jose-elias-alvarez/null-ls.nvim" },
  { "ChristianChiarulli/swenv.nvim" },
  { "stevearc/dressing.nvim" },
  { "nvim-neotest/neotest-python" },
  { "nvim-neotest/neotest" },

  -- debugging
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
        config = function()
          require("plugins.plugins_config.nvim-dap-ui")
        end
      },
      { 'mfussenegger/nvim-dap-python' },
    },
  },

  -- git integration
  {
    'TimUntersberger/neogit',
    lazy = true,
    cmd = 'Neogit',
    config = function()
      require('neogit').setup {
        disable_commit_confirmation = true,
        integrations = {
          diffview = true
        }
      }
    end
  },

  {
  'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {}
  end
  },

  {
    'akinsho/git-conflict.nvim',
    config = function()
      require('git-conflict').setup {
        default_mappings = true,
        disable_diagnostics = true,
      }
    end
  },

  -- projects
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {}
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
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  },

  -- syntax highlighs
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = {
        'r',
        'python',
        'markdown',
        'markdown_inline',
        'julia',
        'yaml',
        'lua',
        'vim',
        'query',
        'latex'
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
  },

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
  { 'nvim-telescope/telescope-project.nvim' },

  -- statusbar
  { 'nvim-lualine/lualine.nvim',
    config = function()
      require("plugins.plugins_config.lualine")
    end
  },

  -- tab bar
  {
    'nanozuki/tabby.nvim',
    config = function()
      require('tabby.tabline').use_preset('tab_only')
    end
  },

  -- vertical scrollbars
  {
    'dstein64/nvim-scrollview',
    config = function()
      require('scrollview').setup({
        current_only = true,
      })
    end
  },

  -- show keybinding help window
  {
    'folke/which-key.nvim',
    config = function()
      require("plugins.plugins_config.whichkey")
    end,
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

  -- enhanced terminal usage
  {
    "akinsho/toggleterm.nvim", version = '*',
    config = function()
      require("plugins.plugins_config.toggleterm")
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

}

