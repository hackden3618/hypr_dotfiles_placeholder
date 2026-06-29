hl.config({ animations = { enabled = true } })

hl.curve("atlasFast", { type = "bezier", points = { {0.2, 1}, {0.2, 1} } })

hl.animation({ leaf = "global", enabled = true, speed = 12, bezier = "atlasFast" })
hl.animation({ leaf = "windows", enabled = true, speed = 8, bezier = "atlasFast", style = "popin 95%" })
hl.animation({ leaf = "fade", enabled = true, speed = 8, bezier = "atlasFast" })
hl.animation({ leaf = "layers", enabled = true, speed = 8, bezier = "atlasFast" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 7, bezier = "atlasFast", style = "fade" })
