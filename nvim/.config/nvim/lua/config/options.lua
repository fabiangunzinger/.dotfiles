-- custom leader
vim.g.mapleader = " "

-- disable netrw as advised in nvim-tree docs
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- disable unneded providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- disable vim backups and set undo directory
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undofile = true

-- misc.
vim.opt.termguicolors = true
vim.opt.history = 5000   -- lines to remember
vim.opt.spelllang='en_gb'   -- spell checker uses british english
vim.opt.laststatus = 2   -- always show statusline
vim.opt.lazyredraw = true -- avoid undue redrawing
vim.opt.number = true -- show line numers
vim.opt.relativenumber = true   -- show relative line numbers
vim.opt.mouse='a'   -- mouse support in all modes
vim.opt.showcmd = true   -- show partial command
vim.opt.scrolloff = 8 -- at least 8 lines away from border

-- text wrapping
-- vim.opt.wrap = true   -- wrap long lines
vim.opt.textwidth = 90   -- wrap at 80 characters
vim.opt.linebreak = true   -- don't break word

-- splits
vim.opt.splitright = true   -- new vertical split on the right
vim.opt.splitbelow = true   -- new horizontal split below

-- tab stops
local tabsize = 2
vim.opt.expandtab = true   -- tabs are spaces
vim.opt.shiftwidth = tabsize   -- spaces for autoindent
vim.opt.tabstop = tabsize   -- spaces per <tab> in file
vim.opt.softtabstop = tabsize   -- spaces per <tab> while editing

vim.opt.timeoutlen = 400 -- delay until which-key pops up
vim.opt.updatetime = 250 -- for autocommands and hovers

-- smarter search
vim.opt.incsearch = true -- higlight results as I type
-- vim.opt.hlsearch = false -- only highlight first result
vim.opt.ignorecase = true -- ignore case...
vim.opt.smartcase = true -- ... except when capitals used

-- markdown
vim.g.vim_markdown_auto_insert_bullets = false

-- indent
vim.opt.smartindent = true
vim.opt.breakindent = true

-- custom python host
-- See: https://neovim.io/doc/user/provider.html#provider-python
vim.g.python3_host_prog = "~/.venvs/nvim/bin/python3.13"
