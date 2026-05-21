#!/bin/bash
set -e

PROJECT_ROOT="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

usage() {
    echo "Usage: $0 [niri|xwayland|anyrun|anyrun-provider|awww|all]"
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
    anyrun)
        "$PROJECT_ROOT/install-scripts/anyrun-copy.sh" "$PROJECT_ROOT/anyrun"
        ;;
    anyrun-provider|provider)
        "$PROJECT_ROOT/install-scripts/anyrun-provider-copy.sh" "$PROJECT_ROOT/anyrun-provider"
        ;;
    awww)
        "$PROJECT_ROOT/install-scripts/awww-copy.sh" "$PROJECT_ROOT/awww"
        ;;
    all)
        "$PROJECT_ROOT/install-scripts/niri-copy.sh" "$PROJECT_ROOT/niri"
        "$PROJECT_ROOT/install-scripts/xwayland-satellite-copy.sh" "$PROJECT_ROOT/xwayland-satellite"
        "$PROJECT_ROOT/install-scripts/anyrun-copy.sh" "$PROJECT_ROOT/anyrun"
        "$PROJECT_ROOT/install-scripts/anyrun-provider-copy.sh" "$PROJECT_ROOT/anyrun-provider"
        "$PROJECT_ROOT/install-scripts/awww-copy.sh" "$PROJECT_ROOT/awww"
        ;;
    *)
        usage
        ;;
esac
