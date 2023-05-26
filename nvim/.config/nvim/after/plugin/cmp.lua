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
    ['<c-space>'] = cmp.mapping.complete(),
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
