#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES_FILE="$SCRIPT_DIR/packages.txt"

sudo apt update
sudo apt install -y $(grep -vE '^\s*#|^\s*$' "$PACKAGES_FILE")
