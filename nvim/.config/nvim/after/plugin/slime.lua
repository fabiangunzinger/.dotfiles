vim.b.slime_cell_delimiter = "#%%"

-- Disable default mappings
-- vim.g.slime_no_mappings = 1

-- code destination
-- -- tmux
-- vim.g.slime_target = 'tmux'
-- vim.g.slime_bracketed_paste = 1
-- vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }
-- -- neovvim terminal
vim.g.slime_target = "neovim"
-- vim.g.slime_python_ipython = 1

-- vim.keymap.set("n", "<c-cr>", "<Plug>SlimeParagraphSend")
-- vim.keymap.set("x", "<cr>", "<Plug>SlimeRegionSend")
-- vim.keymap.set("n", "<s-cr>", "<Plug>SlimeLineSend")
-- vim.keymap.set("n", "<leader><cr>", "<Plug>SlimeMotionSend")
