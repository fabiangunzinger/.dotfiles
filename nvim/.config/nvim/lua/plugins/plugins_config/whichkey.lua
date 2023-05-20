local wk = require("which-key")


wk.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  motions = {
    count = true,
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
    padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    zindex = 1000, -- positive value to position WhichKey above other floating windows.
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
  show_help = true, -- show a help message in the command line for using WhichKey
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specifiy a list manually
  -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
  triggers_nowait = {
    -- marks
    -- "`",
    -- "'",
    -- "g`",
    "g'",
    -- registers
    -- '"',
    -- "<c-r>",
    -- spelling
    "z=",
  },
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for keymaps that start with a native binding
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by default for Telescope
  disable = {
    buftypes = {},
    filetypes = {},
  },
}



wk.register(
  {
    g = {
      name = "git",
      s = { ":Gitsigns<cr>", "gitsigns" },
      c = {
        name = "git conflict",
        o = { "<Plug>(git-conflict-ours)", "use ours" },
        t = { "<Plug>(git-conflict-theirs)", "use theirs" },
        b = { "<Plug>(git-conflict-both)", "use both" },
        x = { "<Plug>(git-conflict-none)", "use none" },
        p = { "<Plug>(git-conflict-prev-conflict)", "previous conflict" },
        n = { "<Plug>(git-conflict-next-conflict)", "next conflict" },
      },
    },
    v = {
      name = 'vim',
      c = { ':Telescope colorscheme<cr>', 'colortheme' },
      l = { ':Lazy<cr>', 'Lazy' },
      m = { ':Mason<cr>', 'Mason' },
      s = { ':e $MYVIMRC | :cd %:p:h | split . | wincmd k<cr>', 'Settings' },
    },
    l = {
      name = 'language/lsp',
      r    = { '<cmd>Telescope lsp_references<cr>', 'references' },
      R    = { vim.lsp.buf.rename, 'rename' },
      D    = { vim.lsp.buf.type_definition, 'type definition' },
      a    = { vim.lsp.buf.code_action, 'coda action' },
      e    = { vim.diagnostic.open_float, 'diagnostics' },
      f    = { vim.lsp.buf.format, 'format' },
      o    = { ':SymbolsOutline<cr>', 'outline' },
      d    = {
        name = 'diagnostics',
        d = { vim.diagnostic.disable, 'disable' },
        e = { vim.diagnostic.enable, 'enable' },
      },
    },
    c = {
      name = "code",
      s = { '<cmd>SlimeConfig<cr>', 'slime config' },
      v = { "<cmd>lua _VERTICAL_TERM()<cr>", "vertical terminal" },
      h = { "<cmd>lua _HORIZONTAL_TERM()<cr>", "horizontal terminal" },
      f = { "<cmd>lua _FLOAT_TERM()<cr>", "flating terminal" },
      p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "python terminal" },
      t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "htop" },
      c = {
        name = "copilot",
        d = { "<cmd>Copilot disable<cr>", "disable copilot" },
        e = { "<cmd>Copilot enable<cr>", "enable copilot" },
        -- n = { "<Plug>(copilot-next)", "next suggestion" },
        -- p = { "<Plug>(copilot-prev)", "previous suggestion" },
        -- s = { "<Plug>(copilot-suggest)", "suggest" },
      },
      q = {
        name = 'quarto',
        a = { ":QuartoActivate<cr>", 'activate' },
        p = { ":lua require'quarto'.quartoPreview()<cr>", 'preview' },
        q = { ":lua require'quarto'.quartoClosePreview()<cr>", 'close' },
        h = { ":QuartoHelp ", 'help' },
        e = { ":lua require'otter'.export()<cr>", 'export' },
        E = { ":lua require'otter'.export(true)<cr>", 'export overwrite' },
      },
    },
    d = {
      name = "debug",
      b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "debug breakpoint" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "debug continue" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "debug over" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "debug into" },
      r = { "<cmd>lua require'dap'.repl_open()<cr>", "debug repl" },
      u = { "<cmd>lua require'dapui'.toggle()<cr>", "debug into" },
      t = {
        name = "test",
        m = { "<cmd>lua require('neotest').run.run()<cr>", "test method" },
        M = { "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<cr>", "test method DAP" },
        f = { "<cmd>lua require('neotest').run.run({ vim.fn.expand('%') })<cr>", "test file" },
        F = { "<cmd>lua require('neotest').run.run({ vim.fn.expand('%'), strategy = 'dap' })<cr>", "test file DAP" },
        s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "test summary" }
      },
    },
    h = {
      name = "harpoon",
      h = { ':lua require("harpoon.ui").toggle_quick_menu()<cr>', "Toggle menu" },
      m = { ':lua require("harpoon.mark").add_file()<cr>', "Mark file" },
      n = { ':lua require("harpoon.ui").nav_next()<cr>', "Next file" },
      p = { ':lua require("harpoon.ui").nav_prev()<cr>', "Previous file" },
      t = { 'lua require("harpoon.term").gotoTerminal(1)<cr>', "Go to terminal 1" },
    },
  }, { mode = 'n', prefix = '<leader>' }
)


-- normal mode
wk.register({
  ['<c-LeftMouse>'] = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'go to definition' },
  ["<c-q>"]         = { '<cmd>q<cr>', 'close buffer' },
  ['<esc>']         = { '<cmd>noh<cr>', 'remove search highlight' },
  ['n']             = { 'nzzzv', 'center search' },
  ['gN']            = { 'Nzzzv', 'center search' },
  ['gl']            = { '<c-]>', 'open help link' },
  ['gf']            = { ':e <cfile><CR>', 'edit file' },
  ['co']            = { 'o#%%<cr>', 'new code chunk below' },
  ['cO']            = { 'O#%%<cr>', 'new code chunk above' },
  ['<m-i>']         = { 'o```{r}<cr>```<esc>O', "r code chunk" },
  ['<cm-i>']        = { 'o```{python}<cr>```<esc>O', "r code chunk" },
  ['<m-I>']         = { 'o```{python}<cr>```<esc>O', "r code chunk" },
}, { mode = 'n' })

-- visual mode
wk.register({
  ['q'] = { ':norm @q<cr>', 'repat q macro' },
}, { mode = 'v' })
