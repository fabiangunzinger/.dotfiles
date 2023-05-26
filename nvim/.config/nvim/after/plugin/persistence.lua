local present, persistence = pcall(require, "persistence")
if not present then
  return
end

persistence.setup {
  -- directory where session files are saved
  dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
  -- sessionoptions used for saving
  options = { "buffers", "curdir", "help", "tabpages", "terminal", "winsize" }, -- a function to call before saving the session
  pre_save = nil,
}
