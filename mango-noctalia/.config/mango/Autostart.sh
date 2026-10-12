#!/bin/bash
# Update DBus/Systemd env first
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots XDG_SESSION_TYPE=wayland XDG_MENU_PREFIX &
systemctl --user restart xdg-desktop-portal &
kbuildsycoca6 --noincremental &

# Init Noctalia V5
noctalia &

# Wait for noctalia shell init
sleep 5


# Init my daily apps
brightnessctl --device=':*scrolllock*' set 1 &
/usr/lib/polkit-kde-authentication-agent-1 &
protonvpn-app --start-minimized &
kdeconnectd --start-minimized &
kdeconnect-indicator --tray &
fdm --hidden &
arch-update --tray &

