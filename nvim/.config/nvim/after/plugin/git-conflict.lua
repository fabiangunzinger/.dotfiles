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
