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
config.font = wezterm.font 'Input'
config.font_size = 11

-- Color scheme
local colors = wezterm.color.get_builtin_schemes()['Solarized Dark (Gogh)']
colors.background = '#002b36'
colors.cursor_fg = 'black'

config.color_schemes = {
  ['MyScheme'] = colors,
}
config.color_scheme = 'MyScheme'

return config
