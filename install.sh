#!/bin/bash
set -e

LOCAL_SOURCE="fastfetch"
TARGET_DIR="$HOME/.config/fastfetch"

echo "Starting system check..."

if ! command -v fastfetch &> /dev/null; then
    echo "Error: 'fastfetch' is not installed"
    read -p "Do you want to auto-install it? (s/n): " responder

    if [[ "$responder" =~ ^[Ss]$ ]]; then
        echo "Buscando gestor de paquetes para instalar fastfetch..."
        if command -v pacman &> /dev/null; then
            sudo pacman -S --noconfirm fastfetch
        elif command -v apt &> /dev/null; then
            sudo apt update && sudo apt install -y fastfetch
        elif command -v dnf &> /dev/null; then
            sudo dnf install -y fastfetch
        elif command -v brew &> /dev/null; then
            brew install fastfetch
        else
            echo "System manager was not found"
            echo "Install 'fastfetch' manually from the official way"
            exit 1
        fi
    else
        echo "Canceled, for this script you need fastfetch"
        exit 1
    fi
fi

if [ ! -d "$LOCAL_SOURCE" ] || [ -z "$(ls -A "$LOCAL_SOURCE" 2>/dev/null)" ]; then
    echo "Error: The directory '$LOCAL_SOURCE' was not found or it is empty"
    echo "Nothing of ur system have been modify"
    exit 1
fi

if [ -d "$TARGET_DIR" ] && [ "$(ls -A "$TARGET_DIR" 2>/dev/null | grep -v '^backups$')" ]; then
    echo "A configuration/theme have been detected, creating backup"

    BACKUPS_DIR="$TARGET_DIR/backups"
    TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
    CURRENT_BACKUP_DIR="$BACKUPS_DIR/backup_$TIMESTAMP"

    mkdir -p "$CURRENT_BACKUP_DIR"

    for item in "$TARGET_DIR"/* "$TARGET_DIR"/.*; do
        basename_item=$(basename "$item")
        if [ "$basename_item" != "backups" ] && [ "$basename_item" != "." ] && [ "$basename_item" != ".." ]; then
            if [ -e "$item" ]; then
                mv "$item" "$CURRENT_BACKUP_DIR/"
            fi
        fi
    done
fi

mkdir -p "$TARGET_DIR"
cp -r "$LOCAL_SOURCE"/. "$TARGET_DIR/"
echo "Files copied"

echo "finished"
