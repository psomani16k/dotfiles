#!/bin/bash
set -euo pipefail

# Session wiring for Hyprland + DankMaterialShell.
# Analogue of niri/setup.sh, which does `systemctl --user add-wants niri.service dms`.
#
# dms.service is WantedBy=graphical-session.target with Requisite=graphical-session.target,
# so something has to bring graphical-session.target up. niri.service does that itself;
# Hyprland does not ship a session target on Fedora, so we install one. hyprland.lua's
# `hyprland.start` hook starts it, which activates graphical-session.target, which pulls
# in dms.service.
#
# Log in via the plain "Hyprland" session, NOT "Hyprland (uwsm)" -- uwsm manages
# graphical-session.target itself and would collide with the startup hook.

echo -e "\033[1;32m|=== INSTALLING AND SETTING UP HYPRLAND FROM PACKAGE ===|\033[0m"
sudo dnf install hyprland xdg-desktop-portal-hyprland -y

UNIT_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/systemd/user"
mkdir -p "$UNIT_DIR"

cat > "$UNIT_DIR/hyprland-session.target" <<'EOF'
[Unit]
Description=Hyprland Session Target
BindsTo=graphical-session.target
Before=graphical-session.target
Wants=graphical-session-pre.target
After=graphical-session-pre.target
EOF

systemctl --user daemon-reload
systemctl --user add-wants hyprland-session.target dms.service

echo ""
echo "Installed hyprland-session.target and wired dms.service to it."
echo "Log out and pick the 'Hyprland' session (not the uwsm one)."
