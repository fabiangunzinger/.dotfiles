return {
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
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      local lspkind = require("lspkind")
      lspkind.init()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<c-j>'] = cmp.mapping.select_next_item(),
          ['<c-k>'] = cmp.mapping.select_prev_item(),
          ['<cr>'] = cmp.mapping.confirm({ select = true }),
          ['<c-f>'] = cmp.mapping.scroll_docs(-4),
          ['<c-d>'] = cmp.mapping.scroll_docs(4),
        },
        autocomplete = false,
        formatting = {
          format = lspkind.cmp_format {
            with_text = true,
            menu = {
              otter = "[🦦]",
              copilot = '[]',
              luasnip = "[snip]",
              nvim_lsp = "[LSP]",
              buffer = "[buf]",
              path = "[path]",
              spell = "[spell]",
              pandoc_references = "[ref]",
              tags = "[tag]",
              treesitter = "[TS]",
              calc = "[calc]",
              latex_symbols = "[tex]",
              emoji = "[emoji]",
            },
          },
        },
        sources = {
          { name = 'otter' }, -- for code chunks in quarto
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'luasnip', keyword_length = 3, max_item_count = 3 },
          { name = 'pandoc_references' },
          { name = 'buffer', keyword_length = 5, max_item_count = 3 },
          { name = 'spell' },
          { name = 'treesitter', keyword_length = 5, max_item_count = 3 },
          { name = 'calc' },
          { name = 'latex_symbols' },
          { name = 'emoji' },
        },
      })
    end
  },
}
