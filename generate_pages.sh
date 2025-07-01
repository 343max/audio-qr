#!/bin/bash

# Create pages directory
mkdir -p pages

# Process each audio file in the audio directory
for m4a_file in audio/*.m4a; do
    # Get basename without extension (e.g., "1" from "1.m4a")
    basename=$(basename "$m4a_file" .m4a)
    
    # Create directory for this page
    page_dir="pages/$basename"
    mkdir -p "$page_dir"
    
    # Convert M4A to MP3 in the page directory
    echo "Converting $m4a_file to $page_dir/audio.mp3"
    ffmpeg -i "$m4a_file" -codec:a libmp3lame -b:a 128k "$page_dir/audio.mp3" -y
    
    # Copy transcript as markdown file
    if [ -f "audio/$basename.txt" ]; then
        echo "Copying transcript to $page_dir/transcript.md"
        cp "audio/$basename.txt" "$page_dir/transcript.md"
    else
        echo "Warning: No transcript found for $basename"
    fi
    
    echo "Processed $basename"
done

echo "All audio files processed successfully!"