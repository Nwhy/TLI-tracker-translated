#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ASAR_PATH="${REPO_ROOT}/resources/app.asar"
EXTRACT_DIR="${REPO_ROOT}/extracted-app"
BUILD_DIR="${REPO_ROOT}/build/obf-app"

echo "=== YiHuo ETor Linux Build Preparation ==="

# Check for required tools
for cmd in node npm npx; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "Error: $cmd is not installed."
    exit 1
  fi
done

# Ensure @electron/asar is available locally
if ! npx asar --version &>/dev/null 2>&1; then
  echo "Installing @electron/asar as a local dev dependency..."
  npm install --save-dev @electron/asar
fi

# Extract app.asar
if [ ! -f "$ASAR_PATH" ]; then
  echo "Error: app.asar not found at $ASAR_PATH"
  exit 1
fi

echo "Extracting app.asar..."
rm -rf "$EXTRACT_DIR"
npx asar extract "$ASAR_PATH" "$EXTRACT_DIR"

# Copy build files into proper structure
echo "Setting up build directory..."
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"

if [ -d "$EXTRACT_DIR/build/obf-app" ]; then
  cp -r "$EXTRACT_DIR/build/obf-app/"* "$BUILD_DIR/"
elif [ -d "$EXTRACT_DIR" ]; then
  cp -r "$EXTRACT_DIR/"* "$BUILD_DIR/"
fi

# Copy translations if they exist
if [ -d "$EXTRACT_DIR/locales" ]; then
  cp -r "$EXTRACT_DIR/locales" "$REPO_ROOT/build/"
fi

# Install dependencies
echo "Installing npm dependencies..."
cd "$REPO_ROOT"
npm install

# Build for Linux
echo "Building for Linux..."
npm run dist:linux

echo "=== Build complete! Check the dist/ directory for output. ==="
