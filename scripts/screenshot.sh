#!/bin/bash

# Define the save location
SAVE_DIR="$HOME/Pictures"

# Check dependencies
if ! command -v grim >/dev/null || ! command -v slurp >/dev/null; then
  echo "Error: 'grim' and 'slurp' must be installed." >&2
  exit 1
fi

# Create directory if missing
mkdir -p "$SAVE_DIR"

# Generate filename
FILENAME="screenshot_$(date '+%Y-%m-%d_%H-%M-%S').png"

# Take screenshot
if ! grim -g "$(slurp)" "$SAVE_DIR/$FILENAME"; then
  if command -v notify-send >/dev/null; then
    notify-send "Screenshot Cancelled" "No region selected."
  fi
  exit 1
fi

# Notify user (optional)
if command -v notify-send >/dev/null; then
  notify-send "Screenshot Saved" "$SAVE_DIR/$FILENAME"
fi
