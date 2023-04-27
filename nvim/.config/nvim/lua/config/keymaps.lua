local wk = require("which-key")

P = function(x)
  print(vim.inspect(x))
  return (x)
end

RELOAD = function(...)
  return require 'plenary.reload'.reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

local map = function(key, effect)
  vim.keymap.set({'n', 'v', 'o'}, key, effect, { silent = true, noremap = true })
end

local nmap = function(key, effect)
  vim.keymap.set('n', key, effect, { silent = true, noremap = true })
end

local vmap = function(key, effect)
  vim.keymap.set('v', key, effect, { silent = true, noremap = true })
end

local imap = function(key, effect)
  vim.keymap.set('i', key, effect, { silent = true, noremap = true })
end

local omap = function(key, effect)
  vim.keymap.set('o', key, effect, { silent = true, noremap = true })
end

local cmap = function(key, effect)
  vim.keymap.set('c', key, effect, { silent = true, noremap = true })
end

-- experimental

-- -- it messes too much with my workflow
-- -- move deleted text into separate registers
-- -- this overrides default behaviour, which
-- -- moves deleted text into default register.
-- nmap("d", "\"_d")
-- vmap("d", "\"_d")
-- nmap("D", "\"_D")
-- vmap("D", "\"_D")
-- nmap("c", "\"_c")
-- vmap("c", "\"_c")
-- nmap("C", "\"_C")
-- vmap("C", "\"_C")
-- these might be good alternatives
-- could have similar ones for normal mode
-- paste without overwriting register
vmap("<leader>p", "\"_dP")
-- delete without overwriting register
vmap("<leader>d", "\"_d")

-- use jk to abort insert, operator-pending, command-line,
-- and visual modes
imap("jk", "<esc>")
omap("jk", "<esc>")
cmap("jk", "<c-c>")
vmap("jk", "v")

-- insert directory of current file into command line
cmap("%%","<C-R>=fnameescape(expand('%:h')).'/'<cr>")

-- close buffer without loosing window split
nmap("bd",":bp|bd#<cr>")

-- open filetree
nmap('<c-b>', '<cmd>NvimTreeToggle<cr>')

-- open url under cursor without netrw_gx
nmap("gx", ":!open <c-r><c-a><cr>")

-- edit alternate buffer --
nmap("<leader>a", ":e#<cr>")

-- make Y behave like C and D (see `h: Y`)
map("Y", "y$")

-- write buffer in normal mode
nmap("<leader>w", ":w<cr>")

-- move visual-line-wise
nmap("j", "gj")
nmap("k", "gk")

-- source vimrc
nmap("<leader>sv", "<cmd>luafile $MYVIMRC<cr>")

-- Resize window using <shift> arrow keys
nmap("<S-Up>", "<cmd>resize +2<CR>")
nmap("<S-Down>", "<cmd>resize -2<CR>")
nmap("<S-Left>", "<cmd>vertical resize -2<CR>")
nmap("<S-Right>", "<cmd>vertical resize +2<CR>")

-- list hidden buffers
nmap('<leader>ls', ':ls!<cr>')
nmap('<leader>vh', ':execute "h " . expand("<cword>")<cr>')

-- source entire file
nmap('<leader>xx', ':w<cr>:source %<cr>')

-- remove search highlight on esc
nmap('<esc>', '<cmd>noh<cr>')

-- find files with telescope
nmap('<c-p>', "<cmd>Telescope find_files<cr>")

-- center after search and jumps
nmap('n', "nzz")
nmap('<c-d>', '<c-d>zz')
nmap('<c-u>', '<c-u>zz')

-- enter zen-mode
nmap("<leader>zm", "<cmd>ZenMode<cr>")


-- -- move between splits
-- nmap('<c-h>', '<c-w>h')
-- nmap('<c-l>', '<c-w>l')
-- nmap('<c-j>', '<c-w>j')
-- nmap('<c-k>', '<c-w>k')
--
-- tabs
nmap('H', '<cmd>tabprevious<cr>')
nmap('L', '<cmd>tabnext<cr>')
nmap("<leader>ta", ":$tabnew<cr>")
nmap("<leader>tc", ":tabclose<cr>")
nmap("<leader>to", ":tabonly<cr>")
nmap("<leader>tn", ":tabnext<cr>")
nmap("<leader>tp", ":tabprevious<cr>")
nmap("<leader>tf", ":tabfirst<cr>")
nmap("<leader>tl", ":tablast<cr>")
-- move current tab to previous position
nmap("<leader>tmp", ":-tabmove<cr>")
-- move current tab to next position
nmap("<leader>tmn", ":+tabmove<cr>")

-- save in insert mode
imap("<C-s>", "<cmd>:w<cr><esc>")

