return {
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

      -- -- setup formatting
      -- local formatters = require "lsp.null-ls.formatters"
      -- formatters.setup { { name = "black" }, }
      -- autocmd BufWritePre *.py lua vim.lsp.buf.format({ async = false })

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({
          buffer = bufnr,
          preserve_mappings = false
        })
      end)

      lsp.setup()
    end
  },
}

