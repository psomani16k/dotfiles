-- Keybinds — port of niri/binds.kdl + niri/dms/binds.kdl
--
-- niri's Mod is Super. `description` is the direct analogue of niri's
-- hotkey-overlay-title and is what the DMS cheatsheet renders
-- (Mod+Shift+Slash -> dms ipc call keybinds toggle hyprland).
--
-- Where binds.kdl and dms/binds.kdl bound the same key, the DMS version wins
-- here: audio/brightness go through DMS so they get the OSD, and
-- Ctrl+Alt+Delete opens the process list rather than quitting.

local mod = "SUPER"

-- === Shell / DankMaterialShell ===

hl.bind(mod .. " + SHIFT + Slash", hl.dsp.exec_cmd("dms ipc call keybinds toggle hyprland"),
  { description = "Show Hotkey Overlay" })

hl.bind(mod .. " + space", hl.dsp.exec_cmd("dms ipc call spotlight toggle"),
  { description = "Application Launcher" })

-- niri had this on Mod+I; Mod+I is now next-workspace, so the bar toggle moved to Mod+B.
hl.bind(mod .. " + B", hl.dsp.exec_cmd("dms ipc call bar toggle index 0"),
  { description = "Toggle Bottom Bar" })

hl.bind(mod .. " + SHIFT + C", hl.dsp.exec_cmd("dms ipc call clipboard toggle"),
  { description = "Clipboard Manager" })

hl.bind(mod .. " + M", hl.dsp.exec_cmd("dms ipc call processlist toggle"),
  { description = "Task Manager" })

hl.bind(mod .. " + comma", hl.dsp.exec_cmd("dms ipc call settings toggle"),
  { description = "Settings" })

hl.bind(mod .. " + N", hl.dsp.exec_cmd("dms ipc call notifications toggle"),
  { description = "Notification Center" })

hl.bind(mod .. " + SHIFT + N", hl.dsp.exec_cmd("dms ipc call notepad toggle"),
  { description = "Notepad" })

hl.bind(mod .. " + Y", hl.dsp.exec_cmd("dms ipc call dankdash wallpaper"),
  { description = "Browse Wallpapers" })

hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd("dms ipc call processlist toggle"),
  { description = "Task Manager" })

-- === Session ===

hl.bind(mod .. " + A", hl.dsp.exec_cmd("dms ipc call lock lock"),
  { description = "Lock Screen" })

hl.bind(mod .. " + ALT + L", hl.dsp.exec_cmd("dms ipc call lock lock"),
  { description = "Lock Screen" })

hl.bind(mod .. " + escape", hl.dsp.exec_cmd("dms ipc call lock lock && sleep 1 && systemctl suspend"),
  { locked = true, description = "Lock and Suspend" })

-- niri bound Mod+Shift+E to `quit`, which shows a confirmation dialog. Hyprland's
-- hl.dsp.exit() has no confirmation, so it is deliberately left unbound.

-- === Applications ===

hl.bind(mod .. " + T", hl.dsp.exec_cmd("kitty"),
  { description = "Open Terminal" })

-- === Media & brightness keys ===

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("dms ipc call audio increment 3"),
  { locked = true, repeating = true, description = "Volume Up" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("dms ipc call audio decrement 3"),
  { locked = true, repeating = true, description = "Volume Down" })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("dms ipc call audio mute"),
  { locked = true, description = "Mute Audio" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("dms ipc call audio micmute"),
  { locked = true, description = "Mute Microphone" })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd([[dms ipc call brightness increment 5 ""]]),
  { locked = true, repeating = true, description = "Brightness Up" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd([[dms ipc call brightness decrement 5 ""]]),
  { locked = true, repeating = true, description = "Brightness Down" })

-- === Screenshots ===
-- niri had these built in; on Hyprland `dms screenshot` covers the same three modes.

hl.bind(mod .. " + P", hl.dsp.exec_cmd("dms screenshot"),
  { description = "Screenshot Region" })
hl.bind(mod .. " + CTRL + P", hl.dsp.exec_cmd("dms screenshot full"),
  { description = "Screenshot Screen" })
hl.bind(mod .. " + ALT + P", hl.dsp.exec_cmd("dms screenshot window"),
  { description = "Screenshot Window" })

-- === Overview ===
-- niri: toggle-overview. DMS ships its own overview for Hyprland.

hl.bind(mod .. " + O", hl.dsp.exec_cmd("dms ipc call hypr toggleOverview"),
  { description = "Toggle Overview" })

-- === Window management ===

hl.bind(mod .. " + Q", hl.dsp.window.close(),
  { description = "Close Window" })