-- Add undo break-points
imap(",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- keep selection after indent/dedent
vmap('>', '>gv')
vmap('<', '<gv')

cmap("%%", "<C-R>=fnameescape(expand('%:h')).'/'<cr>")

-- easy-motion
-- move to two characters, and line below and above
vim.keymap.set('n', "s", "<Plug>(easymotion-overwin-f2)", { noremap = false })
vim.keymap.set('', "<leader>j", "<Plug>(easymotion-j)", { noremap = false })
vim.keymap.set('', "<leader>k", "<Plug>(easymotion-k)", { noremap = false })

-- send code
-- with ctrl+Enter, just like in e.g. RStudio
-- needs kitty (or other terminal) config:
-- map shift+enter send_text all \x1b[13;2u
-- map ctrl+enter send_text all \x1b[13;5u
nmap('<c-cr>', '<Plug>SlimeSendCell')
nmap('<s-cr>', '<Plug>SlimeSendCell')
imap('<c-cr>', '<esc><Plug>SlimeSendCell<cr>i')
imap('<s-cr>', '<esc><Plug>SlimeSendCell<cr>i')
-- with Enter and leader Enter
vmap('<cr>', '<Plug>SlimeRegionSend')
nmap('<leader><cr>', '<Plug>SlimeSendCell')

-- -- terminal mode
-- -- get out ouf terminal insert mode with esc
-- vim.keymap.set('t', '<esc>', [[<c-\><c-n>]], { silent = true, noremap = true })
-- --move to other window
-- vim.keymap.set('t', '<c-j>', [[<c-\><c-n><c-w>w]], { silent = true, noremap = true })
-- vim.keymap.set('n', '<leader>j', [[<c-w>wi]], { silent = true, noremap = true })
--
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
    vim.cmd [[Catppuccin mocha]]
  else
    vim.o.background = 'light'
    vim.cmd [[Catppuccin latte]]
  end
end

wk.register(
  {
    c = {
      name = 'code',
      c = { ':SlimeConfig<cr>', 'slime config' },
      n = {  ':vsplit term://$SHELL<cr>', 'new terminal (vertical)' },
      h = {  ':split term://$SHELL<cr>', 'new terminal (horizontal)' },
      p = {  ':vsplit term://python<cr>', 'new python terminal' },
      i = {  ':vsplit term://ipython<cr>', 'new ipython terminal' },
      r = {  ':vsplit term://R<cr>', 'new R terminal' },
      j = {  ':vsplit term://julia<cr>', 'new julia terminal' },
      s = {  ':echo b:terminal_job_id<cr>', 'show terminal id' },
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
    f = {
      name = 'find (telescope)',
      f = { '<cmd>Telescope find_files<cr>', 'files' },
      h = { '<cmd>Telescope help_tags<cr>', 'help' },
      k = { '<cmd>Telescope keymaps<cr>', 'keymaps' },
      r = { '<cmd>Telescope lsp_references<cr>', 'references' },
      g = { "<cmd>Telescope live_grep<cr>", "grep" },
      b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "fuzzy" },
      m = { "<cmd>Telescope marks<cr>", "marks" },
      M = { "<cmd>Telescope man_pages<cr>", "man pages" },
      c = { "<cmd>Telescope git_commits<cr>", "git commits" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "symbols" },
      d = { "<cmd>Telescope buffers<cr>", "buffers" },
      q = { "<cmd>Telescope quickfix<cr>", "quickfix" },
      l = { "<cmd>Telescope loclist<cr>", "loclist" },
      j = { "<cmd>Telescope jumplist<cr>", "marks" },
      p = { "project" },
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
    w = {
      name = 'write',
      w = { ":w<cr>", "write" },
    },
  }, { mode = 'n', prefix = '<leader>' }
)

-- normal mode
wk.register({
  ['<c-LeftMouse>'] = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'go to definition' },
  ['gx']            = { ':!xdg-open <c-r><c-a><cr>', 'open file' },
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
  ['<cr>'] = { '<Plug>SlimeRegionSend', 'run code region' },
  ['gx'] = { '"ty:!xdg-open t<cr>', 'open file' },
  ['<M-j>'] = { ":m'>+<cr>`<my`>mzgv`yo`z", 'move line down' },
  ['<M-k>'] = { ":m'<-2<cr>`>my`<mzgv`yo`z", 'move line up' },
  ['.'] = { ':norm .<cr>', 'repat last normal mode command' },
  ['q'] = { ':norm @q<cr>', 'repat q macro' },
}, { mode = 'v' })

wk.register({
  ['<leader>'] = { '<Plug>SlimeRegionSend', 'run code region' },
  ['p'] = { '"_dP', 'replace without overwriting reg' },
}, { mode = 'v', prefix = "<leader>" })

wk.register({
  -- ['<c-e>'] = { "<esc>:FeMaco<cr>i", "edit code" },
  ['<m-->'] = { ' <- ', "assign" },
  ['<m-m>'] = { ' |>', "pipe" },
  ['<m-i>'] = { '```{r}<cr>```<esc>O', "r code chunk" },
  ['<cm-i>'] = { '<esc>o```{python}<cr>```<esc>O', "r code chunk" },
  ['<m-I>'] = { '<esc>o```{python}<cr>```<esc>O', "r code chunk" },
}, { mode = 'i' })
