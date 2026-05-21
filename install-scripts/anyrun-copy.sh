#!/bin/bash
set -e
source "$(dirname "${BASH_SOURCE[0]}")/env_check.sh"

# --- VALIDATION ---
validate_env "$1" "Cargo.toml" "target/release/anyrun" "anyrun"

# --- INSTALLATION ---
echo "[Info] Installing anyrun from: $COMPONENT_ABS_DIR"

# Install binary
sudo mkdir -p /usr/local/bin
sudo install -v -m755 "$COMPONENT_BIN_PATH" /usr/local/bin/

# Install plugins to user config
mkdir -p "$HOME/.config/anyrun/plugins"
for plugin in "$COMPONENT_ABS_DIR/target/release/"lib*.so; do
    [[ -f "$plugin" ]] && cp -v "$plugin" "$HOME/.config/anyrun/plugins/"
done

# Install default config if not exists
if [[ ! -f "$HOME/.config/anyrun/config.ron" ]]; then
    cp -v "$COMPONENT_ABS_DIR/examples/config.ron" "$HOME/.config/anyrun/config.ron"
fi

# Install default style if not exists
if [[ ! -f "$HOME/.config/anyrun/style.css" ]]; then
    cp -v "$COMPONENT_ABS_DIR/anyrun/res/style.css" "$HOME/.config/anyrun/style.css"
fi

echo "[Done] anyrun installation complete."