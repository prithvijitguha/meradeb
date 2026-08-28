#!/bin/bash

source $MERADEB_PATH/bin/meradeb-sub/header.sh
echo '\n'
echo '  ╭────────────────────────────────────────────────────────────╮\n'
echo '  │                     OMADEBIAN HOTKEYS                      │\n'
echo '  ╰────────────────────────────────────────────────────────────╯\n'
echo '\n'

echo '  ┌─ WINDOW MANAGEMENT ───────────────────────────────────────┐\n'
echo '  │  Super + W          Close window                          │\n'
echo '  │  Super + ↑          Maximize window                       │\n'
echo '  │  Super + Backspace  Resize window                         │\n'
echo '  │  Shift + F11        Fullscreen                            │\n'
echo '  └───────────────────────────────────────────────────────────┘\n'
echo '\n'

echo '  ┌─ APPLICATIONS ────────────────────────────────────────────┐\n'
echo '  │  Super + Space      Wofi launcher                         │\n'
echo '  │  Ctrl + Print       Flameshot screenshot                  │\n'
echo '  │  Shift + Alt + 1    New Ghostty window                    │\n'
echo '  │  Shift + Alt + 2    New Firefox window                    │\n'
echo '  └───────────────────────────────────────────────────────────┘\n'
echo '\n'

echo '  ┌─ WORKSPACES ──────────────────────────────────────────────┐\n'
echo '  │  Alt + 1            Workspace 1                           │\n'
echo '  │  Alt + 2            Workspace 2                           │\n'
echo '  │  Alt + 3            Workspace 3                           │\n'
echo '  │  Alt + 4            Workspace 4                           │\n'
echo '  │  Alt + 5            Workspace 5                           │\n'
echo '  │  Alt + 6            Workspace 6                           │\n'
echo '  └───────────────────────────────────────────────────────────┘\n'
echo '\n'

echo '  ┌─ PINNED APPLICATIONS ─────────────────────────────────────┐\n'
echo '  │  Super + 1 → 9      Launch / switch to pinned app         │\n'
echo '  └───────────────────────────────────────────────────────────┘\n'
echo '\n'

echo '  ┌─ MEDIA ───────────────────────────────────────────────────┐\n'
echo '  │  Shift + Play       Next track                            │\n'
echo '  └───────────────────────────────────────────────────────────┘\n'
echo '\n'

gum choose "← Go back" --header "" >/dev/null

source $MERADEB_PATH/bin/meradeb-sub/menu.sh
