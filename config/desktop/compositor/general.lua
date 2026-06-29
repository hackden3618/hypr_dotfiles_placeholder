-- Compositor geometry and layout.

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 10,
    border_size = 2,
    resize_on_border = true,
    allow_tearing = false,
    layout = "master",
  },
  dwindle = {
    preserve_split = true,
    smart_split = true,
    smart_resizing = true,
  },
  master = {
    new_status = "master",
    mfact = 0.55,
  },
})
