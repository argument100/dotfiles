return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup({
        config = {
          header = {
            [[                          ]],
            [[ ██████╗ ███████╗ ██████╗ ]],
            [[██╔═══██╗╚══███╔╝██╔═══██╗]],
            [[██║   ██║  ███╔╝ ██║   ██║]],
            [[██║   ██║ ███╔╝  ██║   ██║]],
            [[╚██████╔╝███████╗╚██████╔╝]],
            [[ ╚═════╝ ╚══════╝ ╚═════╝ ]],
            [[                          ]],
          }
        }
      })
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  { -- colorscheme
    'Mofiqul/dracula.nvim',
    config = function()
      vim.cmd([[colorscheme dracula-soft]])
    end
  },
  'editorconfig/editorconfig-vim',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'dracula-nvim'
        },
        sections = {
          lualine_c = {
            {
              'filename',
              path = 3,
              'searchcount',
            }
          },
        },
      })
    end
  },
  {
    'mvllow/modes.nvim',
    tag = 'v0.2.0',
    config = function()
      require('modes').setup({
        colors = {
          copy = '#FFEE55',
          delete = '#DC669B',
          insert = '#55AAEE',
          visual = '#DD5522',
        },

        -- Set opacity for cursorline and number background
        line_opacity = 0.35,

        -- Disable modes highlights in specified filetypes
        -- Please PR commonly ignored filetypes
        ignore_filetypes = { 'NvimTree', 'TelescopePrompt' }
      })
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require('ibl').setup({
        indent = { char = "▏" },
      })
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "css", "scss", "vue", "go" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "neovim/nvim-lspconfig" },
      { "hrsh7th/nvim-cmp" },
    },
    config = function()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers {
        function (server_name) -- default handler (optional)
          local on_attach = function(client, bufnr)

            -- LSPが持つフォーマット機能を無効化する
            client.server_capabilities.documentFormattingProvider = false

            -- 下記ではデフォルトのキーバインドを設定しています
            -- ほかのLSPプラグインを使う場合（例：Lspsaga）は必要ないこともあります

            -- keyboard shortcut
            local set = vim.keymap.set
            set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
            set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
            set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
            set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
            set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
            set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
            set("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>")
            set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
            set("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
            set("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
            set("n", "g]", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
            set("n", "g[", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
          end

          -- 補完プラグインであるcmp_nvim_lspをLSPと連携
          local capabilities = require("cmp_nvim_lsp").default_capabilities()

          require("lspconfig")[server_name].setup {
            on_attach = on_attach, --keyバインドなどの設定を登録
            capabilities = capabilities, --cmpを連携
          }
        end,
      }
    end
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'onsails/lspkind.nvim',
    },
    config = function()
      -- 3. completion (hrsh7th/nvim-cmp)
      -- Lspkindのrequire
      local lspkind = require 'lspkind'
      --補完関係の設定
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        sources = {
          { name = "nvim_lsp" },--ソース類を設定
          { name = "buffer" },
          { name = "path" },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(), --Ctrl+pで補完欄を一つ上に移動
          ["<C-n>"] = cmp.mapping.select_next_item(), --Ctrl+nで補完欄を一つ下に移動
          ['<C-l>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),--Ctrl+yで補完を選択確定
        }),
        experimental = {
          ghost_text = false,
        },
        -- Lspkind(アイコン)を設定
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          })
        }
      })

      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' } --ソース類を設定
        }
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "path" }, --ソース類を設定
        },
      })
    end
  },
  require "plugins.telescope",

}
