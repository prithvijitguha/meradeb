#!/bin/bash

# Create an array where we store wallpaper display names
WALLPAPERS=()

# Map wallpaper display names to their full paths
declare -A WALLPAPERS_MAP

# Find all .webp, .jpeg, and .jpg files in theme subdirectories
while IFS= read -r -d '' wallpaper; do
  # Get the filename without its extension
  filename="$(basename "$wallpaper")"
  name="${filename%.*}"

  # Remove leading numbers followed by a hyphen
  name="$(printf '%s' "$name" | sed -E 's/^[0-9]+-//')"

  # Replace hyphens with spaces for display
  display_name="${name//-/ }"

  # Get the theme directory
  WALLPAPER_DIR="$(dirname "$(dirname "$wallpaper")")"
  THEME="$(basename "$WALLPAPER_DIR")"

  # Store the display name and full path
  WALLPAPERS+=("$display_name")
  WALLPAPERS_MAP["$display_name"]="$wallpaper"

done < <(
  find "$MERADEB_PATH/themes" -type f \
    \( -iname '*.webp' -o -iname '*.jpeg' -o -iname '*.jpg' \) \
    -print0
)

# Let the user choose a wallpaper
WALLPAPER_VALUE=$(gum choose "${WALLPAPERS[@]}" "<< Back" \
  --header "Choose your wallpaper" \
  --height 12)

if [ -n "$WALLPAPER_VALUE" ] && [ "$WALLPAPER_VALUE" != "<< Back" ]; then
  # Retrieve the full wallpaper path from the map
  WALLPAPER_PATH="${WALLPAPERS_MAP[$WALLPAPER_VALUE]}"

  # Get the theme directory from the wallpaper path
  # Example:
  # /path/themes/vantablack/backgrounds/0-dot-hands.webp
  # -> /path/themes/vantablack
  WALLPAPER_DIR="$(dirname "$(dirname "$WALLPAPER_PATH")")"

  # Get the theme name from the directory
  THEME="$(basename "$WALLPAPER_DIR")"

  COLORS="$WALLPAPER_DIR/colors.toml"

  get_color() {
    sed -n "s/^$1 = \"\\(#[0-9a-fA-F]*\\)\"$/\1/p" "$COLORS"
  }

  set_background() {
    local background="$1"
    local name
    local dest

    name=$(basename "$background")
    dest="$BACKGROUND_DEST_DIR/$name"

    [ -f "$dest" ] || cp "$background" "$dest"

    gsettings set org.gnome.desktop.background picture-uri "$dest"
    gsettings set org.gnome.desktop.background picture-uri-dark "$dest"
    gsettings set org.gnome.desktop.background picture-options 'zoom'
  }
  # GNOME
  # This also sets the MERADEB_THEME_COLOR variable
  if [ -f "$WALLPAPER_DIR/gnome.sh" ]; then
    source "$WALLPAPER_DIR/gnome.sh"
  fi
  set_background "$WALLPAPER_PATH"

  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
  gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$MERADEB_THEME_COLOR-dark"
  gsettings set org.gnome.desktop.interface icon-theme "Yaru-$MERADEB_THEME_COLOR"
  gsettings set org.gnome.desktop.interface accent-color "$MERADEB_THEME_COLOR"

  # Tophat
  gsettings set org.gnome.shell.extensions.tophat meter-fg-color "$(get_color accent)"

  source "$MERADEB_PATH/bin/meradeb-sub/menu.sh"

elif [ "$WALLPAPER_VALUE" == "<< Back" ]; then
  source "$MERADEB_PATH/bin/meradeb-sub/menu.sh"
fi
