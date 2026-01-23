#!/bin/bash
set -e
source "$(dirname "${BASH_SOURCE[0]}")/env_check.sh"

# --- VALIDATION ---
validate_env "$1" "resources/xwayland-satellite.service" "target/release/xwayland-satellite" "xwayland-satellite"

# --- INSTALLATION ---
echo "[Info] Installing xwayland-satellite from: $COMPONENT_ABS_DIR"

sudo mkdir -p /usr/local/bin /etc/systemd/user

sudo install -v -m755 "$COMPONENT_BIN_PATH" /usr/local/bin/

sudo cp -v "$COMPONENT_ABS_DIR/resources/xwayland-satellite.service" /etc/systemd/user/

echo "[Done] xwayland-satellite installation complete."