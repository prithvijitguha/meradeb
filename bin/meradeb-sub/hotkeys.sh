#!/bin/bash

source $MERADEB_PATH/bin/meradeb-sub/header.sh
echo ''
echo '  ╭────────────────────────────────────────────────────────────╮'
echo '  │                     MERADEB HOTKEYS                        │'
echo '  ╰────────────────────────────────────────────────────────────╯'
echo ''

echo '  ┌─ WINDOW MANAGEMENT ───────────────────────────────────────┐'
echo '  │  Super + W          Close window                          │'
echo '  │  Super + ↑          Maximize window                       │'
echo '  │  Super + h          Minimize window                       │'
echo '  │  Super + Backspace  Resize window                         │'
echo '  │  Shift + F11        Fullscreen                            │'
echo '  └───────────────────────────────────────────────────────────┘'
echo ''

echo '  ┌─ WINDOW NAVIGATION ───────────────────────────────────────┐'
echo '  │  Alt + Shift + h    Shift Focus to Window on left         │'
echo '  │  Alt + Shift + l    Shift Focus to Window on right        │'
echo '  │  Alt + Shift + j    Shitft Focus to Window on down        │'
echo '  │  Alt + Shift + k    Shift Focus to Window on up           │'
echo '  │  Shift + F11        Fullscreen                            │'
echo '  └───────────────────────────────────────────────────────────┘'
echo ''

echo '  ┌─ APPLICATIONS ────────────────────────────────────────────┐'
echo '  │  Super + Space      Wofi launcher                         │'
echo '  │  Ctrl + Print       Flameshot screenshot                  │'
echo '  │  Shift + Alt + 1    New Ghostty window                    │'
echo '  │  Shift + Alt + 2    New Firefox window                    │'
echo '  └───────────────────────────────────────────────────────────┘'
echo ''

echo '  ┌─ WORKSPACES ──────────────────────────────────────────────┐'
echo '  │  Alt + 1            Workspace 1                           │'
echo '  │  Alt + 2            Workspace 2                           │'
echo '  │  Alt + 3            Workspace 3                           │'
echo '  │  Alt + 4            Workspace 4                           │'
echo '  │  Alt + 5            Workspace 5                           │'
echo '  │  Alt + 6            Workspace 6                           │'
echo '  └───────────────────────────────────────────────────────────┘'
echo ''

echo '  ┌─ PINNED APPLICATIONS ─────────────────────────────────────┐'
echo '  │  Super + 1 → 9      Launch / switch to pinned app         │'
echo '  └───────────────────────────────────────────────────────────┘'
echo ''

gum choose "← Go back" --header ""

clear

source $MERADEB_PATH/bin/meradeb-sub/header.sh
source $MERADEB_PATH/bin/meradeb-sub/menu.sh
