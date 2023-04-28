local present, cattpuccin = pcall(require, "catppuccin/nvim")
if not present then
  return
end

catppuccin.setup {
  flavour = "mocha", -- mocha, macchiato, frappe, latte
  term_colors = true,
  integrations = {
    nvimtree = true,
    cmp = true,
    gitsigns = true,
    telescope = true,
    treesitter = true
  }
}
