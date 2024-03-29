return {
  require "plugins.dashboard",
  {
    'wakatime/vim-wakatime',
    lazy = false
  },
  { -- colorscheme
    "Mofiqul/dracula.nvim",
    config = function()
      vim.cmd([[colorscheme dracula-soft]])
      vim.cmd([[highlight CursorLine guibg=#2e3440]])
    end
  },
  "editorconfig/editorconfig-vim",
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "dracula-nvim"
        },
        sections = {
          lualine_c = {
            {
              "filename",
              path = 3,
              "searchcount",
            }
          },
        },
      })
    end
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("lualine").setup()
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function ()
      require'colorizer'.setup()
    end
  },
  {
    "mvllow/modes.nvim",
    tag = "v0.2.0",
    config = function()
      require("modes").setup({
        colors = {
          copy = "#FFEE55",
          delete = "#DC669B",
          insert = "#55AAEE",
          visual = "#DD5522",
        },

        set_cursor = false,
        -- Set opacity for cursorline and number background
        line_opacity = 0.35,

        -- Disable modes highlights in specified filetypes
        -- Please PR commonly ignored filetypes
        ignore_filetypes = { "NvimTree", "TelescopePrompt" }
      })
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = { char = "▏" },
      })
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        current_line_blame = true
      })
    end
  },
  {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup()
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
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "css", "scss", "vue", "go", "org" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        additional_vim_regex_highlighting = { 'org' },
      })
    end
  },
  {
    "williamboman/mason.nvim",
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
      { "nvimdev/lspsaga.nvim" },
    },
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          enable = false,
        },
        ui = {
          border = "single",
        },
        lightbulb = {
          enable = false,
        },
      })
      require("mason-lspconfig").setup()
      local on_attach = function(client, bufnr)

        -- LSPが持つフォーマット機能を無効化する
        client.server_capabilities.documentFormattingProvider = false

        -- 下記ではデフォルトのキーバインドを設定しています
        -- ほかのLSPプラグインを使う場合（例：Lspsaga）は必要ないこともあります

        -- keyboard shortcut
        local set = vim.keymap.set
        set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
        set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
        set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
        set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
        set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
        set("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
        set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
        set("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>")
        set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
        set("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
        set("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
        set("n", "g]", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
        set("n", "g[", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")

        set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
        set("n", "<leader>1", "<cmd>Lspsaga finder<CR>")
        set("n", "<leader>2", "<cmd>Lspsaga rename<CR>")
        set("n", "<leader>3", "<cmd>Lspsaga code_action<CR>")
        set("n", "<leader>4", "<cmd>Lspsaga show_line_diagnostics<CR>")
        set("n", "<leader>5", "<cmd>Lspsaga peek_definition<CR>")
        set("n", "<leader>[", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
        set("n", "<leaaer>]", "<cmd>Lspsaga diagnostic_jump_next<CR>")
      end

      -- 補完プラグインであるcmp_nvim_lspをLSPと連携
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require('lspconfig')
      require("mason-lspconfig").setup_handlers {
        -- 特定のLSPサーバーに対するカスタム設定
        ["tsserver"] = function()
          local node_root_dir = lspconfig.util.root_pattern("package.json")
          if node_root_dir(vim.fn.getcwd()) then
            lspconfig.tsserver.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              root_dir = node_root_dir
            })
          end
        end,

        ["denols"] = function()
          local node_root_dir = lspconfig.util.root_pattern("package.json")
          if not node_root_dir(vim.fn.getcwd()) then
            lspconfig.denols.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              -- Denoに関するその他の設定
              root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", "deps.ts", "import_map.json"),
              init_options = {
                lint = true,
                unstable = true,
                suggest = {
                  imports = {
                    hosts = {
                      ["https://deno.land"] = true,
                      ["https://cdn.nest.land"] = true,
                      ["https://crux.land"] = true
                    }
                  }
                }
              }
            })
          end
        end,

        ["rust_analyzer"] = function()
          lspconfig.rust_analyzer.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
              ["rust-analyzer"] = {
                checkOnSave = {
                  command = "clippy"
                }
              }
            }
          })
        end,

        -- すべてのその他のLSPサーバーに対するデフォルトの設定
        function(server_name)
          if server_name ~= "tsserver" and server_name ~= "denols" and server_name ~= rust_analyzer then
            lspconfig[server_name].setup({
              on_attach = on_attach,
              capabilities = capabilities
            })
          end
        end
      }
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind.nvim",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      -- Lspkindのrequire
      local lspkind = require "lspkind"
      --補完関係の設定
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup({
        sources = {
          { name = "nvim_lsp" },--ソース類を設定
          { name = "buffer" },
          { name = "path" },
          { name = "luasnip" },
          { name = "orgmode" },
          { name = "liquid" },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(), --Ctrl+pで補完欄を一つ上に移動
          ["<C-n>"] = cmp.mapping.select_next_item(), --Ctrl+nで補完欄を一つ下に移動
          ["<C-s>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-a>"] = cmp.mapping.confirm({ select = true }),--Ctrl+yで補完を選択確定
        }),
        experimental = {
          ghost_text = false,
        },
        -- Lspkind(アイコン)を設定
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol", -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          })
        }
      })

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" } --ソース類を設定
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
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
  {
    "j-hui/fidget.nvim",
    config = function ()
      require("fidget").setup {
        text = {
          spinner = "meter",
        },
      }
    end
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function ()
      require("toggleterm").setup{
        open_mapping = [[<A-i>]],
        direction = "float",
        float_opts = {
          border = "double",
        }
      }
    end
  },
  {
    "ggandor/lightspeed.nvim",
    config = function ()
      require("lightspeed").setup{}
    end
  },

  require "plugins.telescope",
  require "plugins.orgmode",
}
