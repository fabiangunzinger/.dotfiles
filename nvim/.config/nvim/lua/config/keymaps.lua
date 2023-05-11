local wk = require("which-key")


-- local noremap = function(key, effect)
--   vim.keymap.set({'n', 'v', 'o'}, key, effect, { silent = true, noremap = true })
-- end

-- local nnoremap = function(key, effect)
--   vim.keymap.set('n', key, effect, { silent = true, noremap = true })
-- end

local vnoremap = function(key, effect)
  vim.keymap.set('v', key, effect, { silent = true, noremap = true })
end

local inoremap = function(key, effect)
  vim.keymap.set('i', key, effect, { silent = true, noremap = true })
end

local onoremap = function(key, effect)
  vim.keymap.set('o', key, effect, { silent = true, noremap = true })
end

local cnoremap = function(key, effect)
  vim.keymap.set('c', key, effect, { silent = true, noremap = true })
end


local map = function(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- experimental start --


-- experimental end --



-- use jk to abort modes and search highlighting
map("i", "jk", "<esc>")
map("o", "jk", "<esc>")
map("c", "jk", "<c-c>")
map("v", "jk", "v")
map("n", 'jk', '<cmd>nohlsearch<cr>')

-- copy into system clipboard
map("n", "<leader>y", "\"+y")
map("n", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")

-- search word under cursor
map("n", "gw", "*N")

-- paste without replacing default register content
map("v", "<leader>p", "\"_dP")

-- insert directory of current file into command line
map("c", "%%","<C-R>=fnameescape(expand('%:h')).'/'<cr>")

-- open url under cursor without netrw_gx
map("n", "gx", ":!open <c-r><c-a><cr>")



-- make Y behave like C and D (see `h: Y`)
map("n", "Y", "y$")

-- move visual-line-wise
map("n", "j", "gj")
map("n", "k", "gk")

-- source vimrc
map("n", "<leader>sv", "<cmd>luafile: $MYVIMRC<cr>")

-- Resize window using <shift> arrow keys
map("n", "<S-Up>", "<cmd>resize +2<CR>")
map("n", "<S-Down>", "<cmd>resize -2<CR>")
map("n", "<S-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<S-Right>", "<cmd>vertical resize +2<CR>")

-- list hidden buffers
map("n", '<leader>ls', ':ls!<cr>')

-- open help for word under cursor
map("n", '<leader>vh', ':execute "h " . expand("<cword>")<cr>')

-- source entire file
map("n", '<leader>xx', ':w<cr>:source %<cr>')

-- find files with telescope
map("n", '<c-p>', "<cmd>Telescope find_files<cr>")

-- center after search and jumps
map("n", 'n', "nzz")
map("n", '<c-d>', '<c-d>zz')
map("n", '<c-u>', '<c-u>zz')

-- keep selection after indent/dedent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- quit nvim
map("n", "qq", "<cmd>qa<cr>")

-- move highlighted text up and down
vnoremap("J", ":m '>+1<cr>gv=gv")
vnoremap("K", ":m '<-2<cr>gv=gv")

-- join rows with cursor staying in place
map("n", "J", "mzJ`z")

-- keep search results in middle of screen
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- enter zen-mode
map("n", "<leader>zm", "<cmd>ZenMode<cr>")

-- Add undo break-points
inoremap(",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- buffers --

-- misc.
map("n", "<leader>bb", "<cmd>enew<cr>", { desc = "new buffer" })
map("n", "bd",":bp|bd#<cr>", { desc = "close buffer but not window" })
map({ "i", "n", "v", "s", }, "<C-s>", "<cmd>w<cr><esc>", { desc = "write buffer" })
map("n", "<leader>a", ":e#<cr>", { desc = "edit alternate buffer" })


-- windows --

-- open and close windows
map("n", "<leader>w\\", "<cmd>vsplit<cr>", { desc = "split window right" })
map("n", "<leader>w-", "<cmd>split<cr>", { desc = "split window below" })
map("n", "<leader>\\", "<cmd>vnew<cr>", { desc = "new split window right" })
map("n", "<leader>-", "<cmd>new<cr>", { desc = "new split window below" })
map("n", "<leader>wd", "<cmd>quit<cr>", { desc = "new split window below" })

-- move between windows
map("n", '<c-h>', '<c-w>h')
map("n", '<c-l>', '<c-w>l')
map("n", '<c-j>', '<c-w>j')
map("n", '<c-k>', '<c-w>k')


-- tabs --

-- open and close tabs
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>")
map("n", "<leader><tab>d", "<cmd>tabclose<cr>")

-- move between tabs
map("n", 'H', '<cmd>tabprevious<cr>')
map("n", 'L', '<cmd>tabnext<cr>')
map("n", "<leader><tab>l", "<cmd>tablast<cr>")
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>")


-- easy-motion
-- move to two characters, and line below and above
vim.keymap.set('n', "s", "<Plug>(easymotion-overwin-f2)", { noremap = false })
vim.keymap.set('', "<leader>j", "<Plug>(easymotion-j)", { noremap = false })
vim.keymap.set('', "<leader>k", "<Plug>(easymotion-k)", { noremap = false })

-- Set key mappings for terminal mode
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- -- terminal mode
-- -- get out ouf terminal insert mode with esc
-- vim.keymap.set('t', '<esc>', [[<c-\><c-n>]], { silent = true, noremap = true })
-- --move to other window
-- vim.keymap.set('t', '<c-j>', [[<c-\><c-n><c-w>w]], { silent = true, noremap = true })
-- vim.keymap.set('n', '<leader>j', [[<c-w>wi]], { silent = true, noremap = true })
--

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

-- send code
map("n", '<leader><cr>', '<Plug>SlimeSendCell')
-- with ctrl+Enter, just like in e.g. RStudio
-- needs kitty (or other terminal) config:
-- map shift+enter send_text all \x1b[13;2u
-- map ctrl+enter send_text all \x1b[13;5u
-- nnoremap('<c-cr>', '<Plug>SlimeSendCell')
-- nnoremap('<c-cr>', '<Plug>SlimeSendCell')
-- nnoremap('<s-cr>', '<Plug>SlimeSendCell')
-- inoremap('<c-cr>', '<esc><Plug>SlimeSendCell<cr>i')
-- -- with Enter and leader Enter
-- vnoremap('<cr>', '<Plug>SlimeRegionSend')

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

