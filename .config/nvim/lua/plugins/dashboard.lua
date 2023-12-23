return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      config = {
        header = {
            [[ ██████╗ ███████╗ ██████╗ ]],
            [[██╔═══██╗╚══███╔╝██╔═══██╗]],
            [[██║   ██║  ███╔╝ ██║   ██║]],
            [[██║   ██║ ███╔╝  ██║   ██║]],
            [[╚██████╔╝███████╗╚██████╔╝]],
            [[ ╚═════╝ ╚══════╝ ╚═════╝ ]],
            [[                          ]],
        },
        shortcut = {
          { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
          {
            desc = " memo",
            group = "DiagnosticHint",
            action = "cd ~/obsidian/\nNvimTreeOpen",
            key = "m",
          },
          {
            desc = " dotfiles",
            group = "Number",
            action = "cd ~/dotfiles/\nNvimTreeOpen",
            key = "d",
          },
        },
      }
    })
  end,
  dependencies = { {"nvim-tree/nvim-web-devicons"}}
}
