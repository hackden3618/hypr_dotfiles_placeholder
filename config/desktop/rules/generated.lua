-- ============================================================
-- ATLAS generated window/layer rules
-- Source: UserConfigs/WindowRules.conf
-- Regenerate only after reviewing legacy rule changes.
-- ============================================================

hl.window_rule({
  name = [=[windowrule-1]=],
  tag = [=[+browser]=],
  match = {
    class = [=[^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr|[Ff]irefox-bin)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-2]=],
  tag = [=[+browser]=],
  match = {
    class = [=[^([Gg]oogle-chrome(-beta|-dev|-unstable)?)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-3]=],
  tag = [=[+browser]=],
  match = {
    class = [=[^(chrome-.+-Default)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-4]=],
  tag = [=[+browser]=],
  match = {
    class = [=[^([Cc]hromium)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-5]=],
  tag = [=[+browser]=],
  match = {
    class = [=[^([Mm]icrosoft-edge(-stable|-beta|-dev|-unstable))$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-6]=],
  tag = [=[+browser]=],
  match = {
    class = [=[^(Brave-browser(-beta|-dev|-unstable)?)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-7]=],
  tag = [=[+browser]=],
  match = {
    class = [=[^([Tt]horium-browser|[Cc]achy-browser)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-8]=],
  tag = [=[+browser]=],
  match = {
    class = [=[^(zen-alpha|zen)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-9]=],
  tag = [=[+notif]=],
  match = {
    class = [=[^(swaync-control-center|swaync-notification-window|swaync-client|class)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-10]=],
  tag = [=[+KooL_Cheat]=],
  match = {
    title = [=[^(KooL Quick Cheat Sheet)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-11]=],
  tag = [=[+KooL_Settings]=],
  match = {
    title = [=[^(KooL Hyprland Settings)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-12]=],
  tag = [=[+KooL-Settings]=],
  match = {
    class = [=[^(nwg-displays|nwg-look)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-13]=],
  tag = [=[+terminal]=],
  match = {
    class = [=[^(Alacritty|kitty|kitty-dropterm)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-14]=],
  tag = [=[+email]=],
  match = {
    class = [=[^([Tt]hunderbird|org.gnome.Evolution)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-15]=],
  tag = [=[+email]=],
  match = {
    class = [=[^(eu.betterbird.Betterbird)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-16]=],
  tag = [=[+projects]=],
  match = {
    class = [=[^(codium|codium-url-handler|VSCodium)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-17]=],
  tag = [=[+projects]=],
  match = {
    class = [=[^(VSCode|code-url-handler)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-18]=],
  tag = [=[+projects]=],
  match = {
    class = [=[^(jetbrains-.+)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-19]=],
  tag = [=[+screenshare]=],
  match = {
    class = [=[^(com.obsproject.Studio)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-20]=],
  tag = [=[+im]=],
  match = {
    class = [=[^([Dd]iscord|[Ww]ebCord|[Vv]esktop)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-21]=],
  center = true,
  float = true,
  size = [=[60% 70%]=],
  tag = [=[+im]=],
  match = {
    class = [=[^([Ff]erdium)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-22]=],
  tag = [=[+im]=],
  match = {
    class = [=[^([Ww]hatsapp-for-linux)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-23]=],
  tag = [=[+im]=],
  match = {
    class = [=[^(ZapZap|com.rtosta.zapzap)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-24]=],
  tag = [=[+im]=],
  match = {
    class = [=[^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-25]=],
  tag = [=[+im]=],
  match = {
    class = [=[^(teams-for-linux)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-26]=],
  tag = [=[+im]=],
  match = {
    class = [=[^(im.riot.Riot|Element)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-27]=],
  tag = [=[+games]=],
  match = {
    class = [=[^(gamescope)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-28]=],
  tag = [=[+games]=],
  match = {
    class = [=[^(steam_app_\d+)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-29]=],
  tag = [=[+gamestore]=],
  match = {
    class = [=[^([Ss]team)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-30]=],
  tag = [=[+gamestore]=],
  match = {
    title = [=[^([Ll]utris)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-31]=],
  tag = [=[+gamestore]=],
  match = {
    class = [=[^(com.heroicgameslauncher.hgl)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-32]=],
  tag = [=[+file-manager]=],
  match = {
    class = [=[^([Tt]hunar|org.gnome.Nautilus|[Pp]cmanfm-qt)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-33]=],
  tag = [=[+file-manager]=],
  match = {
    class = [=[^(app.drey.Warp)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-34]=],
  tag = [=[+wallpaper]=],
  match = {
    class = [=[^([Ww]aytrogen)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-35]=],
  tag = [=[+multimedia]=],
  match = {
    class = [=[^([Aa]udacious)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-36]=],
  tag = [=[+multimedia_video]=],
  match = {
    class = [=[^([Mm]pv|vlc)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-37]=],
  center = true,
  tag = [=[+settings]=],
  match = {
    title = [=[^(ROG Control)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-38]=],
  tag = [=[+settings]=],
  match = {
    class = [=[^(wihotspot(-gui)?)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-39]=],
  tag = [=[+settings]=],
  match = {
    class = [=[^([Bb]aobab|org.gnome.[Bb]aobab)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-40]=],
  tag = [=[+settings]=],
  match = {
    class = [=[^(gnome-disks|wihotspot(-gui)?)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-41]=],
  tag = [=[+settings]=],
  match = {
    title = [=[(Kvantum Manager)]=],
  },
})

hl.window_rule({
  name = [=[windowrule-42]=],
  tag = [=[+settings]=],
  match = {
    class = [=[^(file-roller|org.gnome.FileRoller)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-43]=],
  tag = [=[+settings]=],
  match = {
    class = [=[^(nm-applet|nm-connection-editor|blueman-manager)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-44]=],
  center = true,
  tag = [=[+settings]=],
  match = {
    class = [=[^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-45]=],
  tag = [=[+settings]=],
  match = {
    class = [=[^(qt5ct|qt6ct|[Yy]ad)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-46]=],
  tag = [=[+settings]=],
  match = {
    class = [=[(xdg-desktop-portal-gtk)]=],
  },
})

hl.window_rule({
  name = [=[windowrule-47]=],
  tag = [=[+settings]=],
  match = {
    class = [=[^(org.kde.polkit-kde-authentication-agent-1)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-48]=],
  tag = [=[+settings]=],
  match = {
    class = [=[^([Rr]ofi)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-49]=],
  tag = [=[+viewer]=],
  match = {
    class = [=[^(gnome-system-monitor|org.gnome.SystemMonitor|io.missioncenter.MissionCenter)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-50]=],
  tag = [=[+viewer]=],
  match = {
    class = [=[^(evince)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-51]=],
  tag = [=[+viewer]=],
  match = {
    class = [=[^(eog|org.gnome.Loupe)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-52]=],
  no_blur = true,
  opacity = [=[1.0]=],
  match = {
    tag = [=[multimedia_video*]=],
  },
})

hl.window_rule({
  name = [=[windowrule-53]=],
  center = true,
  float = true,
  size = [=[65% 90%]=],
  match = {
    tag = [=[KooL_Cheat*]=],
  },
})

hl.window_rule({
  name = [=[windowrule-54]=],
  center = true,
  float = true,
  match = {
    class = [=[([Tt]hunar)]=],
    title = [=[negative:(.*[Tt]hunar.*)]=],
  },
})

hl.window_rule({
  name = [=[windowrule-55]=],
  center = true,
  float = true,
  match = {
    tag = [=[KooL-Settings*]=],
  },
})

hl.window_rule({
  name = [=[windowrule-56]=],
  center = true,
  match = {
    title = [=[^(Keybindings)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-57]=],
  center = true,
  size = [=[60% 70%]=],
  match = {
    class = [=[^([Ww]hatsapp-for-linux|ZapZap|com.rtosta.zapzap)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-58]=],
  float = true,
  move = [=[72% 7%]=],
  opacity = [=[0.95 0.75]=],
  pin = [=[0]=],
  match = {
    title = [=[^(Picture-in-Picture)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-59]=],
  idle_inhibit = [=[fullscreen]=],
  match = {
    fullscreen = [=[1]=],
  },
})

hl.window_rule({
  name = [=[windowrule-60]=],
  float = true,
  opacity = [=[0.9 0.7]=],
  size = [=[70% 70%]=],
  match = {
    tag = [=[wallpaper*]=],
  },
})

hl.window_rule({
  name = [=[windowrule-61]=],
  float = true,
  opacity = [=[0.8 0.7]=],
  size = [=[70% 70%]=],
  match = {
    tag = [=[settings*]=],
  },
})

hl.window_rule({
  name = [=[windowrule-62]=],
  float = true,
  opacity = [=[0.82 0.75]=],
  match = {
    tag = [=[viewer*]=],
  },
})

hl.window_rule({
  name = [=[windowrule-63]=],
  float = true,
  match = {
    class = [=[([Zz]oom|onedriver|onedriver-launcher)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-64]=],
  float = true,
  match = {
    class = [=[(org.gnome.Calculator)]=],
    title = [=[(Calculator)]=],
  },
})

hl.window_rule({
  name = [=[windowrule-65]=],
  float = true,
  match = {
    class = [=[^(mpv|com.github.rafostar.Clapper)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-66]=],
  float = true,
  match = {
    class = [=[^([Qq]alculate-gtk)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-67]=],
  center = true,
  float = true,
  match = {
    title = [=[^(Authentication Required)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-68]=],
  float = true,
  match = {
    class = [=[(codium|codium-url-handler|VSCodium)]=],
    title = [=[negative:(.*codium.*|.*VSCodium.*)]=],
  },
})

hl.window_rule({
  name = [=[windowrule-69]=],
  float = true,
  match = {
    class = [=[^(com.heroicgameslauncher.hgl)$]=],
    title = [=[negative:(Heroic Games Launcher)]=],
  },
})

hl.window_rule({
  name = [=[windowrule-70]=],
  float = true,
  match = {
    class = [=[^([Ss]team)$]=],
    title = [=[negative:^([Ss]team)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-71]=],
  center = true,
  float = true,
  size = [=[70% 60%]=],
  match = {
    title = [=[^(Add Folder to Workspace)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-72]=],
  center = true,
  float = true,
  size = [=[70% 60%]=],
  match = {
    title = [=[^(Save As)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-73]=],
  float = true,
  size = [=[70% 60%]=],
  match = {
    initial_title = [=[(Open Files)]=],
  },
})

hl.window_rule({
  name = [=[windowrule-74]=],
  center = true,
  float = true,
  size = [=[16% 12%]=],
  match = {
    title = [=[^(SDDM Background)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-75]=],
  opacity = [=[0.99 0.8]=],
  match = {
    tag = [=[browser*]=],
  },
})

hl.window_rule({
  name = [=[windowrule-76]=],
  opacity = [=[0.9 0.8]=],
  match = {
    tag = [=[projects*]=],
  },
})

hl.window_rule({
  name = [=[windowrule-77]=],
  opacity = [=[0.94 0.86]=],
  match = {
    tag = [=[im*]=],
  },
})

hl.window_rule({
  name = [=[windowrule-78]=],
  opacity = [=[0.94 0.86]=],
  match = {
    tag = [=[multimedia*]=],
  },
})

hl.window_rule({
  name = [=[windowrule-79]=],
  opacity = [=[0.9 0.8]=],
  match = {
    tag = [=[file-manager*]=],
  },
})

hl.window_rule({
  name = [=[windowrule-80]=],
  opacity = [=[0.9 0.7]=],
  match = {
    tag = [=[terminal*]=],
  },
})

hl.window_rule({
  name = [=[windowrule-81]=],
  opacity = [=[0.8 0.7]=],
  match = {
    class = [=[^(gedit|org.gnome.TextEditor|mousepad)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-82]=],
  opacity = [=[0.9 0.8]=],
  match = {
    class = [=[^(deluge)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-83]=],
  opacity = [=[0.9 0.8]=],
  match = {
    class = [=[^(seahorse)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-84]=],
  opacity = [=[0.8]=],
  opacity = [=[0.9]=],
  match = {
    class = [=[^(code)$]=],
  },
})

hl.window_rule({
  name = [=[windowrule-85]=],
  fullscreen = [=[0]=],
  no_blur = true,
  match = {
    tag = [=[games*]=],
  },
})

hl.window_rule({
  name = [=[windowrule-86]=],
  no_initial_focus = true,
  match = {
    class = [=[^(jetbrains-*)]=],
  },
})

hl.window_rule({
  name = [=[windowrule-87]=],
  no_initial_focus = true,
  match = {
    title = [=[^(wind.*)$]=],
  },
})

hl.layer_rule({
  name = [=[layerrule-1]=],
  blur = true,
  ignore_alpha = 0,
  match = {
    namespace = [=[rofi]=],
  },
})

hl.layer_rule({
  name = [=[layerrule-2]=],
  blur = true,
  ignore_alpha = 0,
  match = {
    namespace = [=[notifications]=],
  },
})

hl.layer_rule({
  name = [=[layerrule-3]=],
  blur = true,
  ignore_alpha = 0,
  ignore_alpha = 0.5,
  match = {
    namespace = [=[quickshell:overview]=],
  },
})
