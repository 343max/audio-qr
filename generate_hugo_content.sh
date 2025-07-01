#!/bin/bash

# Generate Hugo content files for each page
for page_dir in pages/*/; do
    if [ -d "$page_dir" ]; then
        # Get the page number from directory name
        page_num=$(basename "$page_dir")
        
        # Create Hugo content directory
        hugo_content_dir="content/$page_num"
        mkdir -p "$hugo_content_dir"
        
        # Copy the audio file to the Hugo content directory
        if [ -f "$page_dir/audio.mp3" ]; then
            cp "$page_dir/audio.mp3" "$hugo_content_dir/"
        fi
        
        # Create Hugo markdown file with frontmatter and transcript content
        if [ -f "$page_dir/transcript.md" ]; then
            echo "Creating Hugo content for page $page_num"
            
            # Create the index.md file with frontmatter and transcript content
            cat > "$hugo_content_dir/index.md" << EOF
---
title: "$page_num"
---
$(cat "$page_dir/transcript.md")
EOF
        fi
    fi
done

echo "Hugo content files generated successfully!"
echo "Run 'hugo server' to preview the site locally"