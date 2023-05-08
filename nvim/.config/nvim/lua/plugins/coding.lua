return {

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
  { 'mfussenegger/nvim-dap' },
  { 'rcarriga/nvim-dap-ui' },
  { "mfussenegger/nvim-dap-python" },
}

