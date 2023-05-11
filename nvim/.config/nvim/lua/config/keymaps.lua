

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

-- send code
map("n", '<leader><cr>', '<Plug>SlimeSendCell')
-- with ctrl+Enter, just like in e.g. RStudio
-- needs kitty (or other terminal) config:
-- map shift+enter send_text all \x1b[13;2u
-- map ctrl+enter send_text all \x1b[13;5u
nnoremap('<c-cr>', '<Plug>SlimeSendCell')
-- nnoremap('<s-cr>', '<Plug>SlimeSendRegion')
-- inoremap('<c-cr>', '<esc><Plug>SlimeSendCell<cr>i')
-- -- with Enter and leader Enter
vnoremap('<cr>', '<Plug>SlimeRegionSend')

