local status_ok, git_conflict = pcall(require, "git-conflict")
if not status_ok then
  return
end

git_conflict.setup {
  default_mappings = false, 
  default_commands = true,
  disable_diagnostics = false,
  highlights = {
    incoming = 'DiffText',
    current = 'DiffAdd',
  }
}

vim.keymap.set('n', 'co', '<Plug>(git-conflict-ours)')
vim.keymap.set('n', 'ct', '<Plug>(git-conflict-theirs)')
vim.keymap.set('n', 'cb', '<Plug>(git-conflict-both)')
vim.keymap.set('n', 'c0', '<Plug>(git-conflict-none)')
vim.keymap.set('n', ']x', '<Plug>(git-conflict-prev-conflict)')
vim.keymap.set('n', '[x', '<Plug>(git-conflict-next-conflict)')