local present, copilot = pcall(require, "copilot")
if not present then
  return
end


vim.keymap.set("i", "<D-]", "<Plug>(copilot-next)")
vim.keymap.set("i", "<D-[>", "<Plug>(copilot-prev)")



