return {

  -- common dependencies
  {
    'nvim-lua/plenary.nvim',
    tag = "v0.1.3",
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
  { 'nvim-telescope/telescope-fzf-native.nvim', commit = "580b6c4", build = 'make' },
  { 'nvim-telescope/telescope-dap.nvim', commit = "313d2ea" },
  { 'nvim-telescope/telescope-ui-select.nvim', commit = "62ea5e5" },
  { 'nvim-telescope/telescope-file-browser.nvim', commit = "1aa7f12" },

  -- filetree
  {
    "nvim-tree/nvim-tree.lua",
    commit = "736c7ff59065275f0483af4b7f07a9bc41449ad0",
    dependencies = {
      {
        "nvim-tree/nvim-web-devicons",
        commit = "986875b7364095d6535e28bd4aac3a9357e91bbe"
      },
    },
    config = function()
      require('plugins.plugins_config.nvim-tree')
    end
  },

  -- statusbar
  { 
    'nvim-lualine/lualine.nvim',
    commit = "05d78e9fd0cdfb4545974a5aa14b1be95a86e9c9",
    config = function()
      require("plugins.plugins_config.lualine")
    end
  },

  -- show keybinding help window
  {
    'folke/which-key.nvim',
    version = "1.4.2",
    config = function()
      require("plugins.plugins_config.whichkey")
    end,
  },

  -- completion
  {
    'hrsh7th/nvim-cmp',
    version = "0.0.1",
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp', commit = "0e6b2ed" },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'f3fora/cmp-spell' },
      { 'ray-x/cmp-treesitter' },
      { 'kdheepak/cmp-latex-symbols' },
      { 'jmbuhr/cmp-pandoc-references' },
      { 'honza/vim-snippets' },
      { 'onsails/lspkind-nvim' },
      'LuaSnip',
    },
    config = function()
      require("plugins.plugins_config.cmp")
    end
  },

  -- lsp
  { "williamboman/mason.nvim", version = "1.1.0" },
  { 'williamboman/mason-lspconfig.nvim', version = "1.4.0" },
  { 'neovim/nvim-lspconfig', version = "0.1.4" },
  { "jose-elias-alvarez/null-ls.nvim", commit = "77e53bc" },
  { "jay-babu/mason-null-ls.nvim", version = "2.0.2" },
  -- { "jay-babu/mason-null-ls.nvim", commit = "1fcf055" },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    version = "1.2.1",
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
    commit = "05df88ebaa94d30d682d076244615786d9e7c1a5",
    config = function()
      require("plugins.plugins_config.treesitter")
    end
  },

  -- testing
  { "nvim-neotest/neotest", version = "3.2.2" },
  { 
    "nvim-neotest/neotest-python",
    commit = "6c06041cfb45f45e276068020baa06c06fe20d5c"
  },

  -- debugging
  { 'mfussenegger/nvim-dap', version = "0.6.0" },
  { 'rcarriga/nvim-dap-ui', version = "3.8.1" },
  { 
    "mfussenegger/nvim-dap-python", 
    commit = "51ecb08dbff57fca8add396b93dc765aba262e0a"
  },

  -- enhanced terminal usage
  {
    "akinsho/toggleterm.nvim",
    commit = "026dff5e2b504941cf172691561a67ea362596aa",
    config = function()
      require("plugins.plugins_config.toggleterm")
    end
  },

  -- quarto support
  {
    'quarto-dev/quarto-nvim',
    version = "0.10.0",
    dependencies = {
      { 'jmbuhr/otter.nvim', version = "0.12.0" },
      'nvim-cmp'
    },
    config = function()
      require("plugins.plugins_config.quarto")
    end
  },

  -- -- show blank lines
  -- {
  --   'lukas-reineke/indent-blankline.nvim',
  --   version = "2.20.4",
  --   config = function()
  --     require("plugins.plugins_config.indent-blankline")
  --   end
  -- },

  -- use . after plugin map
  { 'tpope/vim-repeat' },

  -- unix shell commands
  { 'tpope/vim-eunuch' },

  -- useful surround shortcuts
  { 'tpope/vim-surround' },

  -- powerful substitution and case conversions
  { 'tpope/vim-abolish' },

  -- complementary pairs of mappings
  { 'tpope/vim-unimpaired' },

  -- use quickfix for bulk change/replace
  { 'stefandtw/quickfix-reflector.vim', version = "0.1" },

  -- smart commenting
  {
    'numToStr/Comment.nvim',
    commit = "e1fe53117aab24c378d5e6deaad786789c360123",
    config = true,
  },

  -- tabular formatting
  { 'godlygeek/tabular', version = "1.0.0" },

  -- indention level objects
  { 'michaeljsmith/vim-indent-object', version = "1.1.2" },

  -- distraction free writing
  {
    "folke/zen-mode.nvim",
    tag = "v1.2.0",
    config = function()
      require("plugins.plugins_config.zen-mode")
    end
  },

  -- highlight yanked region
  { 
    'machakann/vim-highlightedyank', 
    commit = "fa3f57b097e9521ce41a66b6c7cf5d9adea70ea3" 
  },
 
  -- lspconfig setup for neovim config files
  {
    "folke/neodev.nvim",
    version = "2.5.2",
    config = function()
      require("plugins.plugins_config.neodev")
    end,
  },

  -- git
  {
    'akinsho/git-conflict.nvim',
    version = "1.1.2",
    config = function()
      require("plugins.plugins_config.git-conflict")
    end
  },

  {
    'lewis6991/gitsigns.nvim',
    version = "0.6",
    config = function()
      require('gitsigns').setup {}
    end
  },

  -- send code to repl
  {
    'jpalardy/vim-slime',
    commit = "bb152854fc21193729bf587aa055e738d50c8b48",
    config = function()
      require("plugins.plugins_config.slime")
    end,
  },

  -- fast search
  { 'BurntSushi/ripgrep', version = "13.0.0" },

  -- smooth vim and tmux navigation
  { 'christoomey/vim-tmux-navigator', version = "1.0" },

  -- measure startuptime
  {
    "dstein64/vim-startuptime",
    version = "4.4.0",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  -- colorschemes
  {
    "catppuccin/nvim",
    name = "catppuccin",
    version = "1.1.1",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-macchiato"
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

  -- quick file navigation
  { 
    'ThePrimeagen/harpoon', 
    commit = "8cb54c4",
  },

}
