local present, harpoon = pcall(require, "harpoon")
if not present then
  return
end

local wk = require("which-key")


wk.register(
  {
    h = {
      name = "Harpoon",
      h = { ':lua require("harpoon.ui").toggle_quick_menu()<cr>', "Toggle menu" },
      m = { ':lua require("harpoon.mark").add_file()<cr>', "Mark file" },
      n = { ':lua require("harpoon.ui").nav_next()<cr>', "Next file" },
      p = { ':lua require("harpoon.ui").nav_prev()<cr>', "Previous file" },
      t = { 'lua require("harpoon.term").gotoTerminal(1)<cr>', "Go to terminal 1" },
    },
  }, { mode = 'n', prefix = '<leader>' }
)

-- normal mode
wk.register({
  ['<c-k>'] = { ':lua require("harpoon.ui").nav_next()<cr>', "Next file" },
  ['<c-j>'] = { ':lua require("harpoon.ui").nav_prev()<cr>', "Previous file" },
}, { mode = 'n' })

