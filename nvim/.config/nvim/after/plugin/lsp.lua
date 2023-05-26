local present, lspconfig = pcall(require, "lspconfig")
if not present then
  return
end

local present, mason = pcall(require, "mason")
if not present then
  return
end

local util = lspconfig.util

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>ld', vim.diagnostic.open_float, opts)
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

-- enable syntax highlighting inside code blocks in markdown
vim.g.markdown_fenced_languages = { 'html', 'python', 'bash=sh', 'R=r' }


-- local cmp_nvim_lsp = require('cmp_nvim_lsp')
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Install and activate LSP servers
-- Servers are installed with Mason and activated with lspconfig
require("mason").setup()
require("mason-lspconfig").setup({
  auto_install = true,
  ensure_installed = {
    "pyright",
    "r_language_server",
    "marksman",
    "ltex",
    "lua_ls",
    "bashls",
  },
})

lspconfig.pyright.setup {
  single_file_support = true,
}

lspconfig.r_language_server.setup {}

-- marksman setup also requires a config file
-- $home/.config/marksman/config.toml
-- [core]
-- markdown.file_extensions = ["md", "markdown", "qmd"]
lspconfig.marksman.setup {
  -- capabilities = capabilities,
  filetypes = { 'markdown', 'quarto' },
  root_dir = util.root_pattern(".git", ".marksman.toml", "_quarto.yml"),
}

lspconfig.ltex.setup{
  filetypes = { "markdown", "tex", "quarto" },
}

-- -- local function strsplit(s, delimiter)
-- --   local result = {}
-- --   for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
-- --     table.insert(result, match)
-- --   end
-- --   return result
-- -- end
-- --
-- -- local function get_quarto_resource_path()
-- --   local f = assert(io.popen('quarto --paths', 'r'))
-- --   local s = assert(f:read('*a'))
-- --   f:close()
-- --   return strsplit(s, '\n')[2]
-- -- end

-- local lua_library_files = vim.api.nvim_get_runtime_file("", true)
-- local resource_path = get_quarto_resource_path()
-- table.insert(lua_library_files, resource_path .. '/lua-types')
-- local lua_plugin_paths = {}
-- table.insert(lua_plugin_paths, resource_path .. '/lua-plugin/plugin.lua')

-- Overview of all options is available at:
-- https://github.com/luals/lua-language-server/blob/master/locale/en-us/setting.lua
lspconfig.lua_ls.setup {
  -- on_attach = on_attach,
  -- capabilities = capabilities,
  -- flags = lsp_flags,
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      },
      runtime = {
        version = 'LuaJIT',
        plugin = lua_plugin_paths,
      },
      diagnostics = {
        globals = { 'vim', 'quarto', 'pandoc', 'io', 'string', 'print', 'require', 'table', },
        disable = { 'trailing-space' },
      },
      workspace = {
        library = lua_library_files,
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
-- lspconfig.lua_ls.setup {
-- Lua = {
-- diagnostics = {
-- globals = { 'vim', 'quarto', 'pandoc' },
-- disable = { 'trailing-space' },
-- },
-- },
-- }

lspconfig.bashls.setup {
  filetypes = { 'sh', 'bash' },
}





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



