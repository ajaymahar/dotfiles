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

-- Spawn a fish shell in login mode
-- config.default_prog = { '/usr/local/bin/fish', '-l' }

-- config.color_scheme = "Tokyo Night"
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font_with_fallback({
  -- { family = "Iosevka Nerd Font",  scale = 1.7, weight = "Medium", },
  -- { family = "CaskaydiaCove Nerd Font",  scale = 1.7 },
  { family = "VictorMono Nerd Font",  scale = 1.9, weight = "Medium" },
})
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 10000
config.default_workspace = "main"
config.enable_tab_bar = false
-- config.hide_tab_bar_if_only_one_tab = true

-- Windows padding
config.window_padding = {
  left = 12,
  right = 12,
  top = 12,
  bottom = 12,
}
return config
