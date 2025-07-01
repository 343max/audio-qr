# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an **interactive audio poster website generator** that creates QR code-linked web pages for audio content. The project generates a static website using Hugo where each QR code links to a dedicated page with audio playback and transcript display.

## Project Architecture

- **Static Site Generator**: Hugo (needs to be set up)
- **Content Structure**: 3 audio files (M4A format) with German transcripts
- **Output**: Individual web pages with MP3 players and transcript display
- **QR Integration**: QR codes linking to `https://koljas-katze.de/[page]`

## Source Files

- `audio/`: Contains source M4A files and corresponding German transcript TXT files
- Audio files: `1.m4a`, `2.m4a`, `3.m4a` (64-89KB each)
- Transcripts: `1.txt`, `2.txt`, `3.txt` (German language content)

## Implementation Requirements

### Audio Processing
- Convert M4A files to MP3 format for web compatibility
- Maintain audio quality while ensuring web-optimized file sizes

### Hugo Site Structure
- Each audio file gets its own directory with `index.html` and MP3 file
- Simple template with audio player UI and transcript display below
- No inter-page navigation required
- URL structure: `https://koljas-katze.de/[page]` (excluding index.html)

### QR Code Generation
- Generate QR codes for each page and store in `qr-code/` directory
- Include printed labels for identification on physical poster
- QR codes should link directly to the web pages

## Development Setup

**Current Status**: Project is in planning phase - Hugo configuration and build system need to be implemented.

**Required Setup Steps**:
1. Initialize Hugo static site generator
2. Create templates for audio player pages
3. Set up audio conversion pipeline (M4A to MP3)
4. Implement QR code generation
5. Configure build and deployment process

## Key Technical Constraints

- Minimal design focused on functionality over aesthetics
- Each page must be self-contained (no shared navigation)
- QR codes must be printable with clear labeling
- German language content (transcripts are in German)