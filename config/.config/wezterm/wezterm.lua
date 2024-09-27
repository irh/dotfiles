local wezterm = require 'wezterm'
local config = wezterm.config_builder()

------ Application

-- See https://wezfurlong.org/wezterm/config/keyboard-concepts.html#macos-left-and-right-option-key
config.send_composed_key_when_left_alt_is_pressed = true
-- config.send_composed_key_when_right_alt_is_pressed = false

------ Window
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

------ Font
config.font = wezterm.font_with_fallback { 'Input', 'Apple Color Emoji' }
config.font_size = 12
config.cell_width = 0.9

------ Color scheme
config.color_scheme = 'OneDark (base16)'

return config
