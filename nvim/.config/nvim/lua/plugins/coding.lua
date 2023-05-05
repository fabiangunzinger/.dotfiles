return {
  -- quarto support
  {
    'quarto-dev/quarto-nvim',
    dev = false,
    dependencies = {
      { 'hrsh7th/nvim-cmp' },
      {
        'jmbuhr/otter.nvim',
        dev = false,
      },
      config = function()
        require 'quarto'.setup {
          debug = false,
          closePreviewOnExit = true,
          lspFeatures = {
            enabled = true,
            languages = { 'r', 'python', 'julia', 'bash', 'lua' },
            chunks = 'curly', -- 'curly' or 'all'
            diagnostics = {
              enabled = true,
              triggers = { "BufWritePost" }
            },
            completion = {
              enabled = true,
            },
          },
          keymap = {
            hover = 'K',
            definition = 'gd'
          },
        }
      end
    },
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

      local lsp = require('lsp-zero').preset({})
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")

      -- mason setup - and automatically install
      -- uninstalled language servers
      require("mason").setup()
      require("mason-lspconfig").setup({
        automatic_installation = true
      })

      -- lsp setup 
      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({
          buffer = bufnr,
          preserve_mappings = false
        })
      end)

      lsp.setup()

      -- language server serup
      lspconfig.r_language_server.setup({})

      -- also requires:
      -- $home/.config/marksman/config.toml :
      -- [core]
      -- markdown.file_extensions = ["md", "markdown", "qmd"]
      lspconfig.marksman.setup {
        filetypes = { 'markdown', 'quarto' },
        root_dir = util.root_pattern(".git", ".marksman.toml", "_quarto.yml"),
      }

      -- language server for grammar and spelling
      lspconfig.ltex.setup {
        filetypes = { "markdown", "tex", "quarto" },
      }

      -- not upadated yet in automatic mason-lspconfig install,
      -- open mason manually with `<space>vm` and `/` search for lua.
      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim', 'quarto', 'pandoc', 'io', 'string', 'print', 'require', 'table', },
              disable = { 'trailing-space' },
            },
        },
      }
    }

    lspconfig.bashls.setup {
      filetypes = { 'sh', 'bash' }
    }
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

