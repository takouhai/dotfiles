local wezterm = require 'wezterm';
return {
  window_background_opacity = 0.9,
  font = wezterm.font("JetBrains Mono"),
  default_cursor_style = "SteadyBlock",
  colors = {
      foreground = "#8aff80",
      background = "#0b0d0f",

      cursor_bg = "#414d58",
      cursor_fg = "#f8f8f2",
      cursor_border = "#8aff80",

      selection_fg = "#f8f8f2",
      selection_bg = "#414d58",

      scrollbar_thumb = "#414d58",

      split = "#0b0d0f",

      ansi = {"#0b0d0f", "#ff9580", "#8aff80", "#ffff80", "#9580ff", "#ff80bf", "#80ffea", "#f8f8f2"},
      brights = {"#0b0d0f", "#ffaa99", "#a2ff99", "#ffff99", "#aa99ff", "#ff99cc", "#99ffee", "#ffffff"},

      indexed = {[136] = "#af8700"},
      compose_cursor = "orange",
  }
}
