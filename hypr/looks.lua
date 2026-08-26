-- Appearance and window rules — port of niri/looks.kdl and the window-rule /
-- shadow blocks of niri/config.kdl.

-----------------
---- OPACITY ----
-----------------

-- niri/config.kdl: window-rule { match is-active=false; opacity 0.9 }
-- niri/config.kdl: the `shadow` block is commented out, so shadows are off.
hl.config({
  decoration = {
    active_opacity   = 1.0,
    inactive_opacity = 0.9,

    shadow           = {
      enabled = false,
    },
  },
})

--------------
---- BLUR ----
--------------

-- niri opts *into* blur per window (background-effect { blur true }); Hyprland
-- blurs globally and opts *out* per window with no_blur. To keep niri's semantics,
-- enable blur, opt everything out, then opt the three apps from looks.kdl back in.
-- Rules are applied in order, so the later no_blur = false wins.
--
-- xray = false matches the `xray false` set on zen in niri/looks.kdl.
hl.config({
  decoration = {
    blur = {
      enabled = true,
      size    = 8,
      passes  = 2,
      xray    = false,
    },
  },
})

hl.window_rule({ name = "no-blur-default", match = { class = ".*" }, no_blur = true })
hl.window_rule({ name = "blur-kitty", match = { class = "^kitty$" }, no_blur = false })
hl.window_rule({ name = "blur-alacritty", match = { class = "^Alacritty$" }, no_blur = false })
hl.window_rule({ name = "blur-zen", match = { class = "^zen$" }, no_blur = false })

-- niri/looks.kdl blurred the `launcher` layer (fuzzel). That is now DMS's spotlight,
-- so the DMS layer namespaces get the blur instead.
hl.layer_rule({ name = "blur-dms", match = { namespace = "^dms:.*" }, blur = true, ignore_alpha = 0.2 })
hl.layer_rule({ name = "blur-quickshell", match = { namespace = "^quickshell$" }, blur = true, ignore_alpha = 0.2 })

---------------------
---- WINDOW RULES ---
---------------------

-- niri/config.kdl: open the Firefox picture-in-picture player floating.
-- Matches host Firefox ("firefox") and Flatpak Firefox ("org.mozilla.firefox").
hl.window_rule({
  name  = "firefox-pip-float",
  match = { class = "firefox$", title = "^Picture-in-Picture$" },
  float = true,
})
