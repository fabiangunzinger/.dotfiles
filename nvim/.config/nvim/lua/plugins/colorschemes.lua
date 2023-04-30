return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "gruvbox"
    end
  },
  { "catppuccin/nvim", lazy = true},
  { 'rose-pine/neovim', lazy = true},
}
