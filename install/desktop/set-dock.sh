#!/bin/bash

apps=(
  "ghostty"
  "firefox"
  "steam"
  "stremio"
  "youtube"
  "whatsapp"
  "signal"
)

desktop_dirs=(
  "/var/lib/flatpak/exports/share/applications"
  "/usr/share/applications"
  "/usr/local/share/applications"
  "$HOME/.local/share/applications"
  "$HOME/.steam"
)

installed_apps=()

find_desktop() {
  local pattern="$1"

  for dir in "${desktop_dirs[@]}"; do
    [[ -d "$dir" ]] || continue

    match=$(find "$dir" -maxdepth 1 -iname "*${pattern}*.desktop" | sort | head -n1)

    if [[ -n "$match" ]]; then
      basename "$match"
      return
    fi
  done
}

for app in "${apps[@]}"; do
  desktop=$(find_desktop "$app")

  if [[ -n "$desktop" ]]; then
    installed_apps+=("$desktop")
  else
    echo "Skipping $app (not installed)"
  fi
done

favorites_list=$(printf "'%s'," "${installed_apps[@]}")
favorites_list="[${favorites_list%,}]"

echo "Favorites:"
printf '  %s\n' "${installed_apps[@]}"

gsettings set org.gnome.shell favorite-apps "$favorites_list"
gsettings set org.gnome.shell.extensions.dash-to-dock show-show-apps-button false
