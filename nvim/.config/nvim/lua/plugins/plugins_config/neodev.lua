local present, neodev = pcall(require, "neodev")
if not present then
  return
end

-- recommended by nvim-dap-ui
neodev.setup {
  library = {
    plugins = {
      "nvim-dap-ui",
      "neotest",
    },
    types = true
  },
}
