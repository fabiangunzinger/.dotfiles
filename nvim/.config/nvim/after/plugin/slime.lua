
vim.b['quarto_is_' .. 'python' .. '_chunk'] = false
Quarto_is_in_python_chunk = function()
  require 'otter.tools.functions'.is_otter_language_context('python')
end

vim.cmd [[
function SlimeOverride_EscapeText_quarto(text)
call v:lua.Quarto_is_in_python_chunk()
if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk
return ["%cpaste -q", "\n", a:text, "--", "\n"]
else
return a:text
end
endfunction
]]

local function mark_terminal()
  vim.g.slime_last_channel = vim.b.terminal_job_id
  vim.print(vim.g.slime_last_channel)
end

local function set_terminal()
  vim.b.slime_config = { jobid = vim.g.slime_last_channel }
end

vim.b.slime_cell_delimiter = "# %%"

-- neovvim terminal
vim.g.slime_target = "neovim"
vim.g.slime_python_ipython = 1

-- -- slime, tmux
-- vim.g.slime_target = 'tmux'
-- vim.g.slime_bracketed_paste = 1
-- vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }
--
local function toggle_slime_tmux_nvim()
  if vim.g.slime_target == 'tmux' then
    pcall(function()
      vim.b.slime_config = nil
      vim.g.slime_default_config = nil
    end
    )
    -- slime, neovvim terminal
    vim.g.slime_target = "neovim"
    vim.g.slime_bracketed_paste = 0
    vim.g.slime_python_ipython = 1
  elseif vim.g.slime_target == 'neovim' then
    pcall(function()
      vim.b.slime_config = nil
      vim.g.slime_default_config = nil
    end
    )
    -- -- slime, tmux
    vim.g.slime_target = 'tmux'
    vim.g.slime_bracketed_paste = 1
    vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }
  end
end


-- my settings -- 

-- -- Disable default mappings
-- vim.g.slime_no_mappings = 1
--
-- vim.b.slime_cell_delimiter = "# %%"
--
-- -- slime, neovvim terminal
-- vim.g.slime_target = "neovim"
-- vim.g.slime_python_ipython = 1
--
-- -- -- slime, tmux
-- -- vim.g.slime_target = 'tmux'
-- -- vim.g.slime_bracketed_paste = 1
-- -- vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }
--
--
-- vim.b['quarto_is_' .. 'python' .. '_chunk'] = false
-- Quarto_is_in_python_chunk = function()
--   require 'otter.tools.functions'.is_otter_language_context('python')
-- end
--
-- vim.cmd [[
-- function SlimeOverride_EscapeText_quarto(text)
-- call v:lua.Quarto_is_in_python_chunk()
-- if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk
-- return ["%cpaste -q", "\n", a:text, "--", "\n"]
-- else
-- return a:text
-- end
-- endfunction
-- ]]
--
-- local function mark_terminal()
--   vim.g.slime_last_channel = vim.b.terminal_job_id
--   vim.print(vim.g.slime_last_channel)
-- end
--
-- local function set_terminal()
--   vim.b.slime_config = { jobid = vim.g.slime_last_channel }
-- end
--
-- local function toggle_slime_tmux_nvim()
--   if vim.g.slime_target == 'tmux' then
--     pcall(function()
--       vim.b.slime_config = nil
--       vim.g.slime_default_config = nil
--     end
--     )
--     -- slime, neovvim terminal
--     vim.g.slime_target = "neovim"
--     vim.g.slime_bracketed_paste = 0
--     vim.g.slime_python_ipython = 1
--   elseif vim.g.slime_target == 'neovim' then
--     pcall(function()
--       vim.b.slime_config = nil
--       vim.g.slime_default_config = nil
--     end
--     )
--     -- -- slime, tmux
--     vim.g.slime_target = 'tmux'
--     vim.g.slime_bracketed_paste = 1
--     vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }
--   end
-- end
--

require 'which-key'.register({
  ['<leader>cm'] = { mark_terminal, 'Mark terminal' },
  -- ['<leader>cs'] = { set_terminal, 'Set terminal' },
  -- ['<leader>ct'] = { toggle_slime_tmux_nvim, 'Toggle tmux/nvim terminal' },
})

vim.keymap.set("n", "<c-cr>", "<Plug>SlimeParagraphSend")
vim.keymap.set("x", "<cr>", "<Plug>SlimeRegionSend")
vim.keymap.set("n", "<s-cr>", "<Plug>SlimeLineSend")
vim.keymap.set("n", "<leader><cr>", "<Plug>SlimeMotionSend")
