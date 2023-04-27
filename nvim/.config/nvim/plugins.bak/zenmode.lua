-- distraction free writing
return {
  {
    "folke/zen-mode.nvim",
    window = {
      backdrop = 1, -- shade the backdrop 
      width = .6, -- window width (rel or # of cols)
      height = .9, -- window height (rel or in # of cols)
      options = {
        signcolumn = "no", -- disable signcolumn
        number = false, -- disable number column
        relativenumber = false, -- disable relative numbers
        cursorline = false, -- disable cursorline
        cursorcolumn = false, -- disable cursor column
        foldcolumn = "0", -- disable fold column
        -- list = false, -- disable whitespace characters
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false, -- disables the ruler text in the cmd line area
        showcmd = false, -- disables the command in the last line of the screen
      },
      twilight = false, -- enable to start Twilight when zen mode opens
      gitsigns = false, -- disables git signs
      tmux = false, -- disables the tmux statusline
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
    -- callback where you can add custom code when the Zen window opens
    on_open = function()
    end,
    -- callback where you can add custom code when the Zen window closes
    on_close = function()
    end
  }
}

