local present, lualine = pcall(require, "lualine")
if not present then
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    -- theme = "catppuccin",
    -- component_separators = { left = "", right = "" },
    -- section_separators = { left = "", right = "" },
    disabled_filetypes = { 'NvimTree' },
    always_divide_middle = true,
    globalstatus = true,
  },
})


