vim.keymap.set("i", "<tab>", function() return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>" end)
vim.keymap.set("s", "<tab>", function() require("luasnip").jump(1) end)
vim.keymap.set({ "i", "s" }, "<s-tab>", function() require("luasnip").jump(-1) end)


