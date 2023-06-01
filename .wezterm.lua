local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Colorscheme
config.color_scheme = 'Railscasts (base16)'
-- config.color_scheme = 'Rapture'

-- Fonts
config.font = wezterm.font('Menlo')
config.font_size = 12.0
config.line_height = 1.1

return config
