-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

return {
  initial_cols = 100,
  initial_rows = 40,
  font = wezterm.font_with_fallback({
    'PlemolJP',
  }),
  font_size = 14.0,
  cell_width = 1.0,
  line_height = 1.2,
  color_scheme = 'Chalk',
  window_background_opacity = 0.85,
  text_background_opacity = 0.95,
  skip_close_confirmation_for_processes_named = {""},
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  leader = { key="q", mods="CTRL", timeout_milliseconds=1000 },
  colors = {
    cursor_bg = '#008080',
    cursor_fg = '#FFF',
    cursor_border = '#008080',
  },
  keys = {
      { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
      { key = "q", mods = "LEADER", action = act.CloseCurrentTab{ confirm = true } },
      { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
      { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
      { key = "w", mods = "LEADER", action = act.ShowTabNavigator },

      { key = "v", mods = "LEADER", action = act.SplitHorizontal{ domain = "CurrentPaneDomain" } },
      { key = "s", mods = "LEADER", action = act.SplitVertical{ domain = "CurrentPaneDomain" } },
      { key = "x", mods = "LEADER", action = act.CloseCurrentPane{ confirm = true } },
      { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

      { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
      { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
      { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
      { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
      { key = "H", mods = "LEADER", action = act.AdjustPaneSize{"Left", 10} },
      { key = "L", mods = "LEADER", action = act.AdjustPaneSize{"Right", 10} },
      { key = "K", mods = "LEADER", action = act.AdjustPaneSize{"Up", 5} },
      { key = "J", mods = "LEADER", action = act.AdjustPaneSize{"Down", 5} },

      { key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },

      { key = "Enter", mods = "ALT", action = 'DisableDefaultAssignment' },
  },
}
