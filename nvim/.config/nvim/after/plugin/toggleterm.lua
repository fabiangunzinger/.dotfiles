local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

local wk = require("which-key")

toggleterm.setup {
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new {
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "none",
    width = 100000,
    height = 100000,
  },
  on_open = function(_)
    vim.cmd "startinsert!"
    -- vim.cmd "set laststatus=0"
  end,
  on_close = function(_)
    -- vim.cmd "set laststatus=3"
  end,
  count = 99,
}

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

local ncdu = Terminal:new { cmd = "ncdu", hidden = true }

function _NCDU_TOGGLE()
  ncdu:toggle()
end

local htop = Terminal:new { cmd = "htop", hidden = true }

function _HTOP_TOGGLE()
  htop:toggle()
end

local python = Terminal:new { cmd = "python", hidden = true }

function _PYTHON_TOGGLE()
  python:toggle()
end

local float_term = Terminal:new {
  direction = "float",
}

function _FLOAT_TERM()
  float_term:toggle()
end

local vertical_term = Terminal:new {
  cmd = "python",
  direction = "vertical",
  }

function _VERTICAL_TERM()
  vertical_term:toggle(60)
end

local horizontal_term = Terminal:new {
  cmd = "python",
  direction = "horizontal",
}

function _HORIZONTAL_TERM()
  horizontal_term:toggle(10)
end


wk.register(
  {
    t = {
      name = "Terminal",
      f = { "<cmd>lua _FLOAT_TERM()<cr>", "Floating" },
      h = { "<cmd>lua _HORIZONTAL_TERM()<cr>", "Horizontal" },
      p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
      n = { "<cmd>lua _NCDU_TOGGLE()<cr>", "Ncdu" },
      s = { '<cmd>SlimeConfig<cr>', 'Slime config' },
      t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
      v = { "<cmd>lua _VERTICAL_TERM()<cr>", "Vertical" },
    },
  },
  { mode = 'n', prefix = '<leader>' }
)
