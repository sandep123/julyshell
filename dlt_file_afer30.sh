#!/bin/bash

# Assign command-line arguments
target_dir="$1"
days="$2"

# Validate inputs
if [ $# -ne 2 ] || [ ! -d "$target_dir" ]; then
    echo "❌ Please provide exactly 2 arguments: <directory> <days>"
    echo "ℹ️  Usage: $0 /path/to/dir 30"
    exit 1
fi

echo "🧹 Cleaning files older than $days days in: $target_dir"
echo
echo "🔍 Files to be deleted:"
find "$target_dir" -type f -mtime +"$days" -print

# Ask for confirmation
read -p "❗ Do you want to delete these files? (y/n): " confirm

if [[ "$confirm" != "y" ]]; then
    echo "❌ Aborted by user."
    exit 0
fi

# Delete the files
find "$target_dir" -type f -mtime +"$days" -exec rm -f {} \;

echo "✅ Cleanup completed."

