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
      g = { ":Neogit<cr>", "neogit" },
      s = { ":Gitsigns<cr>", "gitsigns" },
      pl = { ":Octo pr list<cr>", "gh pr list" },
      pr = { ":Octo review start<cr>", "gh pr review" },
      w = {
        name = "worktree",
        c = { ":lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "worktree create" },
        s = { ":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "worktree switch" },
      },
      d = {
        name = 'diff',
        o = { ':DiffviewOpen<cr>', 'open' },
        c = { ':DiffviewClose<cr>', 'close' },
      },
      c = {
        name = "git conflict",
        o = { "<Plug>(git-conflict-ours)", "use ours" },
        t = { "<Plug>(git-conflict-theirs)", "use theirs" },
        b = { "<Plug>(git-conflict-both)", "use both" },
        x = { "<Plug>(git-conflict-none)", "use none" },
        p = { "<Plug>(git-conflict-prev-conflict)", "previous conflict" },
        n = { "<Plug>(git-conflict-next-conflict)", "next conflict" },
      },
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
      c = {
        name = "git conflict",
        o = { "<Plug>(git-conflict-ours)", "use ours" },
      },
      p = { ":lua require'quarto'.quartoPreview()<cr>", 'preview' },
      q = { ":lua require'quarto'.quartoClosePreview()<cr>", 'close' },
      h = { ":QuartoHelp ", 'help' },
      e = { ":lua require'otter'.export()<cr>", 'export' },
      E = { ":lua require'otter'.export(true)<cr>", 'export overwrite' },
    },
    s = {
      name = "spellcheck",
      s = { "<cmd>Telescope spell_suggest<cr>", "spelling" },
      ['/'] = { '<cmd>setlocal spell!<cr>', 'spellcheck' },
      n = { ']s', 'next' },
      p = { '[s', 'previous' },
      g = { 'zg', 'good' },
      r = { 'zg', 'rigth' },
      w = { 'zw', 'wrong' },
      b = { 'zw', 'bad' },
      ['?'] = { '<cmd>Telescope spell_suggest<cr>', 'suggest' },
    },
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
      name = "code",
      s = { '<cmd>SlimeConfig<cr>', 'slime config' },
      v = {"<cmd>lua _VERTICAL_TERM()<cr>", "vertical terminal" },
      h = {"<cmd>lua _HORIZONTAL_TERM()<cr>", "horizontal terminal" },
      f = { "<cmd>lua _FLOAT_TERM()<cr>", "flating terminal" },
      p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "python terminal" },
      t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "htop" },
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


