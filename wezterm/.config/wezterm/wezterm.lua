--- wezterm.lua
--- $ figlet -f small Wezterm
--- __      __      _
--- \ \    / /__ __| |_ ___ _ _ _ __
---  \ \/\/ / -_)_ /  _/ -_) '_| '  \
---   \_/\_/\___/__|\__\___|_| |_|_|_|
---
--- My Wezterm config file

local wezterm = require("wezterm")

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then config = wezterm.config_builder() end


-- config.color_scheme = "Tokyo Night"
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font_with_fallback({
  { family = "Iosevka Nerd Font",  scale = 1.9, weight = "Medium", },
  { family = "CaskaydiaCove Nerd Font",  scale = 1.9 },
})
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "main"
config.enable_tab_bar = false

return config
