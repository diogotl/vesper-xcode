#!/bin/bash

# Vesper Theme for Xcode - Uninstallation Script
# Port of the original Vesper theme by Rauno Freiberg
# Author: diogotl

set -e

# Vesper color palette for terminal output
VESPER_ORANGE='\033[38;2;255;199;153m'  # #FFC799
VESPER_GREEN='\033[38;2;153;255;228m'   # #99FFE4
VESPER_RED='\033[38;2;255;128;128m'     # #FF8080
VESPER_GRAY='\033[38;2;160;160;160m'    # #A0A0A0
VESPER_WHITE='\033[38;2;255;255;255m'   # #FFFFFF
NC='\033[0m' # No Color

# Xcode themes directory
THEMES_DIR="$HOME/Library/Developer/Xcode/UserData/FontAndColorThemes"
THEME_FILE="Vesper.xccolortheme"

echo -e "${VESPER_ORANGE}🗑️  Vesper Theme for Xcode - Uninstaller${NC}"
echo "===================================================="

# Check if theme is installed
if [ ! -f "$THEMES_DIR/$THEME_FILE" ]; then
    echo -e "${VESPER_ORANGE}⚠️  Vesper theme is not installed${NC}"
    exit 0
fi

# Show backup files if any exist
BACKUPS=$(find "$THEMES_DIR" -name "${THEME_FILE}.backup.*" 2>/dev/null || true)
if [ ! -z "$BACKUPS" ]; then
    echo -e "${VESPER_GRAY}📦 Found backup files:${NC}"
    echo "$BACKUPS"
fi

# Remove theme file
echo -e "${VESPER_ORANGE}🗑️  Removing Vesper theme...${NC}"
rm "$THEMES_DIR/$THEME_FILE"

# Verify removal
if [ ! -f "$THEMES_DIR/$THEME_FILE" ]; then
    echo -e "${VESPER_GREEN}✅ Vesper theme uninstalled successfully!${NC}"
    echo -e "${VESPER_GRAY}Restart Xcode to see the changes.${NC}"
else
    echo -e "${VESPER_RED}❌ Uninstallation failed${NC}"
    exit 1
fi
