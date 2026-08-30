#!/bin/bash

source $MERADEB_PATH/bin/meradeb-sub/header.sh
echo ''
echo '  ╭────────────────────────────────────────────────────────────╮\n'
echo '  │                     MERADEB HOTKEYS                      │\n'
echo '  ╰────────────────────────────────────────────────────────────╯\n'
echo ''

echo '  ┌─ WINDOW MANAGEMENT ───────────────────────────────────────┐\n'
echo '  │  Super + W          Close window                          │\n'
echo '  │  Super + ↑          Maximize window                       │\n'
echo '  │  Super + h          Minimize window                       │\n'
echo '  │  Super + Backspace  Resize window                         │\n'
echo '  │  Shift + F11        Fullscreen                            │\n'
echo '  └───────────────────────────────────────────────────────────┘\n'
echo ''

echo '  ┌─ APPLICATIONS ────────────────────────────────────────────┐\n'
echo '  │  Super + Space      Wofi launcher                         │\n'
echo '  │  Ctrl + Print       Flameshot screenshot                  │\n'
echo '  │  Shift + Alt + 1    New Ghostty window                    │\n'
echo '  │  Shift + Alt + 2    New Firefox window                    │\n'
echo '  └───────────────────────────────────────────────────────────┘\n'
echo ''

echo '  ┌─ WORKSPACES ──────────────────────────────────────────────┐\n'
echo '  │  Alt + 1            Workspace 1                           │\n'
echo '  │  Alt + 2            Workspace 2                           │\n'
echo '  │  Alt + 3            Workspace 3                           │\n'
echo '  │  Alt + 4            Workspace 4                           │\n'
echo '  │  Alt + 5            Workspace 5                           │\n'
echo '  │  Alt + 6            Workspace 6                           │\n'
echo '  └───────────────────────────────────────────────────────────┘\n'
echo ''

echo '  ┌─ PINNED APPLICATIONS ─────────────────────────────────────┐\n'
echo '  │  Super + 1 → 9      Launch / switch to pinned app         │\n'
echo '  └───────────────────────────────────────────────────────────┘\n'
echo ''

echo '  ┌─ MEDIA ───────────────────────────────────────────────────┐\n'
echo '  │  Shift + Play       Next track                            │\n'
echo '  └───────────────────────────────────────────────────────────┘\n'
echo ''

gum choose "← Go back" --header ""

source $MERADEB_PATH/bin/meradeb-sub/menu.sh
