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


-- Global mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
-- See `:help vim.lsp.*` for documentation on any of the below functions
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>ll', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>lR', "<cmd>Telescope lsp_references<cr>", opts)
    vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, opts)
    vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', "<leader>li", "<cmd>LspInfo<cr>", opts)
  end,
})


-- Custom diagnostic settings
vim.diagnostic.config({
    virtual_text = false,
  })


-- Install and activate LSP servers
-- Servers are installed with Mason and activated with lspconfig
local lsp_servers = {
  pyright = {
    single_file_support = true,
  },
  r_language_server = {},
  -- marksman setup also requires the following file and content
  -- $home/.config/marksman/config.toml
  -- [core]
  -- markdown.file_extensions = ["md", "markdown", "qmd"]
  marksman = {
    filetypes = { 'markdown', 'quarto' },
    root_dir = util.root_pattern(".git", ".marksman.toml", "_quarto.yml"),
  },
  ltex = {
    filetypes = { "markdown", "tex", "quarto" },
  },
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim', 'quarto', 'pandoc' },
          disable = { 'trailing-space' },
        },
      },
    }
  },
  bashls = {
    filetypes = { 'sh', 'bash' }
  },
}

require("mason").setup()
require("mason-lspconfig").setup({
  auto_install = true,
  ensure_installed = lsp_servers,
})

for lsp, settings in pairs(lsp_servers) do
  lspconfig[lsp].setup({
    settings = settings,
  })
end


-- Formatting and linting
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



