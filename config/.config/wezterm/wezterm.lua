local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Application
config.window_close_confirmation = 'NeverPrompt'

-- Window
config.enable_tab_bar = false
config.initial_cols = 160
config.initial_rows = 48
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.native_macos_fullscreen_mode = true

-- Font
config.font = wezterm.font_with_fallback { 'Input', 'Apple Color Emoji' }
config.font_size = 11

-- Color scheme
local colors = wezterm.color.get_builtin_schemes()['Solarized Dark (Gogh)']
colors.background = '#002b36'
colors.cursor_fg = 'black'

config.color_schemes = {
  ['MyScheme'] = colors,
}
config.color_scheme = 'MyScheme'

-- Key Mappings
-- config.debug_key_events = true
config.keys = {
  {
    key = 'F14',
    action = wezterm.action.SendString '\x1b[26~',
  },
  {
    key = 'F15',
    action = wezterm.action.SendString '\x1b[28~',
  },
  {
    key = 'F16',
    action = wezterm.action.SendString '\x1b[29~',
  },
  {
    key = 'F17',
    action = wezterm.action.SendString '\x1b[31~',
  },
  {
    key = 'F18',
    action = wezterm.action.SendString '\x1b[32~',
  },
  {
    key = 'F19',
    action = wezterm.action.SendString '\x1b[33~',
  },
}

return config
