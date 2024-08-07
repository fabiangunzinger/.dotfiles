local wk = require 'which-key'
local map = function(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- use jk to abort modes and search highlighting
map("i", "jk", "<esc>")
map("o", "jk", "<esc>")
map("c", "jk", "<c-c>")
map("v", "jk", "v")
map("n", 'jk', '<cmd>nohlsearch<cr>')

-- quick save in insert node
map('i', 'fd', '<cmd>write<cr>')

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

-- make Y behave like C and D (see `h: Y`)
map("n", "Y", "y$")

-- move visual-line-wise
map("n", "j", "gj")
map("n", "k", "gk")

-- open url under cursor without netrw_gx
map("n", "gx", ":!open <c-r><c-a><cr>")

-- Function to reload configuration modules
function reload_config()
    local modules = { "config.autocommands", "config.keymaps", "config.options", "config.plugins" }

    -- Clear the cache for each module and reload it
    for _, module in ipairs(modules) do
        package.loaded[module] = nil
        require(module)
    end
    print("Config reloaded!")
end

-- source vimrc
map("n", "<leader>sv", function() reload_config() end)

-- Bind the reload function to a keymap (optional)
-- For example, bind it to <leader>rc in normal mode
-- vim.api.nvim_set_keymap('n', '<leader>rc', ':lua reload_config()<CR>', { noremap = true, silent = true })
-- map("n", "<leader>sv", "<cmd>luafile: $MYVIMKEYMAPS<cr>")

-- open help for word under cursor
-- map("n", '<leader>vh', ':execute "h " . expand("<cword>")<cr>')

-- center after search and jumps
map("n", 'n', "nzz")
map("n", '<c-d>', '<c-d>zz')
map("n", '<c-u>', '<c-u>zz')

-- keep selection after indent/dedent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- move highlighted text up and down
map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '<-2<cr>gv=gv")

-- join rows with cursor staying in place
map("n", "J", "mzJ`z")

-- keep search results in middle of screen
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")
map("i", "-", "-<c-g>u")

-- buffers
map("n", "<leader>bb", "<cmd>enew<cr>", { desc = "new buffer" })
map("n", "bd",":bp|bd#<cr>", { desc = "close buffer but not window" })
map({ "i", "n", "v", "s", }, "<C-s>", "<cmd>w<cr><esc>", { desc = "write buffer" })
map("n", "<leader>a", ":e#<cr>", { desc = "edit alternate buffer" })
-- map("n", '<leader>ls', ':ls!<cr>', { desc = "list hidden buffers" })

-- open and close windows
map("n", "<leader>w\\", "<cmd>vsplit<cr>", { desc = "split window right" })
map("n", "<leader>w-", "<cmd>split<cr>", { desc = "split window below" })
map("n", "<leader>\\", "<cmd>vnew<cr>", { desc = "empty split window right" })
map("n", "<leader>-", "<cmd>new<cr>", { desc = "empty split window below" })

-- move between windows
-- handled by tmux config
-- map("n", '<c-h>', '<c-w>h')
-- map("n", '<c-l>', '<c-w>l')
-- map("n", '<c-j>', '<c-w>j')
-- map("n", '<c-k>', '<c-w>k')

-- resizing windows using <shift> arrow keys
map("n", "<S-Up>", "<cmd>resize +2<CR>")
map("n", "<S-Down>", "<cmd>resize -2<CR>")
map("n", "<S-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<S-Right>", "<cmd>vertical resize +2<CR>")

-- open and close tabs
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>")
map("n", "<leader><tab>d", "<cmd>tabclose<cr>")

-- move between tabs
map("n", 'H', '<cmd>tabprevious<cr>')
map("n", 'L', '<cmd>tabnext<cr>')
map("n", "<leader><tab>l", "<cmd>tablast<cr>")
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>")
map("n", "<leader><tab>p", "<:-tabmove<cr>", { desc = "current to previous" })
map("n", "<leader><tab>n", ":+tabmove<cr>", { desc = "current to next" })

-- set key mappings for terminal mode
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

-- -- normal mode without leader
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
  ['<c-i>']         = { 'o```{python}<cr>```<esc>O', "Python code chunk" },
  ['<c-m>'] = { ':lua require("harpoon.ui").nav_next()<cr>', "Next file" },
  ['<c-n>'] = { ':lua require("harpoon.ui").nav_prev()<cr>', "Previous file" },
}, { mode = 'n', silent = true})


-- normal mode with leader
wk.register(
  {
    a = {
      name = "ai",
      p = {
        name = "copilot",
        d = { "<cmd>Copilot disable<cr>", "disable copilot" },
        e = { "<cmd>Copilot enable<cr>", "enable copilot" },
      },
      c = {
        name = "chat gpt",
        a = { "<cmd>ChatGPTActAs<cr>", "act as" },
        p = { "<cmd>ChatGPT<cr>", "chat" },
        c = { "<cmd>ChatGPTCompleteCode<cr>", "complete code" },
        e = { "<cmd>ChatGPTEditWithInstructions<cr>", "edit with instructions" },
        r = { "<cmd>ChatGPTRun<cr>", "run" },
      },
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
      },
    },
    g = {
      name = "git",
      s = { ":Gitsigns<cr>", "gitsigns" },
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
    h = {
      name = "Harpoon",
      h = { ':lua require("harpoon.ui").toggle_quick_menu()<cr>', "Toggle menu" },
      a = { ':lua require("harpoon.mark").add_file()<cr>', "Mark file" },
      n = { ':lua require("harpoon.ui").nav_next()<cr>', "Next file" },
      p = { ':lua require("harpoon.ui").nav_prev()<cr>', "Previous file" },
      t = { 'lua require("harpoon.term").gotoTerminal(1)<cr>', "Go to terminal 1" },
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
    v = {
      name = 'Vim',
      c = { ':Telescope colorscheme<cr>', 'Colortheme' },
      l = { ':Lazy<cr>', 'Lazy' },
      m = { ':Mason<cr>', 'Mason' },
      s = { ':e $MYVIMRC | :cd %:p:h | split . | wincmd k<cr>', 'Settings' },
    },
  }, { mode = 'n', prefix = '<leader>' }
)


-- visual mode
wk.register({
  ['q'] = { ':norm @q<cr>', 'repat q macro' },
}, { mode = 'v' })
