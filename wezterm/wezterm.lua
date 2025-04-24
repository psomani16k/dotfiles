-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- fps
config.max_fps = 60

-- disabling the tab bar
config.enable_tab_bar = false

-- Colorscheme
config.color_scheme = 'tokyonight_night'
config.colors = {
  background = 'black'
}
config.window_background_opacity = 0.2
config.kde_window_background_blur = true

-- Padding
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- cursor thickness
-- config.cursor_thickness = 2
config.default_cursor_style = 'SteadyBar'

-- font
config.font = wezterm.font('CaskaydiaCove Nerd Font Mono')
config.font_size = 14

-- keybindings
config.keys = {
  -- ToggleFullScreen
  {
    key = 'f',
    mods = 'ALT|CTRL',
    action = wezterm.action.ToggleFullScreen
  },
  -- resizing panes
  {
    key = 'h',
    mods = 'ALT|CTRL',
    action = wezterm.action.AdjustPaneSize { 'Left', 3 }
  },
  {
    key = 'j',
    mods = 'ALT|CTRL',
    action = wezterm.action.AdjustPaneSize { 'Down', 1 }
  },
  {
    key = 'k',
    mods = 'ALT|CTRL',
    action = wezterm.action.AdjustPaneSize { 'Up', 1 }
  },
  {
    key = 'l',
    mods = 'ALT|CTRL',
    action = wezterm.action.AdjustPaneSize { 'Right', 3 }
  },
  -- navigate panes
  {
    key = 'h',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Left'
  },
  {
    key = 'j',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Down'
  },
  {
    key = 'k',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Up'
  },
  {
    key = 'l',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Right'
  },
  -- opening and closing panes
  {
    key = 'q',
    mods = 'ALT|CTRL',
    action = wezterm.action.CloseCurrentPane { confirm = true }
  },
  {
    key = 'r',
    mods = 'ALT|CTRL',
    action = wezterm.action.SplitPane { direction = 'Right' }
  },
  {
    key = 'd',
    mods = 'ALT|CTRL',
    action = wezterm.action.SplitPane { direction = 'Down' }
  },
  {
    key = 'e',
    mods = 'ALT|CTRL',
    action = wezterm.action.SplitPane { direction = 'Left' }
  },
  {
    key = 's',
    mods = 'ALT|CTRL',
    action = wezterm.action.SplitPane { direction = 'Up' }
  },
  -- opening and closing tabs
  {
    key = 'n',
    mods = 'ALT|CTRL|SHIFT',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain'
  },
  {
    key = 'q',
    mods = 'ALT|CTRL|SHIFT',
    action = wezterm.action.CloseCurrentTab { confirm = true }
  },
  -- navigating tabs
  {
    key = 'h',
    mods = 'ALT|CTRL|SHIFT',
    action = wezterm.action.ActivateTabRelative(-1)
  },
  {
    key = 'l',
    mods = 'ALT|CTRL|SHIFT',
    action = wezterm.action.ActivateTabRelative(1)
  },
  {
    key = 't',
    mods = 'ALT|CTRL|SHIFT',
    action = wezterm.action.ShowTabNavigator
  },
  -- copy paste
  {
    key = 'c',
    mods = 'ALT|CTRL',
    action = wezterm.action.CopyTo 'Clipboard'
  },
  {
    key = 'v',
    mods = 'ALT|CTRL',
    action = wezterm.action.PasteFrom 'Clipboard'
  },
}

-- and finally, return the configuration to wezterm
return config
