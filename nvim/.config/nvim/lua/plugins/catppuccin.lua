return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
    require("catppuccin").setup {
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
  end
  }
}
--
--   -- color html colors
--   { 'norcalli/nvim-colorizer.lua', config = function()
--     require 'colorizer'.setup {
--       css = { css_fn = true, css = true },
--       'javascript',
--       'html',
--       'r',
--       'rmd',
--       'qmd',
--       'markdown',
--       'python'
--     }
--   end
--   },
-- }
