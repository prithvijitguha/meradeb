#!/bin/bash
# Create the target directory if it doesn't exist
# Loop through all .rst files recursively and convert them
find docs/source -name "*.rst" | while read -r file; do
  # Determine relative path and new filename
  relpath="${file#docs/source/}"
  outpath="docs/${relpath%.rst}.md"

  # Ensure subdirectories exist in the target folder
  mkdir -p "$(dirname "$outpath")"

  # Convert using Pandoc
  pandoc "$file" -f rst -t markdown -o "$outpath"
  echo "Converted: $file -> $outpath"
done
