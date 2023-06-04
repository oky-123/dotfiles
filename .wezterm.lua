local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Colorscheme
config.color_scheme = 'Railscasts (base16)'
-- config.color_scheme = 'Rapture'

config.window_decorations = 'RESIZE'

-- Fonts
config.font = wezterm.font('Menlo')
config.font_size = 12.0
-- config.line_height = 1.1

-- Keybindings
config.disable_default_key_bindings = true
config.scrollback_lines = 10000
config.enable_scroll_bar = true

config.keys = {
  -- Normal Mode
  {
    mods = "CMD",
    key = "t",
    action = wezterm.action { SpawnTab = "CurrentPaneDomain" },
  },
  {
    mods = "CMD",
    key = "n",
    action = wezterm.action.SpawnWindow,
  },
  {
    mods = "CMD",
    key = "1",
    action = wezterm.action { ActivateTab = 0 },
  },
  {
    mods = "CMD",
    key = "2",
    action = wezterm.action { ActivateTab = 1 },
  },
  {
    mods = "CMD",
    key = "3",
    action = wezterm.action { ActivateTab = 2 },
  },
  {
    mods = "CMD",
    key = "4",
    action = wezterm.action { ActivateTab = 3 },
  },
  {
    mods = "CMD",
    key = "5",
    action = wezterm.action { ActivateTab = 4 },
  },

  {
    mods = "CMD",
    key = "=",
    action = wezterm.action.IncreaseFontSize,
  },
  {
    mods = "CMD",
    key = "-",
    action = wezterm.action.DecreaseFontSize,
  },

  {
    mods = "CMD",
    key = "v",
    action = wezterm.action { PasteFrom = "Clipboard" },
  },
  {
    mods = "CMD",
    key = "w",
    action = wezterm.action { CloseCurrentTab = { confirm = true } },
  },
  {
    mods = "CMD",
    key = "q",
    action = wezterm.action.QuitApplication,
  },
  {
    mods = "CMD",
    key = "l",
    action = wezterm.action.ShowDebugOverlay,
  },

  {
    mods = "CMD",
    key = "c",
    action = wezterm.action.ActivateCopyMode,
  },
  {
    mods = "CMD",
    key = "f",
    action = wezterm.action { Search = "CurrentSelectionOrEmptyString" },
  },
  {
    mods = "CMD",
    key = "s",
    action = wezterm.action.QuickSelect,
  },

  {
    mods = "CMD",
    key = "d",
    action = wezterm.action { ScrollByPage = 0.5 },
  },
  {
    mods = "CMD",
    key = "u",
    action = wezterm.action { ScrollByPage = -0.5 },
  },
  {
    mods = "CMD",
    key = "j",
    action = wezterm.action { ScrollByPage = 0.05 },
  },
  {
    mods = "CMD",
    key = "k",
    action = wezterm.action { ScrollByPage = -0.05 },
  },

  {
    mods = "CMD",
    key = '_',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    mods = "CMD",
    key = '|',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'X',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    mods = 'CMD',
    key = 'L',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    mods = 'CMD',
    key = 'H',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    mods = 'CMD',
    key = 'K',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    mods = 'CMD',
    key = 'J',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    mods = 'OPT',
    key = 'L',
    action = wezterm.action.AdjustPaneSize { 'Right', 2 },
  },
  {
    mods = 'OPT',
    key = 'H',
    action = wezterm.action.AdjustPaneSize { 'Left', 2 },
  },
  {
    mods = 'OPT',
    key = 'K',
    action = wezterm.action.AdjustPaneSize { 'Up', 2 },
  },
  {
    mods = 'OPT',
    key = 'J',
    action = wezterm.action.AdjustPaneSize { 'Down', 2 },
  },

  -- Open link by QuickSelect
  {
    key = "p",
    mods = "CMD",
    action = wezterm.action { QuickSelectArgs = {
      patterns = {
        "https?://\\S+"
      },
      action = wezterm.action_callback(function(window, pane)
        local url = window:get_selection_text_for_pane(pane)
        wezterm.log_info("opening: " .. url)
        wezterm.open_with(url)
      end)
    } }
  }
}

return config
