#!/bin/bash

# Create qr-code directory
mkdir -p qr-code

# Base URL for the GitHub Pages site
BASE_URL="https://343max.github.io/audio-qr"

# Generate QR codes for each page
for i in {1..3}; do
    URL="$BASE_URL/$i/"
    
    echo "Generating QR code for page $i: $URL"
    
    # Generate QR code using qrencode
    qrencode -o "qr-code/page-$i.png" -s 10 -m 2 "$URL"
    
    # Create a labeled version with text
    convert "qr-code/page-$i.png" -background white -gravity center \
        -extent 400x450 \
        -pointsize 20 -fill black \
        -gravity south -annotate +0+10 "Audio $i\n$URL" \
        "qr-code/page-$i-labeled.png"
    
    echo "Created QR code: qr-code/page-$i.png"
    echo "Created labeled QR code: qr-code/page-$i-labeled.png"
done

echo ""
echo "QR codes generated successfully!"
echo "Files created in qr-code/ directory"
echo "The labeled versions include the page number and URL for easy identification."