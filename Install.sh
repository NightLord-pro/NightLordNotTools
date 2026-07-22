#!/bin/bash

# Set colors for a better-looking menu
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to install the panel
install_panel() {
    echo -e "\n${CYAN}[+] Installing dependencies... Please wait...${NC}"

    # Update system package index
    sudo apt update

    # Install required packages
    sudo apt install -y curl git build-essential

    # Setup and install Node.js 20.x
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt install -y nodejs

    # Install PM2 globally
    sudo npm install -g pm2

    echo -e "\n${CYAN}[+] Downloading and setting up the v4 Panel...${NC}"

    # Check if the v4panel folder already exists
    if [ -d "v4panel" ]; then
        echo -e "${YELLOW}[!] The 'v4panel' folder already exists. Please delete it first or use the update option (Option 2).${NC}"
        return
    fi

    # Clone from GitHub
    git clone https://github.com/teryxlabs/v4panel

    # Navigate into the directory
    cd v4panel || {
        echo -e "${RED}[!] Failed to enter the directory!${NC}"
        return
    }

    # Install node modules
    npm install

    # Create user and build
    npm run createuser
    npm run build

    # Start with PM2
    pm2 start ecosystem.config.cjs
    pm2 save

    echo -e "\n${GREEN}==========================================${NC}"
    echo -e "${GREEN} [✓] Panel successfully installed and started!${NC}"
    echo -e "${GREEN} Panel Status: [Online]${NC}"
    echo -e "${GREEN}==========================================${NC}"

    # Return to the main directory
    cd ..
}

# Function to update the panel
update_panel() {
    echo -e "\n${CYAN}[+] Updating the panel...${NC}"

    # Check if the v4panel folder exists
    if [ -d "v4panel" ]; then
        cd v4panel || {
            echo -e "${RED}[!] Failed to enter the directory!${NC}"
            return
        }

        # Fetch new updates from GitHub
        git stash
        git pull

        # Update packages and rebuild
        npm install
        npm run build

        # Restart PM2
        pm2 restart all

        echo -e "\n${GREEN}[✓] Panel successfully updated and restarted!${NC}"

        # Return to the main directory
        cd ..
    else
        echo -e "${RED}[!] 'v4panel' directory not found! Please install the panel first (Option 1).${NC}"
    fi
}

# Main menu loop
while true; do
    echo -e "\n${YELLOW}========================================${NC}"
    echo -e "${GREEN}          V4 PANEL MANAGER              ${NC}"
    echo -e "${YELLOW}========================================${NC}"
    echo -e "${CYAN}1.${NC} Install Panel (Auto Setup)"
    echo -e "${CYAN}2.${NC} Update Panel"
    echo -e "${RED}3.${NC} Exit"
    echo -e "${YELLOW}========================================${NC}"

    read -p "Choose an option (1/2/3): " choice

    case $choice in
        1)
            install_panel
            ;;
        2)
            update_panel
            ;;
        3)
            echo -e "${YELLOW}Exiting script... Goodbye!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}[!] Invalid option! Please enter 1, 2, or 3.${NC}"
            ;;
    esac
done
