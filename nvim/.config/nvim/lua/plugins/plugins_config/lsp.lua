local present, lspconfig = pcall(require, "lspconfig")
if not present then
  return
end

local util = lspconfig.util
local lsp_defaults = util.default_config
-- local lsp_defaults = lspconfig.util.default_config
-- local util = require("lspconfig.util")

-- mason setup
require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true
})

-- add client capabilities to lspconfig default configuration
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- Python
lspconfig.pyright.setup({
  single_file_support = true,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = true }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

--
-- -- -- lsp setup
-- -- lsp.on_attach(function(client, bufnr)
-- --   lsp.default_keymaps({
-- --     buffer = bufnr,
-- --     preserve_mappings = false
-- --   })
-- -- end)
--
-- -- lsp.setup()

-- -- language server serup
-- lspconfig.r_language_server.setup({})

-- -- also requires:
-- -- $home/.config/marksman/config.toml :
-- -- [core]
-- -- markdown.file_extensions = ["md", "markdown", "qmd"]
-- lspconfig.marksman.setup {
--   filetypes = { 'markdown', 'quarto' },
--   root_dir = util.root_pattern(".git", ".marksman.toml", "_quarto.yml"),
-- }
--
-- -- language server for grammar and spelling
-- lspconfig.ltex.setup {
--   filetypes = { "markdown", "tex", "quarto" },
-- }
--
-- -- not upadated yet in automatic mason-lspconfig install,
-- -- open mason manually with `<space>vm` and `/` search for lua.
-- lspconfig.lua_ls.setup {
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { 'vim', 'quarto', 'pandoc' },
--         disable = { 'trailing-space' },
--       },
--     },
--   }
-- }
--
-- lspconfig.bashls.setup {
--   filetypes = { 'sh', 'bash' }
-- }
