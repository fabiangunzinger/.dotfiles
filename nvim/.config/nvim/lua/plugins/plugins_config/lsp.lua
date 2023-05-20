local present, lspconfig = pcall(require, "lspconfig")
if not present then
  return
end

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
        globals = { 'vim', 'quarto', 'pandoc' },
        disable = { 'trailing-space' },
      },
    },
  }
}

lspconfig.bashls.setup {
  filetypes = { 'sh', 'bash' }
}
