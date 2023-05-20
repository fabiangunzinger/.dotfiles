return {

  -- common dependencies
  {
    'nvim-lua/plenary.nvim',
    tag = "v0.1.3",
  },

  -- object finder
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim'},
    config = function()
      require("plugins.plugins_config.telescope")
    end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    commit = "580b6c48651cabb63455e97d7e131ed557b8c7e2" 
  },
  {
    'nvim-telescope/telescope-dap.nvim',
    commit = "313d2ea12ae59a1ca51b62bf01fc941a983d9c9c" 
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    commit = "62ea5e58c7bbe191297b983a9e7e89420f581369"
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    commit = "1aa7f12ce797bb5b548c96f38b2c93911e97c543"
  },

  -- filetree
  {
    "nvim-tree/nvim-tree.lua",
    commit = "736c7ff59065275f0483af4b7f07a9bc41449ad0",
    dependencies = {
      {
        "nvim-tree/nvim-web-devicons",
        commit = "986875b7364095d6535e28bd4aac3a9357e91bbe"
      },
    },
    config = function()
      require('plugins.plugins_config.nvim-tree')
    end
  },

  -- statusbar
  { 
    'nvim-lualine/lualine.nvim',
    commit = "05d78e9fd0cdfb4545974a5aa14b1be95a86e9c9",
    config = function()
      require("plugins.plugins_config.lualine")
    end
  },

  -- show keybinding help window
  {
    'folke/which-key.nvim',
    version = "1.4.2",
    config = function()
      require("plugins.plugins_config.whichkey")
    end,
  },

  -- completion
  {
    'hrsh7th/nvim-cmp',
    version = "0.0.1",
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
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
    config = function()
      require("plugins.plugins_config.cmp")
    end
  },

  -- lsp plugins
  {
    "williamboman/mason.nvim",
    version = "1.1.0",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  -- lsp

  -- {
  --   'VonHeikemen/lsp-zero.nvim',
  --   commit = "22650751435e8d31ea65ab97a66393cabad244a8",
  --   dependencies = {
  --     { 'neovim/nvim-lspconfig', version = "0.1.4" },
  --     { 'williamboman/mason-lspconfig.nvim', version = "1.4.0" },
  --     { 
  --       'hrsh7th/cmp-nvim-lsp',
  --       commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef"
  --     },
  --     'mason.nvim',
  --     'nvim-cmp',
  --     'cmp-nvim-lsp',
  --     'LuaSnip',
  --   },
  --   config = function()
  --     require('plugins.plugins_config.lsp')
  --   end
  -- },



  {
    'neovim/nvim-lspconfig',
    tag = nil,
    version = nil,
    branch = 'master',
    event = "BufReadPre",
    dependencies = {
      { "williamboman/mason-lspconfig.nvim" },
      { "williamboman/mason.nvim" },
      { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup {
        automatic_installation = true,
      }

      local lspconfig = require('lspconfig')
      local cmp_nvim_lsp = require('cmp_nvim_lsp')
      local util = require("lspconfig.util")

      local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
        local opts = { noremap = true, silent = true }

        buf_set_keymap('n', 'gD', '<cmd>Telescope lsp_type_definitions<CR>', opts)
        buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
        buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.codelens.run()<cr>', opts)
        client.server_capabilities.document_formatting = true
      end


      local on_attach2 = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
        local opts = { noremap = true, silent = true }

        buf_set_keymap('n', 'gD', '<cmd>Telescope lsp_type_definitions<CR>', opts)
        buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
        buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.codelens.run()<cr>', opts)
        client.server_capabilities.document_formatting = true
      end

      local lsp_flags = {
        allow_incremental_sync = true,
        debounce_text_changes = 150,
      }

      vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
      })
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover,
        { border = require 'misc.style'.border })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help,
        { border = require 'misc.style'.border })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- also needs:
      -- $home/.config/marksman/config.toml :
      -- [core]
      -- markdown.file_extensions = ["md", "markdown", "qmd"]
      lspconfig.marksman.setup {
        on_attach = on_attach2,
        capabilities = capabilities,
        filetypes = { 'markdown', 'quarto' },
        root_dir = util.root_pattern(".git", ".marksman.toml", "_quarto.yml"),
      }

      -- -- another optional language server for grammar and spelling
      -- -- <https://github.com/valentjn/ltex-ls>
      -- lspconfig.ltex.setup {
      --   on_attach = on_attach2,
      --   capabilities = capabilities,
      --   filetypes = { "markdown", "tex", "quarto" },
      -- }

      lspconfig.r_language_server.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags
      }

      lspconfig.emmet_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags
      }

      lspconfig.cssls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags
      }

      local function strsplit(s, delimiter)
        local result = {}
        for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
          table.insert(result, match)
        end
        return result
      end

      local function get_quarto_resource_path()
        local f = assert(io.popen('quarto --paths', 'r'))
        local s = assert(f:read('*a'))
        f:close()
        return strsplit(s, '\n')[2]
      end

      local lua_library_files = vim.api.nvim_get_runtime_file("", true)
      local resource_path = get_quarto_resource_path()
      table.insert(lua_library_files, resource_path .. '/lua-types')
      local lua_plugin_paths = {}
      table.insert(lua_plugin_paths, resource_path .. '/lua-plugin/plugin.lua')

      -- not upadated yet in automatic mason-lspconfig install,
      -- open mason manually with `<space>vm` and `/` search for lua.
      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags,
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace"
            },
            runtime = {
              version = 'LuaJIT',
              plugin = lua_plugin_paths,
            },
            diagnostics = {
              globals = { 'vim', 'quarto', 'pandoc', 'io', 'string', 'print', 'require', 'table', },
              disable = { 'trailing-space' },
            },
            workspace = {
              library = lua_library_files,
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }

      lspconfig.pyright.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = 'openFilesOnly',
            },
          },
        },
        root_dir = function(fname)
          return util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")(fname) or
            util.path.dirname(fname)
        end
      }

      lspconfig.julials.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags,
      }

      lspconfig.bashls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags,
        filetypes = { 'sh', 'bash' }
      }

      -- Add additional languages here.
      -- See `:h lspconfig-all` for the configuration.
      -- Like e.g. Haskell:
      -- lspconfig.hls.setup {
      --   on_attach = on_attach,
      --   capabilities = capabilities,
      --   flags = lsp_flags
      -- }
    end
  },








  {
    "jose-elias-alvarez/null-ls.nvim",
    commit = "77e53bc3bac34cc273be8ed9eb9ab78bcf67fa48",
  },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    version = "1.2.1",
    dependencies = {
      'honza/vim-snippets',
      config = function()
        require("luasnip.loaders.from_snipmate").lazy_load()
      end,
    },
    config = function()
      require("plugins.plugins_config.luasnip")
    end,
  },

  -- syntax highlighs
  {
    'nvim-treesitter/nvim-treesitter',
    commit = "05df88ebaa94d30d682d076244615786d9e7c1a5",
    config = function()
      require("plugins.plugins_config.treesitter")
    end
  },

  -- testing
  { "nvim-neotest/neotest", version = "3.2.2" },
  { 
    "nvim-neotest/neotest-python",
    commit = "6c06041cfb45f45e276068020baa06c06fe20d5c"
  },

  -- debugging
  { 'mfussenegger/nvim-dap', version = "0.6.0" },
  { 'rcarriga/nvim-dap-ui', version = "3.8.1" },
  { 
    "mfussenegger/nvim-dap-python", 
    commit = "51ecb08dbff57fca8add396b93dc765aba262e0a"
  },

  -- enhanced terminal usage
  {
    "akinsho/toggleterm.nvim",
    commit = "026dff5e2b504941cf172691561a67ea362596aa",
    config = function()
      require("plugins.plugins_config.toggleterm")
    end
  },

  -- quarto support
  {
    'quarto-dev/quarto-nvim',
    version = "0.10.0",
    dependencies = {
      { 'jmbuhr/otter.nvim', version = "0.12.0" },
      'nvim-cmp'
    },
    config = function()
      require("plugins.plugins_config.quarto")
    end
  },

  -- -- show blank lines
  -- {
  --   'lukas-reineke/indent-blankline.nvim',
  --   version = "2.20.4",
  --   config = function()
  --     require("plugins.plugins_config.indent-blankline")
  --   end
  -- },

  -- use . after plugin map
  { 'tpope/vim-repeat' },

  -- unix shell commands
  { 'tpope/vim-eunuch' },

  -- useful surround shortcuts
  { 'tpope/vim-surround' },

  -- powerful substitution and case conversions
  { 'tpope/vim-abolish' },

  -- complementary pairs of mappings
  { 'tpope/vim-unimpaired' },

  -- use quickfix for bulk change/replace
  { 'stefandtw/quickfix-reflector.vim', version = "0.1" },

  -- smart commenting
  {
    'numToStr/Comment.nvim',
    commit = "e1fe53117aab24c378d5e6deaad786789c360123",
    config = true,
  },

  -- tabular formatting
  { 'godlygeek/tabular', version = "1.0.0" },

  -- indention level objects
  { 'michaeljsmith/vim-indent-object', version = "1.1.2" },

  -- distraction free writing
  {
    "folke/zen-mode.nvim",
    tag = "v1.2.0",
    config = function()
      require("plugins.plugins_config.zen-mode")
    end
  },

  -- highlight yanked region
  { 
    'machakann/vim-highlightedyank', 
    commit = "fa3f57b097e9521ce41a66b6c7cf5d9adea70ea3" 
  },
 
  -- lspconfig setup for neovim config files
  {
    "folke/neodev.nvim",
    version = "2.5.2",
    config = function()
      require("plugins.plugins_config.neodev")
    end,
  },

  -- git
  {
    'akinsho/git-conflict.nvim',
    version = "1.1.2",
    config = function()
      require("plugins.plugins_config.git-conflict")
    end
  },

  {
    'lewis6991/gitsigns.nvim',
    version = "0.6",
    config = function()
      require('gitsigns').setup {}
    end
  },

  -- send code to repl
  {
    'jpalardy/vim-slime',
    commit = "bb152854fc21193729bf587aa055e738d50c8b48",
    config = function()
      require("plugins.plugins_config.slime")
    end,
  },

  -- fast search
  { 'BurntSushi/ripgrep', version = "13.0.0" },

  -- smooth vim and tmux navigation
  { 'christoomey/vim-tmux-navigator', version = "1.0" },

  -- measure startuptime
  {
    "dstein64/vim-startuptime",
    version = "4.4.0",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  -- colorschemes
  {
    "catppuccin/nvim",
    name = "catppuccin",
    version = "1.1.1",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-macchiato"
    end
  },

  -- copilot
  {
    "github/copilot.vim",
    config = function()
      require("plugins.plugins_config.copilot")
    end,
  },

  -- ChatGPT integration
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("plugins.plugins_config.chatgpt")
    end,
  },

  -- quick file navigation
  { 
    'ThePrimeagen/harpoon', 
    commit = "8cb54c4"
  },

}
