
#!/bin/bash

# Name of the folder to remove
target_folder=$1

# Loop through all directories
for folder in $(find . -type d -name "$target_folder"); do
    echo "Found folder: $folder"

    if [ -d "$folder" ]; then
        echo "Removing folder: $folder"
        rm -rf "$folder"
        echo "✅ Removed: $folder"
    else
        echo "❌ Folder does not exist: $folder"
    fi

done

