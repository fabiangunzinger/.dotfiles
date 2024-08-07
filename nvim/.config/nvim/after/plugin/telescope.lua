local present, telescope = pcall(require, "telescope")
if not present then
  return
end

local actions = require('telescope.actions')
local previewers = require("telescope.previewers")
local builtin = require("telescope.builtin")
local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}
  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end
    if stat.size > 100000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end
local wk = require("which-key")

-- local often_used_dirs = os.getenv("MYDIRS")
local often_used_dirs = {
  "~/.dotfiles",
  "~/dev/personal/notes/",
  "~/dev/personal/fabiangunzinger.github.io/",
}

telescope.setup {
  defaults = {
    buffer_previewer_maker = new_maker,
    file_ignore_patterns = { "node_modules", "%_files/*.html", "%_cache", ".git/", "site_libs", ".venv" },
    layout_strategy = "flex",
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
    },
    path_display = { "smart" },
    vimgrep_arguments = {
      "rg",
      "--color=never", -- ignore colors (can't handle yet)
      "--with-filename", -- show filepath
      "--no-heading", -- show filename as prefix
      "--line-number", -- show line number
      "--column", -- show column number
      "--hidden", -- show hidden files and folders
      "--no-ignore", -- don't respect ignore files
      "--smart-case"
    },
    mappings = {
      i = {
        ["<c-h>"] = "which_key",
        ["jk"] = actions.close,
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
        ["<c-d>"] = actions.preview_scrolling_down,
        ["<c-f>"] = actions.preview_scrolling_up,
        ["<c-u>"] = false, -- use <c-u> for default "clear input" behaviour
        ["<tab>"] = false, -- use tab in insert mode (instead of picker behaviour)
      }
    }
  },
  pickers = {
    find_files = {
      hidden = true,
      find_command = {
        "rg",
        "--files",
        "--no-ignore", -- don't respect ignore files
        "--hidden", -- search hidden files and directories
        "--glob", "!.git/*", -- ignore .git directories
        '-L' -- follow symlinks
      },
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
  }
}
telescope.load_extension('fzf')
telescope.load_extension('ui-select')
telescope.load_extension('file_browser')
telescope.load_extension('dap')
telescope.load_extension('heading')
-- telescope.load_extension('projects')

-- find files quick access
-- vim.keymap.set("n", '<c-p>', "<cmd>Telescope find_files<cr>")

wk.register(
{
  f = {
    name = 'Find',
    a = { '<cmd>Telescope find_files<cr>', 'Files' }, -- faster to type
    b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer" },
    c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
    d = { "<cmd>Telescope buffers<cr>", "Buffers" },
    f = { '<cmd>Telescope find_files<cr>', 'Files' },
    g = { '<cmd>Telescop live_grep<cr>', 'Grep' },
    h = { '<cmd>Telescope help_tags<cr>', 'Help tags' },
    H = { '<cmd>Telescope heading<cr>', 'Heading' },
    j = { "<cmd>Telescope jumplist<cr>", "Marks" },
    k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
    l = { "<cmd>Telescope loclist<cr>", "Loclist" },
    m = { "<cmd>Telescope marks<cr>", "Marks" },
    M = { "<cmd>Telescope man_pages<cr>", "Man pages" },
    o = { function() builtin.find_files({ search_dirs = often_used_dirs }) end, "Other dirs" },
    -- p = { "Project" },
    q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
    r = { '<cmd>Telescope lsp_references<cr>', 'References' },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Symbols" },
    w = { '<cmd>Telescope spell_suggest<cr>', 'Suggest' },
  },
}, { mode = 'n', prefix = '<leader>' }
)
