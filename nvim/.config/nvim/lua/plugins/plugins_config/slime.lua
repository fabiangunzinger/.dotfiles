local present, slime = pcall(require, "vim-slime")
if not present then
  return
end

local present, wk = pcall(require, "whick-key")
if not present then
  return
end


vim.b.slime_cell_delimiter = "#%%"

-- code destination
-- -- tmux
-- vim.g.slime_target = 'tmux'
-- vim.g.slime_bracketed_paste = 1
-- vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }
-- -- neovvim terminal
vim.g.slime_target = "neovim"
-- vim.g.slime_python_ipython = 1

wk.register({
  ['<cr>'] = { '<Plug>SlimeRegionSend', 'run code region' },
  ['<leader>'] = { '<Plug>SlimeRegionSend', 'run code region' },
}, { mode = 'v', prefix = "<leader>" })

