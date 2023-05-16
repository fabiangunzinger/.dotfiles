local present, copilot = pcall(require, "copilot")
if not present then
  return
end

local wk = require("whichkey")



vim.keymap.set("n", "jk", "<Plug>(copilot-dismiss)")


