local present, nvim_tree = pcall(require, "nvim-tree")
if not present then
  return
end

nvim_tree.setup {

  -- -- required for project-nvim
  -- sync_root_with_cwd = true,
  -- respect_buf_cwd = true,
  -- update_focused_file = {
  --   enable = true,
  --   update_root = true
  -- },

  renderer = {
    icons = {
      glyphs = {
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "",
          untracked = "",
          deleted = "",
          ignored = "",
        },
      },
    },
  },
}
