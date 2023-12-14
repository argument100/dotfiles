return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },

  config = function()
    local telescope = require 'telescope'

    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ['<C-h>'] = 'which_key',
          },
          n = {
            ["q"] = require("telescope.actions").close,
          },
        },
        winblend = 20,
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        path_display = { "truncate" },
        file_ignore_patterns = {
            -- 検索から除外するものを指定
            "^.git/",
            "^.cache/",
            "^Library/",
            "Parallels",
            "^Movies",
            "^Music",
            "node_modules",
        },
        vimgrep_arguments = {
            -- ripggrepコマンドのオプション
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "-uu",
        },
      },

      extensions_list = { "themes", "terms", "fzf" },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    }
    telescope.load_extension 'fzf'

    local builtin = require 'telescope.builtin'

    -- vim.keymap.set('n', '<leader>ff', '<cmd> Telescope find_files <CR>')
    -- vim.keymap.set('n', '<leader>fg', '<cmd> Telescope live_grep <CR>')
    -- vim.keymap.set('n', '<leader>fb', '<cmd> Telescope buffers <CR>')
    -- vim.keymap.set('n', '<leader>fo', '<cmd> Telescope oldfiles <CR>')
    -- vim.keymap.set('n', '<leader>fh', '<cmd> Telescope help_tags <CR>')
    vim.keymap.set('n', '<leader>ff', builtin.find_files)
    vim.keymap.set('n', '<leader>fg', builtin.live_grep)
    vim.keymap.set('n', '<leader>fb', builtin.buffers)
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles)
    vim.keymap.set('n', '<leader>fh', builtin.help_tags)
  end
}
