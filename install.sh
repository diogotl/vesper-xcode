#!/bin/bash

# Vesper Theme for Xcode - Installation Script
# Port of the original Vesper theme by Rauno Freiberg
# Original: https://github.com/raunofreiberg/vesper
# Author: diogotl
# Repository: https://github.com/diogotl/vesper-xcode-theme

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

echo -e "${VESPER_ORANGE}🌙 Vesper Theme for Xcode${NC}"
echo -e "${VESPER_GRAY}Peppermint and orange flavored dark theme${NC}"
echo -e "${VESPER_GRAY}Port of the original Vesper by Rauno Freiberg${NC}"
echo "=================================================="

# Check if Xcode is installed
if ! command -v xcode-select &> /dev/null; then
    echo -e "${VESPER_RED}❌ Xcode is not installed or not found in PATH${NC}"
    exit 1
fi

# Check if Xcode Command Line Tools are installed
if ! xcode-select -p &> /dev/null; then
    echo -e "${VESPER_RED}❌ Xcode Command Line Tools not installed${NC}"
    echo -e "${VESPER_GRAY}Run: xcode-select --install${NC}"
    exit 1
fi

# Create themes directory if it doesn't exist
if [ ! -d "$THEMES_DIR" ]; then
    echo -e "${VESPER_ORANGE}📁 Creating themes directory...${NC}"
    mkdir -p "$THEMES_DIR"
fi

# Check if theme file exists in current directory
if [ ! -f "$THEME_FILE" ]; then
    echo -e "${VESPER_RED}❌ Theme file '$THEME_FILE' not found in current directory${NC}"
    echo -e "${VESPER_GRAY}Make sure you're running this script from the repository root.${NC}"
    exit 1
fi

# Backup existing theme if it exists
if [ -f "$THEMES_DIR/$THEME_FILE" ]; then
    echo -e "${VESPER_ORANGE}💾 Backing up existing theme...${NC}"
    cp "$THEMES_DIR/$THEME_FILE" "$THEMES_DIR/${THEME_FILE}.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Copy theme file
echo -e "${VESPER_ORANGE}📋 Installing Vesper theme...${NC}"
cp "$THEME_FILE" "$THEMES_DIR/"

# Verify installation
if [ -f "$THEMES_DIR/$THEME_FILE" ]; then
    echo -e "${VESPER_GREEN}✅ Vesper theme installed successfully!${NC}"
    echo ""
    echo -e "${VESPER_ORANGE}📖 Next steps:${NC}"
    echo -e "${VESPER_WHITE}1. Restart Xcode if it's currently running${NC}"
    echo -e "${VESPER_WHITE}2. Go to Xcode > Preferences > Fonts & Colors${NC}"
    echo -e "${VESPER_WHITE}3. Select 'Vesper' from the theme list${NC}"
    echo -e "${VESPER_WHITE}4. Enjoy your peppermint and orange flavored theme! 🌙${NC}"
else
    echo -e "${VESPER_RED}❌ Installation failed${NC}"
    exit 1
fi
