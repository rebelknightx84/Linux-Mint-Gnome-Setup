#!/bin/bash
set -e

echo "==> Installing GNOME Extensions..."

EXTENSIONS=(
  615        # AppIndicator/KStatusNotifierItem Support
  3628       # ArcMenu
  3193       # Blur My Shell
  307        # Dash to Dock
  5461       # Top Bar Organizer
  19         # User Themes
)

for ext_id in "${EXTENSIONS[@]}"; do
  echo "-- Installing extension ID $ext_id..."
  gnome-shell-extension-installer "$ext_id" --yes --enable
done

echo "✅ GNOME extensions installed and enabled."
