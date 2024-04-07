vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  command = "setlocal textwidth=80 formatoptions+=t"
})

