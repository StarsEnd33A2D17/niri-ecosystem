#!/bin/bash
set -e

PROJECT_ROOT="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

usage() {
    echo "Usage: $0 [niri|xwayland|all]"
    exit 1
}

[[ $# -lt 1 ]] && usage

case "$1" in
    niri)
        "$PROJECT_ROOT/install-scripts/niri-copy.sh" "$PROJECT_ROOT/niri"
        ;;
    xwayland|satellite)
        "$PROJECT_ROOT/install-scripts/xwayland-satellite-copy.sh" "$PROJECT_ROOT/xwayland-satellite"
        ;;
    all)
        "$PROJECT_ROOT/install-scripts/niri-copy.sh" "$PROJECT_ROOT/niri"
        "$PROJECT_ROOT/install-scripts/xwayland-satellite-copy.sh" "$PROJECT_ROOT/xwayland-satellite"
        ;;
    *)
        usage
        ;;
esac
