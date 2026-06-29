-- Visual treatment.

hl.config({
  decoration = {
    rounding = 10,
    rounding_power = 2,
    active_opacity = 1.0,
    inactive_opacity = 0.95,
    fullscreen_opacity = 1.0,
    shadow = {
      enabled = true,
      range = 8,
      render_power = 2,
      color = 0xee111111,
    },
    blur = {
      enabled = true,
      size = 4,
      passes = 2,
      new_optimizations = true,
      xray = true,
      ignore_opacity = true,
      vibrancy = 0.16,
    },
  },
})
