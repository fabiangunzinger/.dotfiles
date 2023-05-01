return {

  -- quarto support
  {
    'quarto-dev/quarto-nvim',
    ft = 'quarto',
    dependencies = {
      { 'hrsh7th/nvim-cmp' },
      { 'neovim/nvim-lspconfig' },
      { 'nvim-treesitter/nvim-treesitter' },
      { 'jmbuhr/otter.nvim',
        config = function()
          require("plugins.plugins_config.otter")
        end
      },
      -- note: needs additional vim highlighting enabled
      -- for markdown in treesitter.lua
      { 'vim-pandoc/vim-pandoc-syntax' },
    },
    config = function()
      require("plugins.plugins_config.quarto-nvim")
    end
  },

  -- send code from python/r/qmd docuemts to the terminal
  -- thanks to tmux can be used for any repl
  { 'jpalardy/vim-slime',
    init = function()
      vim.b.slime_cell_delimiter = "#%%"
      -- -- slime, tmux
      -- vim.g.slime_target = 'tmux'
      -- vim.g.slime_bracketed_paste = 1
      -- vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }

      -- slime, neovvim terminal
      vim.g.slime_target = "neovim"
      -- vim.g.slime_python_ipython = 1
      --
    end
  },
}

