#!/bin/bash

# Specify the directory where the files are located
INPUT_DIR="./imgs/info2"

# Check if any files match the pattern
files=$(ls "$INPUT_DIR"/frame_*.jpg 2>/dev/null)

if [ -z "$files" ]; then
    echo "No files found to rename."
    exit 1
fi

# Counter for renaming
count=1

# Loop through all jpg files in the directory (starting from frame_0001.jpg)
for file in "$INPUT_DIR"/frame_*.jpg; do
    # Format the new filename as i (X).jpg where X is the counter
    new_name=$(printf "$INPUT_DIR/i (%d).jpg" $count)

    # Rename the file
    mv "$file" "$new_name"

    # Increment the counter
    ((count++))

    # Optional: limit the renaming to the first 367 files
    if [ $count -gt 367 ]; then
        break
    fi
done

echo "Renaming complete!"

