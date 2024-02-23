#!/bin/bash

# Create a new directory to store copied contents
mkdir -p actual_contents

# Iterate over all files and directories in the current directory
for entry in *; do
    # Check if the entry is a symlink
    if [ -L "$entry" ]; then
        # Get the target of the symlink
        target=$(readlink -f "$entry")

        # Check if the target is a directory
        if [ -d "$target" ]; then
            # Copy the entire symlinked directory to 'actual_contents' directory
            cp -R "$target" "actual_contents/"
            
            echo "Copied entire symlinked directory $entry to actual_contents/"
        else
            # Get the filename from the target path
            target_filename=$(basename "$target")

            # Copy the contents of the symlink to a new file in the 'actual_contents' directory
            cp -L "$target" "actual_contents/$target_filename"
            
            echo "Copied contents of $entry to actual_contents/$target_filename"
        fi
    fi
done
