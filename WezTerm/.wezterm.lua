local wezterm = require("wezterm")
local colors = require('lua/rose-pine').colors()

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.colors = colors
config.font = wezterm.font_with_fallback {
    "VictorMono Nerd Font",
    "VictorMono Nerd Font Mono",
    "Symbols Nerd Font",
}
config.font_size = 11
config.enable_tab_bar = false
config.window_background_opacity = 0.90
config.text_background_opacity = 1

config.window_padding = {
    left = "15px",
    right = "15px",
    top = "15px",
    bottom = "15px",
}

return config
