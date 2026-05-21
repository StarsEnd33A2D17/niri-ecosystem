#!/bin/bash
set -e
source "$(dirname "${BASH_SOURCE[0]}")/env_check.sh"

# --- VALIDATION ---
validate_env "$1" "Cargo.toml" "target/release/awww" "awww"

[[ ! -f "$COMPONENT_ABS_DIR/target/release/awww-daemon" ]] && {
    echo "[Error] Binary not found: $COMPONENT_ABS_DIR/target/release/awww-daemon"
    exit 1
}

# --- INSTALLATION ---
echo "[Info] Installing awww from: $COMPONENT_ABS_DIR"

sudo mkdir -p /usr/local/bin
sudo install -v -m755 "$COMPONENT_ABS_DIR/target/release/awww" /usr/local/bin/
sudo install -v -m755 "$COMPONENT_ABS_DIR/target/release/awww-daemon" /usr/local/bin/

sudo mkdir -p /usr/local/lib/systemd/user
sudo cp -v "$COMPONENT_ABS_DIR/contrib/systemd/awww-daemon.service" /usr/local/lib/systemd/user/

echo "[Done] awww installation complete."