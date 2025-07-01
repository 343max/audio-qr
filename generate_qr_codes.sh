#!/bin/bash

# Create qr-code directory
mkdir -p qr-code

# Base URL for the GitHub Pages site
BASE_URL="https://343max.github.io/audio-qr"

# Start HTML file
cat > qr-code/qr-codes.html << 'EOF'
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Audio QR Codes - Printable</title>
    <style>
        @media print {
            body { margin: 0; }
            .no-print { display: none; }
        }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            margin: 20px;
            background: white;
        }
        
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 40px;
            max-width: 1000px;
            margin: 0 auto;
        }
        
        .qr-item {
            text-align: center;
            border: 2px solid #333;
            border-radius: 12px;
            padding: 20px;
            background: white;
        }
        
        .qr-title {
            font-size: 24px;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 15px;
        }
        
        .qr-code svg {
            max-width: 200px;
            height: auto;
            margin: 15px 0;
        }
        
        .qr-url {
            font-size: 12px;
            color: #666;
            word-break: break-all;
            margin-top: 10px;
            font-family: monospace;
        }
        
        .instructions {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 30px;
            border-left: 4px solid #3498db;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Interactive Audio Poster - QR Codes</h1>
        <div class="instructions no-print">
            <strong>Druckanweisungen:</strong> Diese Seite ist für den Druck optimiert. 
            Verwenden Sie Strg+P (Cmd+P auf Mac) zum Drucken.
        </div>
    </div>
    
    <div class="grid">
EOF

# Generate QR codes and add to HTML
for i in {1..3}; do
    URL="$BASE_URL/$i/"
    
    echo "Generating SVG QR code for page $i: $URL"
    
    # Generate QR code as SVG
    SVG_CONTENT=$(qrencode -t SVG -s 10 -m 2 "$URL")
    
    # Add QR code item to HTML
    cat >> qr-code/qr-codes.html << EOF
        <div class="qr-item">
            <div class="qr-title">Audio $i</div>
            <div class="qr-code">
                $SVG_CONTENT
            </div>
            <div class="qr-url">$URL</div>
        </div>
EOF
done

# Close HTML file
cat >> qr-code/qr-codes.html << 'EOF'
    </div>
</body>
</html>
EOF

echo ""
echo "QR codes HTML generated successfully!"
echo "File created: qr-code/qr-codes.html"
echo "Open this file in a browser and print for your poster."