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

telescope.setup {
  defaults = {
    buffer_previewer_maker = new_maker,
    file_ignore_patterns = { "node_modules", "%_files/*.html", "%_cache", ".git/", "site_libs", ".venv" },
    layout_strategy = "flex",
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
    },
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
    ["<esc>"] = actions.close,
    ["<c-j>"] = actions.move_selection_next,
    ["<c-k>"] = actions.move_selection_previous,
    ["<c-u>"] = false, -- use <c-u> for default "clear input" behaviour

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
telescope.load_extension('projects')

wk.register(
{
  f = {
    name = 'find (telescope)',
    f = { '<cmd>Telescope find_files<cr>', 'files' },
    g = { '<cmd>Telescop live_grep<cr>', 'grep' },
    b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "buffer" },

    -- g = { function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, "grep" },
    h = { '<cmd>Telescope help_tags<cr>', 'help' },
    k = { '<cmd>Telescope keymaps<cr>', 'keymaps' },
    r = { '<cmd>Telescope lsp_references<cr>', 'references' },
    m = { "<cmd>Telescope marks<cr>", "marks" },
    M = { "<cmd>Telescope man_pages<cr>", "man pages" },
    c = { "<cmd>Telescope git_commits<cr>", "git commits" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "symbols" },
    d = { "<cmd>Telescope buffers<cr>", "buffers" },
    q = { "<cmd>Telescope quickfix<cr>", "quickfix" },
    l = { "<cmd>Telescope loclist<cr>", "loclist" },
    j = { "<cmd>Telescope jumplist<cr>", "marks" },
    p = { "project" },
  },
}, { mode = 'n', prefix = '<leader>' }
)

