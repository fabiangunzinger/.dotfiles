local present, lspconfig = pcall(require, "lspconfig")
if not present then
  return
end

local present, mason = pcall(require, "mason")
if not present then
  return
end

local util = lspconfig.util
local lsp_defaults = util.default_config

-- List of LSP servers to install with Mason and activate with lspconfig
local lsp_servers = {
  pyright = {
    single_file_support = true,
  },
}

-- add client capabilities to lspconfig default configuration
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- Diagnostic settings
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true,
    update_in_insert = false,
  }
)

-- local handlers = lsp_defaults.handlers
-- handlers.setup = function()
--   vim.diagnostics.config({
--     virtual_text = false,
--     underline = true,
--     signs = true,
--     update_in_insert = false,
--   })
-- end


-- install language servers
require("mason").setup()
require("mason-lspconfig").setup({
  auto_install = true,
  ensure_installed = lsp_servers,
})

-- keyboard shortcuts
local server_mappings = function(opts)
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- Check which additional ones I need
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>o', function()
    vim.lsp.buf.format { async = true }
  end, opts)
end

-- Set up language servers
for lsp, settings in pairs(lsp_servers) do
  lspconfig[lsp].setup({
    on_attach = function(_, buffer)
      server_mappings({ buffer = buffer })
    end,
    settings = settings,
  })
end

local null_servers = {
  "isort",
  "black",
  "flake8",
}
require("mason-null-ls").setup({
  ensure_installed = null_servers,
  automatic_setup = true,
  handlers = {}
})
require("null-ls").setup()
-- require("mason-null-ls").setup_handlers()

--
-- -- install formatters and linters
-- require("mason-null-ls").setup({
--   -- automatic_installation = true,
--     ensure_installed = {
--     "black",
--     "isort",
--     "flake8",
--   }
-- })

--
--
-- -- Python
--
-- -- set up lsp server
-- lspconfig.pyright.setup({
--   single_file_support = true,
-- })
--
-- -- formatting and linting servers
-- local null_ls = require("null-ls")
--
-- local sources = {
--   null_ls.builtins.formatting.black.with({ extra_args = { "--line-length=80" } }),
--   null_ls.builtins.formatting.isort,
--   null_ls.builtins.diagnostics.flake8,
-- }
--
-- null_ls.setup({ sources = sources })
--
--
-- -- -- keyboard shortcuts
-- -- vim.api.nvim_create_autocmd('LspAttach', {
-- --   callback = function(ev)
-- --     -- See `:help vim.lsp.*` for documentation on any of the below functions
-- --     local opts = { buffer = true }
-- --     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
-- --     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
-- --     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
-- --     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
-- --     -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
-- --     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
-- --     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
-- --     vim.keymap.set('n', '<space>wl', function()
-- --       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- --     end, opts)
-- --     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
-- --     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
-- --     vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
-- --     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
-- --     vim.keymap.set('n', '<space>f', function()
-- --       vim.lsp.buf.format { async = true }
-- --     end, opts)
-- --   end,
-- -- })
--
-- --
-- -- -- -- lsp setup
-- -- -- lsp.on_attach(function(client, bufnr)
-- -- --   lsp.default_keymaps({
-- -- --     buffer = bufnr,
-- -- --     preserve_mappings = false
-- -- --   })
-- -- -- end)
-- --
-- -- -- lsp.setup()
--
-- -- -- language server serup
-- -- lspconfig.r_language_server.setup({})
--
-- -- -- also requires:
-- -- -- $home/.config/marksman/config.toml :
-- -- -- [core]
-- -- -- markdown.file_extensions = ["md", "markdown", "qmd"]
-- -- lspconfig.marksman.setup {
-- --   filetypes = { 'markdown', 'quarto' },
-- --   root_dir = util.root_pattern(".git", ".marksman.toml", "_quarto.yml"),
-- -- }
-- --
-- -- -- language server for grammar and spelling
-- -- lspconfig.ltex.setup {
-- --   filetypes = { "markdown", "tex", "quarto" },
-- -- }
-- --
-- -- -- not upadated yet in automatic mason-lspconfig install,
-- -- -- open mason manually with `<space>vm` and `/` search for lua.
-- -- lspconfig.lua_ls.setup {
-- --   settings = {
-- --     Lua = {
-- --       diagnostics = {
-- --         globals = { 'vim', 'quarto', 'pandoc' },
-- --         disable = { 'trailing-space' },
-- --       },
-- --     },
-- --   }
-- -- }
-- --
-- -- lspconfig.bashls.setup {
-- --   filetypes = { 'sh', 'bash' }
-- -- }
