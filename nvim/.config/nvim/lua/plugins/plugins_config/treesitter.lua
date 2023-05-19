local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = {
    'r',
    'python',
    'markdown',
    'markdown_inline',
    'yaml',
    'lua',
    'vim',
    'query',
    'latex',
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

