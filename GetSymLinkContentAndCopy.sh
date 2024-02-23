#!/bin/bash

# Create a new directory to store copied contents
mkdir -p actual_contents

# Iterate over all files in the current directory
for file in *; do
    # Check if the file is a symlink
    if [ -L "$file" ]; then
        # Get the target of the symlink
        target=$(readlink -f "$file")

        # Get the filename from the target path
        target_filename=$(basename "$target")

        # Copy the contents of the symlink to a new file in the 'copied_contents' directory
        cp -L "$target" "actual_contents/$target_filename"
        
        echo "Copied contents of $file to actual_contents/$target_filename"
    fi
done
