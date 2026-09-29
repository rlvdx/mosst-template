#!/usr/bin/env bash
# Usage: package.sh <version>. Run through `just package`, which sets APP and scans the bundle first.
# Prints the archive's path, which the Release workflow reads.
set -euo pipefail

archive="src-tauri/target/dist/mosst-template-$1-macos-arm64.zip"
mkdir -p "$(dirname "$archive")"
rm -f "$archive"
ditto -c -k --keepParent "$APP" "$archive"
echo "$archive"