-- niri: focus-column-or-monitor-left / focus-window-or-workspace-down / ...
-- The "or-monitor" half comes from binds.window_direction_monitor_fallback.
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "l" }), { description = "Focus Left" })
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "d" }), { description = "Focus Down" })
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "u" }), { description = "Focus Up" })
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "r" }), { description = "Focus Right" })

-- niri: move-column-left-or-to-monitor-left / move-window-down-or-to-workspace-down / ...
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }), { description = "Move Window Left" })
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }), { description = "Move Window Down" })
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }), { description = "Move Window Up" })
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }), { description = "Move Window Right" })

-- niri: consume-or-expel-window-left/right. group_aware makes this movewindoworgroup:
-- into the adjacent group, out of the current one, otherwise a plain move. Pairs with
-- Mod+W below, which is the tabbed-column analogue.
hl.bind(mod .. " + CTRL + H", hl.dsp.window.move({ direction = "l", group_aware = true }),
  { description = "Consume or Expel Left" })
hl.bind(mod .. " + CTRL + L", hl.dsp.window.move({ direction = "r", group_aware = true }),
  { description = "Consume or Expel Right" })

-- niri: move-window-to-monitor-down/up
hl.bind(mod .. " + SHIFT + CTRL + J", hl.dsp.window.move({ monitor = "d" }),
  { description = "Move Window to Monitor Down" })
hl.bind(mod .. " + SHIFT + CTRL + K", hl.dsp.window.move({ monitor = "u" }),
  { description = "Move Window to Monitor Up" })

-- niri: toggle-column-tabbed-display
hl.bind(mod .. " + W", hl.dsp.group.toggle(),
  { description = "Toggle Tabbed Group" })

-- niri: maximize-column / fullscreen-window
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }),
  { description = "Maximize Window" })
hl.bind(mod .. " + CTRL + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }),
  { description = "Fullscreen Window" })

-- niri: set-window-height -10% / +10%. Hyprland's Lua resize takes pixels, not percent.
hl.bind(mod .. " + SHIFT + D", hl.dsp.window.resize({ x = 0, y = -100, relative = true }),
  { repeating = true, description = "Shrink Window Height" })
hl.bind(mod .. " + SHIFT + F", hl.dsp.window.resize({ x = 0, y = 100, relative = true }),
  { repeating = true, description = "Grow Window Height" })

-- niri: toggle-window-floating / switch-focus-between-floating-and-tiling
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }),
  { description = "Toggle Floating" })
hl.bind(mod .. " + SHIFT + V", hl.dsp.window.cycle_next({ floating = true }),
  { description = "Cycle Floating Windows" })

-- niri: switch-preset-column-width / switch-preset-window-height / reset-window-height.
-- dwindle has no column presets; these are the nearest native equivalents.
hl.bind(mod .. " + R", hl.dsp.layout("togglesplit"),
  { description = "Toggle Split Direction" })
hl.bind(mod .. " + SHIFT + R", hl.dsp.layout("swapsplit"),
  { description = "Swap Split" })
hl.bind(mod .. " + CTRL + R", hl.dsp.layout("movetoroot"),
  { description = "Move to Root" })

-- niri: center-column. Hyprland can only centre floating windows.
-- niri's center-visible-columns (Mod+Ctrl+C) has no tiling equivalent and is dropped.
hl.bind(mod .. " + C", hl.dsp.window.center(),
  { description = "Center Window" })

-- niri: power-off-monitors
hl.bind(mod .. " + SHIFT + P", hl.dsp.dpms({ action = "off" }),
  { description = "Power Off Monitors" })

-- === Workspaces ===
-- New: niri reached workspaces by overflowing Mod+J/K, which tiling has no analogue for.

for i = 1, 9 do
  hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = tostring(i) }),
    { description = "Focus Workspace " .. i })
  hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = tostring(i) }),
    { description = "Move Window to Workspace " .. i })
end

hl.bind(mod .. " + U", hl.dsp.focus({ workspace = "e-1" }), { description = "Previous Workspace" })
hl.bind(mod .. " + I", hl.dsp.focus({ workspace = "e+1" }), { description = "Next Workspace" })

hl.bind(mod .. " + CTRL + U", hl.dsp.window.move({ workspace = "e-1" }),
  { description = "Move Window to Previous Workspace" })
hl.bind(mod .. " + CTRL + I", hl.dsp.window.move({ workspace = "e+1" }),
  { description = "Move Window to Next Workspace" })

-- === Mouse ===

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move Window" })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize Window" })
