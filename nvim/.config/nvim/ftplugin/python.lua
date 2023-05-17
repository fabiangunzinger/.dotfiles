-- slime
vim.b.slime_cell_delimiter = "#%%"


-- lsp support
local lspconfig = require("lspconfig")
local pyright_opts = {
  single_file_support = true,
}

lspconfig.pyright.setup(pyright_opts)


-- formatting and linting
local null_ls = require("null-ls")

local sources = {
null_ls.builtins.formatting.black.with({
  extra_args = { "--line-length=80" }
}),
null_ls.builtins.formatting.isort,
null_ls.builtins.diagnostics.flake8
}

null_ls.setup({ sources = sources })


-- debugging
local dap_python = require("dap-python")
local dapui = require("dapui")
dap_python.setup("~/.venvs/debugpy3.10/bin/python")
dapui.setup()


-- testing
local neotest = require("neotest")
neotest.setup({
  adapters = {
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
      python = ".venv/bin/python"
    })
  }
})

