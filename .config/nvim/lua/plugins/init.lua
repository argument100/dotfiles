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
      -- require('lualine').setup( require "plugins.lualine" )
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
        indent = { highlight = highlight, char = "▏" },
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
  require "plugins.cocnvim",
  require "plugins.telescope",

}
