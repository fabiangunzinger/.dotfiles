--  bootstrap lazy package manager
--  <https://github.com/folke/lazy.nvim>
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)



local plugins = {

}

local opts = {}

require("lazy").setup({

  -- { 'nvim-treesitter/nvim-treesitter' },
  --
  -- -- welcome screen
  -- { 
  --   'goolord/alpha-nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- },
  --
  -- -- object finder
  -- {
  --   'nvim-telescope/telescope.nvim',
  --   tag = '0.1.1',
  --   dependencies = { 'nvim-lua/plenary.nvim'},
  -- },
  -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  -- -- { 'nvim-telescope/telescope-dap.nvim' },
  -- { 'nvim-telescope/telescope-ui-select.nvim' },
  -- { 'nvim-telescope/telescope-file-browser.nvim' },
  -- { 'nvim-telescope/telescope-project.nvim' },
  --
  -- -- statusbar
  -- { 'nvim-lualine/lualine.nvim',
  -- },
  --
  -- -- tab bar
  -- { 
  --   'nanozuki/tabby.nvim',
  --   config = function()
  --     require('tabby.tabline').use_preset('tab_only')
  --   end
  -- },
  --
  -- -- vertical scrollbars
  -- { 
  --   'dstein64/nvim-scrollview',
  --   config = function()
  --     require('scrollview').setup({
  --       current_only = true,
  --     })
  --   end
  -- },
  --
  -- -- filetree
  -- { 
  --   "nvim-tree/nvim-tree.lua",
  --   version = "*",
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --   },
  -- },
  --
  -- -- show keybinding help window
  -- { 'folke/which-key.nvim' },
  -- { 'simrat39/symbols-outline.nvim', config = function()
  --   require("symbols-outline").setup()
  -- end },
  --
  -- -- enhanced terminal usage
  -- { "akinsho/toggleterm.nvim", version = '*', config = function()
  --   require("toggleterm").setup {
  --     open_mapping = [[<c-\>]],
  --     direction = 'float',
  --   }
  -- end
  -- },
  --
  -- -- pretty diagnostics list
  -- { "folke/trouble.nvim", config = function()
  --   require("trouble").setup {}
  -- end
  -- },
  --
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
  --
  -- -- smooth vim and tmux navigation
  -- {'christoomey/vim-tmux-navigator'},
  -- -- quarto support
  --
  -- -- {'quarto-dev/quarto-nvim',
  -- --   ft = 'quarto',
  -- --   dependencies = {
  -- --     { 'hrsh7th/nvim-cmp' },
  -- --     { 'neovim/nvim-lspconfig' },
  -- --     { 'nvim-treesitter/nvim-treesitter' },
  -- --     { 'jmbuhr/otter.nvim',
  -- --     },
  -- --     -- note: needs additional vim highlighting enabled
  -- --     -- for markdown in treesitter.lua
  -- --     { 'vim-pandoc/vim-pandoc-syntax' },
  -- --   },
  -- -- },
  -- 
  -- -- send code from python/r/qmd docuemts to the terminal
  -- -- thanks to tmux can be used for any repl
  -- { 'jpalardy/vim-slime',
  --   init = function()
  --     vim.b.slime_cell_delimiter = "#%%"
  --     -- -- slime, tmux
  --     -- vim.g.slime_target = 'tmux'
  --     -- vim.g.slime_bracketed_paste = 1
  --     -- vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }
  --
  --     -- slime, neovvim terminal
  --     vim.g.slime_target = "neovim"
  --     -- vim.g.slime_python_ipython = 1
  --     --
  --   end
  -- },
  --
  -- {
  --   "catppuccin/nvim",
  -- },
  --
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  -- },
  --
  -- { 'rose-pine/neovim', name = 'rose-pine' },
  --
  -- { 'folke/tokyonight.nvim' },
  --
  -- -- common dependencies
  -- { 'nvim-lua/plenary.nvim' },
  --
  -- -- use . after plugin map
  -- { 'tpope/vim-repeat' },
  --
  -- -- use quickfix for bulk change/replace
  -- {'stefandtw/quickfix-reflector.vim'},
  --
  -- -- useful surround shortcuts
  -- { 'tpope/vim-surround' },
  --
  -- -- tabular formatting
  -- { 'godlygeek/tabular' },
  --
  -- -- powerful substitution and case conversions
  -- { 'tpope/vim-abolish' },
  --
  -- -- complementary pairs of mappings
  -- {'tpope/vim-unimpaired'},
  --
  -- -- indendion level objects 
  -- {'michaeljsmith/vim-indent-object'},
  --
  -- -- Python objects 
  -- {'jeetsukumaran/vim-pythonsense'},
  --
  -- -- jump to search matches
  -- {'easymotion/vim-easymotion'},
  --
  -- -- distraction free writing
  -- {
  --   "folke/zen-mode.nvim",
  -- },
  --
  -- -- fast search
  -- { 'BurntSushi/ripgrep' },
  --
  -- -- paste an image to markdown from the clipboard
  -- -- with :PasteImg,
  -- {'ekickx/clipboard-image.nvim'},
  --
  -- -- highlight yanked region
  -- {'machakann/vim-highlightedyank'},
  --
  -- -- smart commenting
   {
     'numToStr/Comment.nvim',
     version = nil,
     branch = 'master',
     config = function()
       require('Comment').setup {}
     end
  },
  --
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
  --
  -- {
  -- 'lewis6991/gitsigns.nvim',
  --   config = function()
  --     require('gitsigns').setup {}
  -- end
  -- },
  --
  -- {
  --   'akinsho/git-conflict.nvim',
  --   config = function()
  --     require('git-conflict').setup {
  --       default_mappings = true,
  --       disable_diagnostics = true,
  --     }
  -- end
  -- },
})
