#!/bin/bash
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Проверяем существование директории
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Папка $WALLPAPER_DIR не найдена!"
    exit 1
fi

# Выбираем случайное изображение (поддерживаются jpg, png, gif, webp и др.[citation:1])
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" \) | shuf -n 1)

# Проверяем, найдено ли изображение
if [ -n "$WALLPAPER" ]; then
    # Меняем обои. Используйте `-o` для указания монитора, например `-o DP-1`
    swww img "$WALLPAPER" \
    --transition-type any \
    --transition-step 255 \
    --transition-duration 0.7 \
    --transition-fps 60
else
    echo "В папке $WALLPAPER_DIR не найдено подходящих изображений!"
fi