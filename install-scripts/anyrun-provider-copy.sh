#!/bin/bash
set -e
source "$(dirname "${BASH_SOURCE[0]}")/env_check.sh"

# --- VALIDATION ---
validate_env "$1" "Cargo.toml" "target/release/anyrun-provider" "anyrun-provider"

# --- INSTALLATION ---
echo "[Info] Installing anyrun-provider from: $COMPONENT_ABS_DIR"

sudo mkdir -p /usr/local/bin
sudo install -v -m755 "$COMPONENT_BIN_PATH" /usr/local/bin/

echo "[Done] anyrun-provider installation complete."