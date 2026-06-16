#!/usr/bin/env bash
# rename_photos.sh <folder-name>
#
# Renames all JPG/JPEG files in ~/Pictures/Portfolio/<folder> to the
# sequential format the gallery expects: 01.jpg, 02.jpg, 03.jpg ...
#
# Files are sorted alphabetically before renaming, which preserves
# chronological order for camera files (DSC00001, DSC00002, etc.).
# A two-pass rename avoids conflicts when some files are already
# numbered (e.g. adding new photos to an existing gallery).
#
# Usage:
#   chmod +x rename_photos.sh          # once, to make executable
#   ./rename_photos.sh rodeo-2025      # rename all photos in that folder

set -e

FOLDER="${1:?Usage: rename_photos.sh <folder-name>}"
DIR="$HOME/Pictures/Portfolio/$FOLDER"

if [ ! -d "$DIR" ]; then
  echo "Error: folder not found: $DIR"
  exit 1
fi

cd "$DIR"

# Collect all JPG/JPEG files (case-insensitive), sorted alphabetically
files=()
while IFS= read -r -d '' f; do
  files+=("$f")
done < <(find . -maxdepth 1 \( -iname "*.jpg" -o -iname "*.jpeg" \) -print0 | sort -z)

total=${#files[@]}

if [ "$total" -eq 0 ]; then
  echo "No JPG/JPEG files found in $DIR"
  exit 1
fi

echo "Found $total photos in $FOLDER — renaming..."

# Pass 1: rename to temp names to avoid conflicts
for i in "${!files[@]}"; do
  mv "${files[$i]}" "__tmp_$(printf '%05d' "$i").jpg"
done

# Pass 2: rename to final sequential names
for i in "${!files[@]}"; do
  n=$((i + 1))
  final="$(printf '%02d' "$n").jpg"
  mv "__tmp_$(printf '%05d' "$i").jpg" "$final"
  echo "  → $final"
done

echo ""
echo "✅  $total photos renamed in ~/Pictures/Portfolio/$FOLDER"
echo "    Ready to add to the website."
