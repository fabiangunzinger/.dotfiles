return {
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
}
