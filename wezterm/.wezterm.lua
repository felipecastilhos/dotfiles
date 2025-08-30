local wezterm = require 'wezterm'

return {
    font = wezterm.font("FiraCode Nerd Font"),
    color_scheme = "Catppuccin Mocha",
    window_background_opacity = 0.97,
    window_decorations = "RESIZE",
    adjust_window_size_when_changing_font_size = false,

    keys = {
        {
            key = "v", 
            mods = "CTRL|ALT", 
            action = wezterm.action.SplitVertical {
                domain="CurrentPaneDomain"
            }
        },
        {
            key= "w", 
            mods= "CMD", 
            action=wezterm.action.CloseCurrentPane {
                confirm=true
            }
        }
    }
}
