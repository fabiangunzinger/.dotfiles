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

wk.register({
  ['<cr>'] = { '<Plug>SlimeRegionSend', 'run code region' },
  ['<leader>'] = { '<Plug>SlimeRegionSend', 'run code region' },
}, { mode = 'v', prefix = "<leader>" })

