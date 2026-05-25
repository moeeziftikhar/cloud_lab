#!/bin/bash
# File Organizer Script
# Automatically sorts files into folders by type

echo "================================"
echo "      File Organizer"
echo "================================"

# Create organized folders
mkdir -p ~/cloud_lab/text_files
mkdir -p ~/cloud_lab/scripts

echo "Folders created..."

# Move txt files
for file in ~/cloud_lab/*.txt
do
    if [ -f "$file" ]
    then
        mv "$file" ~/cloud_lab/text_files/
        echo "Moved: $file → text_files folder"
    fi
done

# Move sh files
for file in ~/cloud_lab/*.sh
do
    if [ -f "$file" ]
    then
        mv "$file" ~/cloud_lab/scripts/
        echo "Moved: $file → scripts folder"
    fi
done

echo ""
echo "Organization complete!"
echo "================================"
