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
  # Examples:
  # 0-dot-hands       -> dot-hands
  # 1-twisted-stairs  -> twisted-stairs
  # 12-my-wallpaper   -> my-wallpaper
  name="$(printf '%s' "$name" | sed -E 's/^[0-9]+-//')"

  # Replace hyphens with spaces for display
  display_name="${name//-/ }"

  # Get the theme name directly from the directory structure
  # Example:
  # /path/themes/vantablack/backgrounds/0-dot-hands.webp
  # -> vantablack
  #
  # The theme directory is three levels above the wallpaper:
  # wallpaper.webp -> backgrounds -> vantablack
  WALLPAPER_DIR="$(dirname "$(dirname "$wallpaper")")"
  THEME="$(basename "$WALLPAPER_DIR")"

  # Store the display name and map it to the full path
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

  # Neovim setup
  if [ -d "$HOME/.config/nvim" ] && [ -f "$WALLPAPER_DIR/neovim.lua" ]; then
    cp "$WALLPAPER_DIR/neovim.lua" \
      "$HOME/.config/nvim/lua/plugins/theme.lua"
  fi

  # GNOME
  if [ -f "$WALLPAPER_DIR/gnome.sh" ]; then
    source "$WALLPAPER_DIR/gnome.sh"
  fi

  # Tophat
  gsettings set org.gnome.shell.extensions.tophat meter-fg-color "$(get_color accent)"

  # Ghostty
  # Not all themes are available in Ghostty, so keep the current theme if unavailable
  if ghostty +list-themes 2>/dev/null | grep -Fxq "$THEME"; then
    sed -i \
      "s/^theme = .*/theme = $THEME/" \
      "$HOME/.config/ghostty/config"
  fi

  source "$MERADEB_PATH/bin/meradeb-sub/set-gnome-theme.sh"
  source "$MERADEB_PATH/bin/meradeb-sub/menu.sh"

elif [ "$WALLPAPER_VALUE" == "<< Back" ]; then
  source "$MERADEB_PATH/bin/meradeb-sub/menu.sh"
fi
