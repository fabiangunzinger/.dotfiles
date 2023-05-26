local present, alpha = pcall(require, "alpha")
if not present then
  return
end

local dashboard = require("alpha.themes.dashboard")

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl_shortcut = "Macro"
  return b
end

dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
  button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
  button("f", "  > Find file", ":Telescope find_files <CR>"),
  button("r", "  > Recent", ":Telescope oldfiles <CR>"),
  button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k<CR>"),
  button("t", ". > Find text", "Telescope live_grep <CR>" ),
  button("t", ". > Find session", ":SearchSession <CR>" ),
  button("q", "  > Quit NVIM", ":qa<CR>"),
}

-- local fortune = require("alpha.fortune")
-- dashboard.section.footer.val = fortune({
--   fortune_list = {
--     { "You otter be proud of yourself!", "", "— 🦦" },
--     { "Hello from the otter slide!", "", "— Otterdele" },
--     { "To otter space!", "", "— 🦦" },
--     { "What if I say I'm not like the otters?", "", "— Foo Fighters" },
--   }
-- })
--
-- Send config to alpha
alpha.setup(dashboard.opts)
