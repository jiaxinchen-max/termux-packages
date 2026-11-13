-- Candidate Android session; runtime/window/input validation is still required.
hl.monitor({ output = "ANDROID-1", mode = "preferred", position = "auto", scale = 1 })
hl.config({
    general = { gaps_in = 4, gaps_out = 8, border_size = 2, layout = "dwindle", allow_tearing = false },
    decoration = { rounding = 4, blur = { enabled = false }, shadow = { enabled = false } },
    animations = { enabled = false },
    input = { kb_layout = "us", follow_mouse = 1, touchdevice = { output = "ANDROID-1" } },
    misc = { disable_hyprland_logo = true, force_default_wallpaper = -1 },
})
hl.on("hyprland.start", function()
    hl.exec_cmd("xfce4-terminal --disable-server")
end)
hl.bind("SUPER + Return", hl.dsp.exec_cmd("xfce4-terminal --disable-server"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("thunar"))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
