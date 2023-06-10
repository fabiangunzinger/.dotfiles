vim.b.slime_cell_delimiter = "```"

-- wrap text, but by word no character
-- indent the wrappped line
vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.breakindent = true
vim.wo.showbreak = '|'

-- tab stops
local tabsize = 4
vim.opt.expandtab = true   -- tabs are spaces
vim.opt.shiftwidth = tabsize   -- spaces for autoindent
vim.opt.tabstop = tabsize   -- spaces per <tab> in file
vim.opt.softtabstop = tabsize   -- spaces per <tab> while editing

