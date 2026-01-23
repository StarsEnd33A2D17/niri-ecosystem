#!/bin/bash

validate_env() {
    local input_dir="$1"
    local marker="$2"
    local bin_rel="$3"
    local name="$4"

    [[ -z "$input_dir" ]] && { echo "[Error] No directory provided for $name."; exit 1; }

    local abs_dir
    abs_dir="$(cd "$input_dir" &>/dev/null && pwd)" || {
        echo "[Error] Directory does not exist: $input_dir"
        exit 1
    }

    [[ ! -f "$abs_dir/$marker" ]] && {
        echo "[Error] Structure mismatch: $name at $abs_dir (Missing: $marker)"
        exit 1
    }

    local bin_path="$abs_dir/$bin_rel"
    [[ ! -f "$bin_path" ]] && {
        echo "[Error] Binary not found: $bin_path"
        exit 1
    }

    COMPONENT_ABS_DIR="$abs_dir"
    COMPONENT_BIN_PATH="$bin_path"
}