local wk = require("which-key")

-- show kepbindings with whichkey
local function open_plugin()
  local word = vim.fn.expand('<cWORD>')
  -- url = string.match(url, '".+"')
  local url = string.match(word, '%b""')
  if url ~= nil then
    url = string.gsub(url, '["\']', '')
  else
    url = string.match(word, "%b''")
    if url ~= nil then
      url = string.gsub(url, '["\']', '')
    end
  end
  url = 'https://github.com/' .. url
  local cmd = "!brave-browser " .. url
  vim.cmd(cmd)
end

local function switchTheme()
  if vim.o.background == 'light' then
    vim.o.background = 'dark'
    -- vim.cmd [[Catppuccin mocha]]
  else
    vim.o.background = 'light'
    -- vim.cmd [[Catppuccin latte]]
  end
end

wk.register(
{
  g = {
    name = "git",
    c = { ":GitConflictRefresh<cr>", 'conflict' },
    g = { ":Neogit<cr>", "neogit" },
    s = { ":Gitsigns<cr>", "gitsigns" },
    pl = { ":Octo pr list<cr>", "gh pr list" },
    pr = { ":Octo review start<cr>", "gh pr review" },
    wc = { ":lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "worktree create" },
    ws = { ":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "worktree switch" },
    d = {
      name = 'diff',
      o = { ':DiffviewOpen<cr>', 'open' },
      c = { ':DiffviewClose<cr>', 'close' },
    }
  },
  v = {
    name = 'vim',
    p = {open_plugin, 'open plugin'},
    t = { switchTheme, 'switch theme' },
    c = { ':Telescope colorscheme<cr>', 'colortheme' },
    l = { ':Lazy<cr>', 'Lazy' },
    m = { ':Mason<cr>', 'Mason' },
    s = { ':e $MYVIMRC | :cd %:p:h | split . | wincmd k<cr>', 'Settings' },
  },
  l = {
    name = 'language/lsp',
    r    = { '<cmd>Telescope lsp_references<cr>', 'references' },
    R    = { vim.lsp.buf.rename, 'rename' },
    D    = { vim.lsp.buf.type_definition, 'type definition' },
    a    = { vim.lsp.buf.code_action, 'coda action' },
    e    = { vim.diagnostic.open_float, 'diagnostics' },
    f    = { vim.lsp.buf.format, 'format' },
    o    = { ':SymbolsOutline<cr>', 'outline' },
    d    = {
      name = 'diagnostics',
      d = { vim.diagnostic.disable, 'disable' },
      e = { vim.diagnostic.enable, 'enable' },
    },
    g = { ':Neogen<cr>', 'neogen docstring'}
  },
  q = {
    name = 'quarto',
    a = { ":QuartoActivate<cr>", 'activate' },
    p = { ":lua require'quarto'.quartoPreview()<cr>", 'preview' },
    q = { ":lua require'quarto'.quartoClosePreview()<cr>", 'close' },
    h = { ":QuartoHelp ", 'help' },
    e = { ":lua require'otter'.export()<cr>", 'export' },
    E = { ":lua require'otter'.export(true)<cr>", 'export overwrite' },
  },
  h = {
    name = 'hidden',
    h = {':set conceallevel=1<cr>', 'hide/conceal'},
    s = {':set conceallevel=0<cr>', 'show/unconceal'},
  },
  -- s = {

  --   name = "spellcheck",
  --   s = { "<cmd>Telescope spell_suggest<cr>", "spelling" },
  --   ['/'] = { '<cmd>setlocal spell!<cr>', 'spellcheck' },
  --   n = { ']s', 'next' },
  --   p = { '[s', 'previous' },
  --   g = { 'zg', 'good' },
  --   r = { 'zg', 'rigth' },
  --   w = { 'zw', 'wrong' },
  --   b = { 'zw', 'bad' },
  --   ['?'] = { '<cmd>Telescope spell_suggest<cr>', 'suggest' },
  -- },

  t = {
    name = "tab",
    a = { ":$tabnew<cr>", "new tab" },
    c = { ":tabclose<cr>", "close tab" },
    o = { ":tabonly<cr>", "only this tab" },
    n = { ":tabnext<cr>", "next tab" },
    p = { ":tabprevious<cr>", "previous tab" },
    f = { ":tabfirst<cr>", "first tab" },
    l = { ":tablast<cr>", "last tab" },
    mp = { ":-tabmove<cr>", "curren to previous" },
    mn = { ":+tabmove<cr>", "current to next" },
  },
  c = {
    name = 'code',
    s = { ':SlimeConfig<cr>', 'slime config' },
    n = { ':vsplit term://$SHELL<cr>', 'new terminal' },
    r = { ':vsplit term://R<cr>', 'new R terminal' },
    p = { ':vsplit term://python<cr>', 'new python terminal' },
    i = { ':vsplit term://ipython<cr>', 'new ipython terminal' },
    c = {
      name = "copilot",
      d = { "<cmd>Copilot disable<cr>", "disable copilot" },
      e = { "<cmd>Copilot enable<cr>", "enable copilot" },
    -- n = { "<Plug>(copilot-next)", "next suggestion" },
    -- p = { "<Plug>(copilot-prev)", "previous suggestion" },
    -- s = { "<Plug>(copilot-suggest)", "suggest" },
    }
  },
  d = {
    name = "debug",
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "debug breakpoint" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "debug continue" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "debug over" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "debug into" },
    r = { "<cmd>lua require'dap'.repl_open()<cr>", "debug repl" },
    u = { "<cmd>lua require'dapui'.toggle()<cr>", "debug into" },
    t = {
      name = "test",
      m = { "<cmd>lua require('neotest').run.run()<cr>", "test method" },
      M = { "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<cr>", "test method DAP" },
      f = { "<cmd>lua require('neotest').run.run({ vim.fn.expand('%') })<cr>", "test file" },
      F = { "<cmd>lua require('neotest').run.run({ vim.fn.expand('%'), strategy = 'dap' })<cr>", "test file DAP" },
      s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "test summary" }
    }
  }
}, { mode = 'n', prefix = '<leader>' }
)


-- normal mode
wk.register({
  ['<c-LeftMouse>'] = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'go to definition' },
  ["<c-q>"]         = { '<cmd>q<cr>', 'close buffer' },
  ['<esc>']         = { '<cmd>noh<cr>', 'remove search highlight' },
  ['n']             = { 'nzzzv', 'center search' },
  ['gN']            = { 'Nzzzv', 'center search' },
  ['gl']            = { '<c-]>', 'open help link' },
  ['gf']            = { ':e <cfile><CR>', 'edit file' },
  ['co']            = { 'o#%%<cr>', 'new code chunk below' },
  ['cO']            = { 'O#%%<cr>', 'new code chunk above' },
  ['<m-i>']         = { 'o```{r}<cr>```<esc>O', "r code chunk" },
  ['<cm-i>']        = { 'o```{python}<cr>```<esc>O', "r code chunk" },
  ['<m-I>']         = { 'o```{python}<cr>```<esc>O', "r code chunk" },
}, { mode = 'n' })

-- visual mode
wk.register({
  ['q'] = { ':norm @q<cr>', 'repat q macro' },
}, { mode = 'v' })


