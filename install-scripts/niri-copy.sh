#!/bin/bash
set -e
source "$(dirname "${BASH_SOURCE[0]}")/env_check.sh"

# --- VALIDATION ---
validate_env "$1" "resources/niri.desktop" "target/release/niri" "niri"

# --- INSTALLATION ---
echo "[Info] Installing niri from: $COMPONENT_ABS_DIR"

sudo mkdir -p /usr/local/bin \
             /usr/local/share/wayland-sessions \
             /usr/local/share/xdg-desktop-portal \
             /etc/systemd/user

sudo install -v -m755 "$COMPONENT_BIN_PATH" /usr/local/bin/

sudo cp -v "$COMPONENT_ABS_DIR/resources/niri-session" /usr/local/bin/
sudo cp -v "$COMPONENT_ABS_DIR/resources/niri.desktop" /usr/local/share/wayland-sessions/
sudo cp -v "$COMPONENT_ABS_DIR/resources/niri-portals.conf" /usr/local/share/xdg-desktop-portal/
sudo cp -v "$COMPONENT_ABS_DIR/resources/niri.service" /etc/systemd/user/
sudo cp -v "$COMPONENT_ABS_DIR/resources/niri-shutdown.target" /etc/systemd/user/

echo "[Done] niri installation complete."