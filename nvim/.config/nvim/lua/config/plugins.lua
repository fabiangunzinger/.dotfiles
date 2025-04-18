local plugins = {

  -- undo tree
  { 'mbbill/undotree', commit = "485f01e" },

  -- latex support
  { 'lervag/vimtex', commit = "ed5c5ea" },

  -- common dependencies
  { 'nvim-lua/plenary.nvim', commit = "5254482" },
  { "nvim-tree/nvim-web-devicons", commit = "986875b" },

  -- quick file navigation
  -- { 'ThePrimeagen/harpoon', commit = "8cb54c4" },
  {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" },
      commit = "a38be6e",
  },
  -- object finder
  -- { 'nvim-telescope/telescope.nvim', commit = "6d3fbff" },
  { 'nvim-telescope/telescope.nvim', version = "0.1.4" },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', commit = "580b6c4" },
  { 'nvim-telescope/telescope-dap.nvim', commit = "313d2ea" },
  { 'nvim-telescope/telescope-ui-select.nvim', commit = "62ea5e5" },
  { 'nvim-telescope/telescope-file-browser.nvim', commit = "1aa7f12" },
  { 'crispgm/telescope-heading.nvim', commit = "39e549c" },

  -- filetree
  { "nvim-tree/nvim-tree.lua", commit = "736c7ff" },

  -- statusbar
  { 'nvim-lualine/lualine.nvim', commit = "05d78e9" },

  -- show keybinding help window
  { 'folke/which-key.nvim', version = "1.4.2" },

  -- -- lsp
  { "williamboman/mason.nvim"},
  { 'neovim/nvim-lspconfig'},
  -- { 'williamboman/mason-lspconfig.nvim'},
  -- { "jose-elias-alvarez/null-ls.nvim"},
  -- { "jay-babu/mason-null-ls.nvim"},

  -- syntax highlighs
  { 'nvim-treesitter/nvim-treesitter', version = "0.9.2" },
  { 'nvim-treesitter/nvim-treesitter-textobjects', commit = "95b76b9" },

  -- testing
  { "nvim-neotest/neotest", version = "3.2.2" },
  { "nvim-neotest/neotest-python", commit = "6c06041" },

  -- debugging
  { 'mfussenegger/nvim-dap', version = "0.6.0" },
  { 'rcarriga/nvim-dap-ui', version = "3.8.1" },
  { "mfussenegger/nvim-dap-python", commit = "51ecb08" },

  -- enhanced terminal usage
  { "akinsho/toggleterm.nvim", commit = "026dff5" },

  -- quarto support
  { 'jmbuhr/otter.nvim', commit = "4630e71" },
  { 'quarto-dev/quarto-nvim', commit = "66791ef" },

  -- use . after plugin map
  { 'tpope/vim-repeat', commit = "24afe92" },

  -- unix shell commands
  { 'tpope/vim-eunuch', commit = "291ef1f" },

  -- useful surround shortcuts
  { 'tpope/vim-surround', commit = "3d188ed" },

  -- powerful substitution and case conversions
  { 'tpope/vim-abolish', commit = "cb3dcb2" },

  -- complementary pairs of mappings
  { 'tpope/vim-unimpaired', commit = "6d44a6d" },

  -- use quickfix for bulk change/replace
  { 'stefandtw/quickfix-reflector.vim', version = "0.1" },

  -- smart commenting
  { 'numToStr/Comment.nvim', commit = "e1fe531" },

  -- markdown support
  -- { 'preservim/vim-markdown', version = "1.0.0" },
  { 'godlygeek/tabular', version = "1.0.0" },

  -- indention level objects
  { 'michaeljsmith/vim-indent-object', version = "1.1.2" },

  -- distraction free writing
  { "folke/zen-mode.nvim", tag = "v1.2.0" },

  -- title-case text
  { 'christoomey/vim-titlecase', commit = "69a697c" },

  -- highlight yanked region
  { 'machakann/vim-highlightedyank', commit = "fa3f57b" },
 
  -- lspconfig setup for neovim config files
  { "folke/neodev.nvim", version = "2.5.2" },

  -- git
  { 'akinsho/git-conflict.nvim', version = "1.1.2" },
  { 'lewis6991/gitsigns.nvim', version = "0.6" },
  { 'tpope/vim-fugitive', version = "3.7" },

  -- send code to repl
  { 'jpalardy/vim-slime', commit = "bb15285",
    init = function()

      vim.b['quarto_is_' .. 'python' .. '_chunk'] = false
        Quarto_is_in_python_chunk = function()
          require 'otter.tools.functions'.is_otter_language_context('python')
        end

        vim.cmd [[
        function SlimeOverride_EscapeText_quarto(text)
        call v:lua.Quarto_is_in_python_chunk()
        if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk
        return ["%cpaste -q", "\n", a:text, "--", "\n"]
        else
        return a:text
        end
        endfunction
        ]]

        local function mark_terminal()
          vim.g.slime_last_channel = vim.b.terminal_job_id
          vim.print(vim.g.slime_last_channel)
        end

        local function set_terminal()
          vim.b.slime_config = { jobid = vim.g.slime_last_channel }
        end

        vim.b.slime_cell_delimiter = "# %%"

        -- slime, neovvim terminal
        vim.g.slime_target = "neovim"
        vim.g.slime_python_ipython = 1

        -- -- slime, tmux
        -- vim.g.slime_target = 'tmux'
        -- vim.g.slime_bracketed_paste = 1
        -- vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }

        local function toggle_slime_tmux_nvim()
          if vim.g.slime_target == 'tmux' then
            pcall(function()
              vim.b.slime_config = nil
              vim.g.slime_default_config = nil
            end
            )
            -- slime, neovvim terminal
            vim.g.slime_target = "neovim"
            vim.g.slime_bracketed_paste = 0
            vim.g.slime_python_ipython = 1
          elseif vim.g.slime_target == 'neovim' then
            pcall(function()
              vim.b.slime_config = nil
              vim.g.slime_default_config = nil
            end
            )
            -- -- slime, tmux
            vim.g.slime_target = 'tmux'
            vim.g.slime_bracketed_paste = 1
            vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }
          end
        end


        vim.g.slime_no_mappings = 1

        wk = require('which-key')

        wk.register({
          ["<leader>"] = {
            ["<leader>"] = {
              ["s"] = { toggle_slime_tmux_nvim, "Toggle tmux/nvim terminal" },
              ["t"] = { mark_terminal, "Mark terminal" },
              ["T"] = { set_terminal, "Set terminal" },
            },
          },
        })

        vim.keymap.set('x', '<c-c><c-c>', '<Plug>SlimeRegionSend')
        vim.keymap.set('n', '<c-c><c-c>', '<Plug>SlimeParagraphSend')
        vim.keymap.set('n', '<leader><cr>', '<Plug>SlimeSendCell')

    end
  },

  -- fast search
  { 'BurntSushi/ripgrep', version = "13.0.0" },

  -- smooth vim and tmux navigation
  { 'christoomey/vim-tmux-navigator', version = "1.0" },

  -- measure startuptime
  { "dstein64/vim-startuptime", version = "4.4.0" },

  -- snippets
  { 'honza/vim-snippets', version = "1.0.0" },
  { "L3MON4D3/LuaSnip", version = "1.2.1" },

  -- completion
  {
    'hrsh7th/nvim-cmp',
    version = "0.0.1",
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp'},
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'f3fora/cmp-spell' },
      { 'ray-x/cmp-treesitter' },
      { 'kdheepak/cmp-latex-symbols' },
      { 'jmbuhr/cmp-pandoc-references' },
      { 'honza/vim-snippets' },
      { 'onsails/lspkind-nvim' },
      'LuaSnip',
    },
  },

  -- colorschemes
  { 
    "catppuccin/nvim",
    name = "catppuccin",
    -- priority = 1000,
    version = "1.2.1",
    -- config = function()
    --   vim.cmd("colorscheme catppuccin-macchiato")
    -- end,
  },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    -- priority = 1000,
    -- config = function()
    --   vim.g.gruvbox_material_enable_italic = true
    --   vim.cmd.colorscheme('gruvbox-material')
    -- end
  },
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({
        -- ...
      })

      vim.cmd('colorscheme github_dark_dimmed')
    end,
  },



  -- ai support
  { "github/copilot.vim" },
--   {
--     "jackMort/ChatGPT.nvim",
--     event = "VeryLazy",
--     dependencies = {
--       "MunifTanjim/nui.nvim",
--       "nvim-lua/plenary.nvim",
--       "nvim-lua/plenary.nvim",
--     },
--   },
}


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=v9.16.1",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup(plugins)
