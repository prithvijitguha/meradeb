#!/bin/bash

THEMES=()

for theme in "$MERADEB_PATH"/themes/*/colors.toml; do
  [ -f "$theme" ] || continue
  THEMES+=("$(basename "$(dirname "$theme")")")
done

THEME=$(gum choose "${THEMES[@]}" "<< Back" --header "Choose your theme" --height 12 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

if [ -n "$THEME" ] && [ "$THEME" != "<<-back" ]; then

  # Each directory in themes contains a colors.toml
  # We use that colors.toml to generate the tophat and btop files
  THEME_DIR="$MERADEB_PATH/themes/$THEME"
  COLORS="$THEME_DIR/colors.toml"

  # I don't know regex, its the one use of AI that seems to be very helpful
  get_color() {
    sed -n "s/^$1 = \"\\(#[0-9a-fA-F]*\\)\"$/\1/p" "$COLORS"
  }

  # Neovim setup
  if [ -d "$HOME/.config/nvim" ] && [ -f "$THEME_DIR/neovim.lua" ]; then
    cp "$THEME_DIR/neovim.lua" \
      "$HOME/.config/nvim/lua/plugins/theme.lua"
  fi

  # GNOME
  if [ -f "$THEME_DIR/gnome.sh" ]; then
    source "$THEME_DIR/gnome.sh"
  fi

  # Tophat
  gsettings set org.gnome.shell.extensions.tophat meter-fg-color "$(get_color magenta)"

  # Ghostty
  # Not all themes are available in ghostty, so first we check if the theme is available
  # if not we keep it as is
  if ghostty +list-themes 2>/dev/null | grep -Fxq "$THEME"; then
    sed -i \
      "s/^theme = .*/theme = $THEME/" \
      "$HOME/.config/ghostty/config"
  fi

  source "$MERADEB_PATH/bin/meradeb-sub/set-gnome-theme.sh"
  source "$MERADEB_PATH/bin/meradeb-sub/menu.sh"

elif [ "$THEME" == "<<-back" ]; then
  source "$MERADEB_PATH/bin/meradeb-sub/menu.sh"
fi
