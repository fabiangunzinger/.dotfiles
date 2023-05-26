local plugins = {

  -- common dependencies
  { 'nvim-lua/plenary.nvim', commit = "5254482" },
  { "nvim-tree/nvim-web-devicons", commit = "986875b" },

  -- quick file navigation
  { 'ThePrimeagen/harpoon', commit = "8cb54c4" },

  -- object finder
  { 'nvim-telescope/telescope.nvim', commit = "6d3fbff" },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', commit = "580b6c4" },
  { 'nvim-telescope/telescope-dap.nvim', commit = "313d2ea" },
  { 'nvim-telescope/telescope-ui-select.nvim', commit = "62ea5e5" },
  { 'nvim-telescope/telescope-file-browser.nvim', commit = "1aa7f12" },

  -- filetree
  { "nvim-tree/nvim-tree.lua", commit = "736c7ff" },

  -- statusbar
  { 'nvim-lualine/lualine.nvim', commit = "05d78e9" },

  -- show keybinding help window
  { 'folke/which-key.nvim', version = "1.4.2" },

  -- lsp
  { "williamboman/mason.nvim", version = "1.1.0" },
  { 'williamboman/mason-lspconfig.nvim', version = "1.4.0" },
  { 'neovim/nvim-lspconfig', version = "0.1.4" },
  { "jose-elias-alvarez/null-ls.nvim", commit = "77e53bc" },
  { "jay-babu/mason-null-ls.nvim", version = "2.0.2" },
  { "jay-babu/mason-null-ls.nvim", commit = "1fcf055" },

  -- syntax highlighs
  { 'nvim-treesitter/nvim-treesitter', commit = "05df88e" },
  { 'nvim-treesitter/nvim-treesitter-textobjects', commit = "95b76b9" },

  -- testing
  { "nvim-neotest/neotest", version = "3.2.2" },
  { "nvim-neotest/neotest-python", commit = "6c06041" },

  -- debugging
  { 'mfussenegger/nvim-dap', version = "0.6.0" },
  { 'rcarriga/nvim-dap-ui', version = "3.8.1" },
  { "mfussenegger/nvim-dap-python", commit = "51ecb08" },

  -- enhanced terminal usage
  { "akinsho/toggleterm.nvim", commit = "026dff5" },

  -- quarto support
  { 'jmbuhr/otter.nvim', commit = "4630e71" },
  { 'quarto-dev/quarto-nvim', commit = "66791ef" },

  -- use . after plugin map
  { 'tpope/vim-repeat', commit = "24afe92" },

  -- unix shell commands
  { 'tpope/vim-eunuch', commit = "291ef1f" },

  -- useful surround shortcuts
  { 'tpope/vim-surround', commit = "3d188ed" },

  -- powerful substitution and case conversions
  { 'tpope/vim-abolish', commit = "cb3dcb2" },

  -- complementary pairs of mappings
  { 'tpope/vim-unimpaired', commit = "6d44a6d" },

  -- use quickfix for bulk change/replace
  { 'stefandtw/quickfix-reflector.vim', version = "0.1" },

  -- smart commenting
  { 'numToStr/Comment.nvim', commit = "e1fe531" },

  -- tabular formatting
  { 'godlygeek/tabular', version = "1.0.0" },

  -- indention level objects
  { 'michaeljsmith/vim-indent-object', version = "1.1.2" },

  -- distraction free writing
  { "folke/zen-mode.nvim", tag = "v1.2.0" },

  -- highlight yanked region
  { 'machakann/vim-highlightedyank', commit = "fa3f57b" },
 
  -- lspconfig setup for neovim config files
  { "folke/neodev.nvim", version = "2.5.2" },

  -- git
  { 'akinsho/git-conflict.nvim', version = "1.1.2" },
  { 'lewis6991/gitsigns.nvim', version = "0.6" },

  -- send code to repl
  { 'jpalardy/vim-slime', commit = "bb15285" },

  -- fast search
  { 'BurntSushi/ripgrep', version = "13.0.0" },

  -- smooth vim and tmux navigation
  { 'christoomey/vim-tmux-navigator', version = "1.0" },

  -- measure startuptime
  { "dstein64/vim-startuptime", version = "4.4.0" },

  -- snippets
  { 'honza/vim-snippets', version = "1.0.0" },
  { "L3MON4D3/LuaSnip", version = "1.2.1" },

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
  },

  -- colorschemes
  { 
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    version = "1.2.1",
    config = function()
      vim.cmd("colorscheme catppuccin-macchiato")
    end,
  },

  -- ai support
  { "github/copilot.vim" },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
}


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=v9.16.1",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup(plugins)
