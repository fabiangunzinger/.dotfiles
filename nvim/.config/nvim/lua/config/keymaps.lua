
local noremap = function(key, effect)
  vim.keymap.set({'n', 'v', 'o'}, key, effect, { silent = true, noremap = true })
end

local nnoremap = function(key, effect)
  vim.keymap.set('n', key, effect, { silent = true, noremap = true })
end

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



-- experimental

-- copy into system clipboard
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nnoremap("<leader>Y", "\"+Y")

-- paste without replacing default register content
vim.keymap.set("v", "<leader>p", "\"_dP")

-- use jk to abort insert, operator-pending, command-line,
-- and visual modes
inoremap("jk", "<esc>")
onoremap("jk", "<esc>")
cnoremap("jk", "<c-c>")
vnoremap("jk", "v")

-- insert directory of current file into command line
cnoremap("%%","<C-R>=fnameescape(expand('%:h')).'/'<cr>")

-- close buffer without loosing window split
nnoremap("bd",":bp|bd#<cr>")

-- open filetree
nnoremap('<c-b>', '<cmd>NvimTreeToggle<cr>')

-- open url under cursor without netrw_gx
nnoremap("gx", ":!open <c-r><c-a><cr>")

-- edit alternate buffer --
nnoremap("<leader>a", ":e#<cr>")

-- make Y behave like C and D (see `h: Y`)
noremap("Y", "y$")

-- write buffer in normal mode
nnoremap("<leader>w", ":w<cr>")

-- move visual-line-wise
nnoremap("j", "gj")
nnoremap("k", "gk")

-- source vimrc
nnoremap("<leader>sv", "<cmd>luafile: $MYVIMRC<cr>")

-- Resize window using <shift> arrow keys
nnoremap("<S-Up>", "<cmd>resize +2<CR>")
nnoremap("<S-Down>", "<cmd>resize -2<CR>")
nnoremap("<S-Left>", "<cmd>vertical resize -2<CR>")
nnoremap("<S-Right>", "<cmd>vertical resize +2<CR>")

-- list hidden buffers
nnoremap('<leader>ls', ':ls!<cr>')
nnoremap('<leader>vh', ':execute "h " . expand("<cword>")<cr>')

-- source entire file
nnoremap('<leader>xx', ':w<cr>:source %<cr>')

-- remove search highlight on esc
nnoremap('<esc>', '<cmd>noh<cr>')

-- find files with telescope
nnoremap('<c-p>', "<cmd>Telescope find_files<cr>")

-- center after search and jumps
nnoremap('n', "nzz")
nnoremap('<c-d>', '<c-d>zz')
nnoremap('<c-u>', '<c-u>zz')

-- keep selection after indent/dedent
vnoremap('>', '>gv')
vnoremap('<', '<gv')

-- move highlighted text up and down
vnoremap("J", ":m '>+1<cr>gv=gv")
vnoremap("K", ":m '<-2<cr>gv=gv")

-- join rows with cursor staying in place
nnoremap("J", "mzJ`z")

-- keep search results in middle of screen
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- enter zen-mode
nnoremap("<leader>zm", "<cmd>ZenMode<cr>")

-- move between splits
nnoremap('<c-h>', '<c-w>h')
nnoremap('<c-l>', '<c-w>l')
nnoremap('<c-j>', '<c-w>j')
nnoremap('<c-k>', '<c-w>k')

-- move between tabs
nnoremap('H', '<cmd>tabprevious<cr>')
nnoremap('L', '<cmd>tabnext<cr>')

-- save in insert mode
inoremap("<C-s>", "<cmd>:w<cr><esc>")

-- Add undo break-points
inoremap(",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")


cnoremap("%%", "<C-R>=fnameescape(expand('%:h')).'/'<cr>")

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
-- nnoremap('<leader><cr>', '<Plug>SlimeSendCell')
-- with ctrl+Enter, just like in e.g. RStudio
-- needs kitty (or other terminal) config:
-- map shift+enter send_text all \x1b[13;2u
-- map ctrl+enter send_text all \x1b[13;5u
nnoremap('<c-cr>', '<Plug>SlimeSendCell')
-- nnoremap('<s-cr>', '<Plug>SlimeSendRegion')
-- inoremap('<c-cr>', '<esc><Plug>SlimeSendCell<cr>i')
-- -- with Enter and leader Enter
vnoremap('<cr>', '<Plug>SlimeRegionSend')

