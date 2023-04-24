-- space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- TODO: check whether I need this in addition to using treesitter
vim.g.markdown_fenced_languages = { 'html', 'python', 'bash=sh', 'R=r' }

-- easy motion
vim.g.easyMotion_do_mapping=0 -- disable default mapping
vim.g.easyMotion_smartcase=1 -- case insensitive search

-- disable netrw as advised in nvim-tree docx
vim.g.loaded_netrw=1
vim.g.loaded_netrwPlugin=1

-- Enable 24-bit RGB colours in TUI
vim.opt.termguicolors=true
vim.opt.history=5000   -- lines to remember
vim.opt.spelllang='en_gb'   -- spell checker uses british english
vim.opt.laststatus=2   -- always show statusline
vim.opt.lazyredraw=true -- avoid undue redrawing
vim.opt.number=true -- show line numers
vim.opt.relativenumber=true   -- show relative line numbers
vim.opt.mouse='a'   -- mouse support in all modes
vim.opt.showcmd=true   -- show partial command

-- text wrapping
vim.opt.wrap=true   -- wrap long lines
vim.opt.linebreak=true   -- don't break word

-- splits
vim.opt.splitright=true   -- new vertical split on the right
vim.opt.splitbelow=true   -- new horizontal split below

-- tab stops
local tabsize=2
vim.opt.expandtab=true   -- tabs are spaces
vim.opt.shiftwidth=tabsize   -- spaces for autoindent
vim.opt.tabstop=tabsize   -- spaces per <tab> in file
vim.opt.softtabstop=tabsize   -- spaces per <tab> while editing

vim.opt.timeoutlen = 400 -- delay until which-key pops up
vim.opt.updatetime = 250 -- for autocommands and hovers
vim.opt.clipboard:append 'unnamedplus' -- use system clipboard

-- up to here <---

-- smarter search
vim.opt.ignorecase = true -- ignore case...
vim.opt.smartcase = true -- ... except when capitals used

-- markdown
vim.g.vim_markdown_auto_insert_bullets = false

-- colortheme tweaks
vim.g.nord_borders = true

-- indent
vim.opt.smartindent = true
vim.opt.breakindent = true

-- consisten number column
vim.opt.signcolumn = "yes:1"

-- how to show a autocomplete menu
vim.opt.completeopt = 'menuone,noinsert'

-- add folds with treesitter grammar
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- but open all by default
vim.opt.foldlevel = 99

-- global statusline
vim.opt.laststatus = 3

--tabline
vim.opt.showtabline = 1

--windowline
vim.opt.winbar = '%t'

--don't continue comments automagically
vim.opt.formatoptions:remove({ 'c', 'r', 'o' })

-- hide cmdline when not used
vim.opt.cmdheight = 0

-- plugins
-- slime, general
vim.b.slime_cell_delimiter = "#%%"

-- git blame, lualine
vim.g.gitblame_display_virtual_text = 0


-- Custom Python host
-- See: https://neovim.io/doc/user/provider.html#provider-python
vim.g.python3_host_prog = "~/.pyenv/versions/base/bin/python3.10"

