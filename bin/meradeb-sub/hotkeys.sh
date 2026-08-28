#!/bin/bash

while true; do
  clear

  printf '\n'
  printf '  ╭────────────────────────────────────────────────────────────╮\n'
  printf '  │                     MERADEB HOTKEYS                        │\n'
  printf '  ╰────────────────────────────────────────────────────────────╯\n'
  printf '\n'

  printf '  ┌─ WINDOW MANAGEMENT ───────────────────────────────────────┐\n'
  printf '  │  Super + W          Close window                          │\n'
  printf '  │  Super + ↑          Maximize window                       │\n'
  printf '  │  Super + Backspace  Resize window                         │\n'
  printf '  │  Shift + F11        Fullscreen                            │\n'
  printf '  └───────────────────────────────────────────────────────────┘\n'
  printf '\n'

  printf '  ┌─ APPLICATIONS ────────────────────────────────────────────┐\n'
  printf '  │  Super + Space      Wofi launcher                         │\n'
  printf '  │  Ctrl + Print       Flameshot screenshot                  │\n'
  printf '  │  Shift + Alt + 1    New Ghostty window                    │\n'
  printf '  │  Shift + Alt + 2    New Firefox window                    │\n'
  printf '  └───────────────────────────────────────────────────────────┘\n'
  printf '\n'

  printf '  ┌─ WORKSPACES ──────────────────────────────────────────────┐\n'
  printf '  │  Alt + 1            Workspace 1                           │\n'
  printf '  │  Alt + 2            Workspace 2                           │\n'
  printf '  │  Alt + 3            Workspace 3                           │\n'
  printf '  │  Alt + 4            Workspace 4                           │\n'
  printf '  │  Alt + 5            Workspace 5                           │\n'
  printf '  │  Alt + 6            Workspace 6                           │\n'
  printf '  └───────────────────────────────────────────────────────────┘\n'
  printf '\n'

  printf '  ┌─ PINNED APPLICATIONS ─────────────────────────────────────┐\n'
  printf '  │  Super + 1 → 9      Launch / switch to pinned app         │\n'
  printf '  └───────────────────────────────────────────────────────────┘\n'
  printf '\n'

  printf '  ┌─ MEDIA ───────────────────────────────────────────────────┐\n'
  printf '  │  Shift + Play       Next track                            │\n'
  printf '  └───────────────────────────────────────────────────────────┘\n'
  printf '\n'

  choice=$(gum choose \
    --header "What would you like to do?" \
    "Stay here" \
    "Go back")

  case "$choice" in
  "Stay here")
    continue
    ;;
  "Go back")
    source "$menu_script"
    break
    ;;
  esac
done
