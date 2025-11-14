#!/bin/bash

# Generate animated GIF from all screenshots in the folder
# Requires ImageMagick: brew install imagemagick

SCREENSHOTS_DIR="screenshots"
OUTPUT_GIF="screenshots/theme-showcase.gif"

echo "🎬 Generating theme showcase GIF..."

# Check if ImageMagick is installed
if ! command -v magick &> /dev/null; then
    echo "❌ ImageMagick not found"
    echo "Install with: brew install imagemagick"
    exit 1
fi

# Check if screenshots directory exists
if [ ! -d "$SCREENSHOTS_DIR" ]; then
    echo "❌ Screenshots directory not found"
    exit 1
fi

# Count PNG files
screenshot_count=$(find "$SCREENSHOTS_DIR" -name "*.png" -type f | wc -l | tr -d ' ')

if [ "$screenshot_count" -eq 0 ]; then
    echo "❌ No PNG files found in $SCREENSHOTS_DIR"
    exit 1
fi

echo "📸 Found $screenshot_count screenshots"

# Find the maximum dimensions
echo "🔍 Analyzing screenshot dimensions..."
max_width=0
max_height=0

for img in "$SCREENSHOTS_DIR"/*.png; do
    dimensions=$(identify -format "%w %h" "$img")
    width=$(echo $dimensions | cut -d' ' -f1)
    height=$(echo $dimensions | cut -d' ' -f2)
    
    if [ $width -gt $max_width ]; then
        max_width=$width
    fi
    if [ $height -gt $max_height ]; then
        max_height=$height
    fi
done

echo "📐 Target dimensions: ${max_width}x${max_height}"

# Generate GIF with normalized sizes and 2 second delay between frames
# -resize: scale to fit within max dimensions
# -gravity center: center the image
# -extent: add padding to match exact dimensions
# -background: use dark background matching theme
magick -delay 200 -loop 0 \
    "$SCREENSHOTS_DIR"/*.png \
    -resize "${max_width}x${max_height}" \
    -gravity center \
    -background "#09131b" \
    -extent "${max_width}x${max_height}" \
    "$OUTPUT_GIF"

if [ -f "$OUTPUT_GIF" ]; then
    size=$(du -h "$OUTPUT_GIF" | cut -f1)
    echo "✓ GIF created: $OUTPUT_GIF ($size)"
    echo ""
    echo "Add to README with:"
    echo "![Theme Showcase]($OUTPUT_GIF)"
else
    echo "❌ Failed to create GIF"
    exit 1
fi
