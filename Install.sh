#!/bin/bash

# ==========================================================
#   ⚔️ SOLO LEVELING: SHADOW MONARCH SYSTEM v9.4 ELITE ⚔️
#   [Created by: NightLord | Universal Exit Protocol 0]
# ==========================================================

# Aesthetic Styles & Color Palette (Monarch Theme)
PURPLE="\033[1;35m"
DARK_PURPLE="\033[0;35m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
WHITE="\033[1;37m"
GRAY="\033[0;90m"
DIM="\033[2m"
BOLD="\033[1m"
RESET="\033[0m"

# Paths & Settings
WORK_DIR="$(pwd)"
MC_DIR="$WORK_DIR/server"
PLUGIN_DIR="$MC_DIR/plugins"
WORLD_DIR="$MC_DIR/world"
BACKUP_DIR="$WORK_DIR/shadow_backups"
CONFIG_FILE="$HOME/.shadow_monarch.conf"
VERSION="9.4 SHADOW MONARCH GOD-TIER (NightLord Edition)"

# Load Config
[ -f "$CONFIG_FILE" ] && source "$CONFIG_FILE"
RAM=${RAM:-"8192M"}
JAVA_FLAGS=${JAVA_FLAGS:-"-Xms${RAM} -Xmx${RAM}"}

# ==========================
# 💠 SOLO LEVELING EPIC SYSTEM AWAKENING
# ==========================
system_awakening() {
    clear
    echo -e "${PURPLE}"
    echo "    ╔══════════════════════════════════════════════════════════╗"
    echo "    ║     [SYSTEM: Welcome Back, Sovereign NightLord]          ║"
    echo "    ║     ⚔️ INITIALIZING SHADOW MONARCH SYSTEM v9.4 ⚔️          ║"
    echo "    ╚══════════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
    echo -e " ${GRAY}Creator Profile:${RESET} ${PURPLE}NightLord${RESET}"
    echo -ne "${CYAN} [System] Synchronizing Absolute Gate Matrix [${RESET}"
    for i in {1..35}; do
        echo -e -n "${PURPLE}█${RESET}"
        sleep 0.015
    done
    echo -e "${CYAN}] ${GREEN}100% AWAKENED${RESET}"
    echo -e "${YELLOW}💬 [System]: 'Arise, NightLord.' Your absolute domain is fully active.${RESET}"
    sleep 1
}

# ==========================
# 👁️ MONARCH HUD HEADER
# ==========================
header() {
    clear
    echo -e "${PURPLE}"
    echo "╭──────────────────────────────────────────────────────────╮"
    echo "│      ⚔️ SHADOW MONARCH SUPREME INTERFACE v9.4 ⚔️           │"
    echo "╰──────────────────────────────────────────────────────────┘"
    echo -e "${RESET}"
    echo -e " ${CYAN}⚡ Mana/RAM:${RESET}  ${GREEN}$RAM${RESET}    │  ${CYAN}👑 Monarch:${RESET} ${PURPLE}NightLord${RESET}"
    echo -e " ${CYAN}📂 Directory:${RESET} ${GREEN}$MC_DIR${RESET} │  ${CYAN}🛡️ Status:${RESET}  ${GREEN}God-Tier [ONLINE]${RESET}"
    echo -e "${GRAY}────────────────────────────────────────────────────────────${RESET}"
    echo
}

# ==========================
# 🛑 PAUSE SCREEN
# ==========================
pause() {
    echo
    echo -e "${GRAY}Press [Enter] to return to Monarch NightLord's Throne...${RESET}"
    read -r
}

# ==========================
# 📊 AUTO RAM DETECT (STAT BOOST)
# ==========================
detect_ram() {
    TOTAL=$(awk '/MemTotal/ {print int($2/1024)}' /proc/meminfo)
    USE=$((TOTAL-512))
    [ "$USE" -lt 512 ] && USE=512
    RAM="${USE}M"
    JAVA_FLAGS="-Xms${RAM} -Xmx${RAM}"
    echo "RAM=\"$RAM\"" > "$CONFIG_FILE"
}

# ==========================
# 🌐 GATE VERSION SELECTOR (ALL 1.21.x FOCUS)
# ==========================
version_selector() {
    while true; do
        header
        echo -e "${PURPLE}══ 🌐 SELECT GATE DIFFICULTY (PAPER VERSION) ══${RESET}"
        echo -e " ${CYAN}[1]${RESET} Paper 1.21.11 (Latest S-Rank Monarch) 🔥"
        echo -e " ${CYAN}[2]${RESET} Paper 1.21.10"
        echo -e " ${CYAN}[3]${RESET} Paper 1.21.9"
        echo -e " ${CYAN}[4]${RESET} Paper 1.21.8"
        echo -e " ${CYAN}[5]${RESET} Paper 1.21.4"
        echo -e " ${CYAN}[6]${RESET} Paper 1.21.1"
        echo -e " ${CYAN}[7]${RESET} Custom Direct URL"
        echo -e " ${RED}[0] Return to Previous Menu${RESET}"
        echo
        read -p "Select Gate Level [0-7]: " v_choice

        case $v_choice in
        1) DOWNLOAD_URL="https://fill-data.papermc.io/v1/objects/e708e8c132dc143ffd73528cccb9532e2eb17628b1a0eee74469bf466c7003f8/paper-1.21.11-116.jar"; break ;;
        2) DOWNLOAD_URL="https://api.papermc.io/v2/projects/paper/versions/1.21.10/builds/1/downloads/paper-1.21.10-1.jar"; break ;;
        3) DOWNLOAD_URL="https://api.papermc.io/v2/projects/paper/versions/1.21.9/builds/1/downloads/paper-1.21.9-1.jar"; break ;;
        4) DOWNLOAD_URL="https://api.papermc.io/v2/projects/paper/versions/1.21.8/builds/1/downloads/paper-1.21.8-1.jar"; break ;;
        5) DOWNLOAD_URL="https://api.papermc.io/v2/projects/paper/versions/1.21.4/builds/95/downloads/paper-1.21.4-95.jar"; break ;;
        6) DOWNLOAD_URL="https://api.papermc.io/v2/projects/paper/versions/1.21.1/builds/126/downloads/paper-1.21.1-126.jar"; break ;;
        7)
            read -p "Paste Custom Direct Jar URL: " DOWNLOAD_URL
            [ -z "$DOWNLOAD_URL" ] && echo -e "${RED}Invalid URL!${RESET}" && sleep 1 || break
            ;;
        0) return 1 ;;
        *) echo -e "${RED}Invalid Gate Choice!${RESET}"; sleep 1 ;;
        esac
    done
    return 0
}

# ==========================
# 🏰 GATE SETUP (CREATE SERVER)
# ==========================
setup_server() {
    version_selector
    if [ $? -eq 1 ]; then
        return
    fi

    header
    mkdir -p "$MC_DIR"
    cd "$MC_DIR" || return

    echo -e "${CYAN}⚔️ Opening Gate... Extracting Core Server Data for NightLord...${RESET}"
    curl -L -o server.jar "$DOWNLOAD_URL"

    if [ $? -ne 0 ] || [ ! -s server.jar ]; then
        echo -e "${RED}❌ Gate Collapse! Download failed. Check your network link.${RESET}"
        rm -f server.jar
        pause
        return
    fi

    echo "eula=true" > eula.txt
    mkdir -p plugins

    echo -e "${GREEN}✔ Gate Conquered by NightLord! Server core established & EULA signed.${RESET}"
    pause
}

# ==========================
# 🎮 AWAKEN SERVER (RUN)
# ==========================
run_server() {
    header
    cd "$MC_DIR" || return

    if [ ! -f server.jar ]; then
        echo -e "${RED}❌ No core found in NightLord's domain! Setup a server first.${RESET}"
        pause
        return
    fi

    echo -e "${PURPLE}💬 [System]: Invoking server runtime initialization for Monarch NightLord...${RESET}"
    echo -e "${GRAY}Assigned Power Flags: $JAVA_FLAGS${RESET}"
    echo
    java $JAVA_FLAGS -jar server.jar nogui
    pause
}

# ==========================
# 📦 SHADOW BACKUP VAULT
# ==========================
shadow_backup() {
    while true; do
        header
        echo -e "${PURPLE}══ 📦 NIGHTLORD'S SHADOW BACKUP VAULT ══${RESET}"
        echo -e " ${CYAN}[1]${RESET} Create Backup (Store in Shadows)"
        echo -e " ${CYAN}[2]${RESET} Restore Backup (Resurrect from Shadows)"
        echo -e " ${RED}[0]${RESET} Return to Command Hub"
        echo
        read -p "Choose Shadow Action [0-2]: " b_choice

        case $b_choice in
        1)
            if [ ! -d "$MC_DIR" ]; then
                echo -e "${RED}❌ No server folder found to backup!${RESET}"
                pause
                continue
            fi
            mkdir -p "$BACKUP_DIR"
            TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
            BACKUP_FILE="$BACKUP_DIR/nightlord_backup_$TIMESTAMP.tar.gz"
            echo -e "${CYAN}📦 Compressing domain data into NightLord's Shadow Realm...${RESET}"
            tar -czf "$BACKUP_FILE" -C "$WORK_DIR" server
            echo -e "${GREEN}✔ Backup Secured successfully at: $BACKUP_FILE${RESET}"
            pause
            ;;
        2)
            if [ ! -d "$BACKUP_DIR" ]; then
                echo -e "${RED}❌ No backups found in the vault!${RESET}"
                pause
                continue
            fi
            echo -e "${CYAN}Available Shadows (Backups):${RESET}"
            select b_file in "$BACKUP_DIR"/*.tar.gz; do
                if [ -n "$b_file" ]; then
                    echo -e "${YELLOW}Extracting shadows back to NightLord's domain...${RESET}"
                    rm -rf "$MC_DIR"
                    tar -xzf "$b_file" -C "$WORK_DIR"
                    echo -e "${GREEN}✔ Resurrected Successfully, My Monarch!${RESET}"
                    break
                else
                    echo -e "${RED}Invalid selection.${RESET}"
                    break
                fi
            done
            pause
            ;;
        0) break ;;
        *) echo -e "${RED}Invalid choice!${RESET}"; sleep 1 ;;
        esac
    done
}

# ==========================
# 🔌 SHADOW SOLDIER PLUGINS (UNLIMITED MODRINTH SEARCH)
# ==========================
plugins() {
    while true; do
        header
        mkdir -p "$PLUGIN_DIR"
        cd "$PLUGIN_DIR" || return

        echo -e "${PURPLE}══ 🔌 NIGHTLORD'S INFINITE PLUGIN SUMMONER ══${RESET}"
        echo -e " ${CYAN}[1]${RESET} ⚡ Summon Plugin by Name/Keyword (No Limits - e.g. EssentialsX)"
        echo -e " ${CYAN}[2]${RESET} 📦 View All Active Summoned Soldiers (Installed Plugins)"
        echo -e " ${RED}[0]${RESET} Return to Command Hub"
        echo
        read -p "Select Plugin Action [0-2]: " p_choice

        case $p_choice in
        1)
            echo
            echo -e "${CYAN}💬 [System]: Enter the exact name or keyword of the plugin.${RESET}"
            read -p "Plugin Name > " plugin_query

            if [ -z "$plugin_query" ]; then
                echo -e "${RED}❌ Plugin name cannot be empty!${RESET}"
                pause
                continue
            fi

            echo -e "${PURPLE}🔍 Searching the ancient archives for '$plugin_query'...${RESET}"
            
            API_URL="https://api.modrinth.com/v2/search?query=${plugin_query}&facets=[[\"project_type:plugin\"],[\"categories:paper\"],[\"server_side:required\"]]&limit=1"
            
            RESPONSE=$(curl -s "$API_URL")
            TOTAL_HITS=$(echo "$RESPONSE" | grep -o '"total_hits":[0-9]*' | head -1 | cut -d':' -f2)

            if [ -z "$TOTAL_HITS" ] || [ "$TOTAL_HITS" -eq 0 ]; then
                API_URL="https://api.modrinth.com/v2/search?query=${plugin_query}&facets=[[\"project_type:plugin\"]]&limit=1"
                RESPONSE=$(curl -s "$API_URL")
                PROJECT_ID=$(echo "$RESPONSE" | grep -o '"project_id":"[^"]*"' | head -1 | cut -d'"' -f4)
            else
                PROJECT_ID=$(echo "$RESPONSE" | grep -o '"project_id":"[^"]*"' | head -1 | cut -d'"' -f4)
            fi

            if [ -z "$PROJECT_ID" ]; then
                echo -e "${RED}❌ No matching plugins found for '$plugin_query'. Try another name!${RESET}"
                pause
                continue
            fi

            PROJECT_URL="https://api.modrinth.com/v2/project/$PROJECT_ID/versions"
            VERSIONS_JSON=$(curl -s "$PROJECT_URL")
            
            DOWNLOAD_LINK=$(echo "$VERSIONS_JSON" | grep -o '"url":"[^"]*\.jar"' | head -1 | cut -d'"' -f4)
            FILE_NAME=$(echo "$VERSIONS_JSON" | grep -o '"filename":"[^"]*\.jar"' | head -1 | cut -d'"' -f4)

            if [ -z "$DOWNLOAD_LINK" ]; then
                echo -e "${RED}❌ Could not retrieve direct download link for this plugin.${RESET}"
                pause
                continue
            fi

            echo -e "${GREEN}✔ Found: $FILE_NAME${RESET}"
            echo -e "${CYAN}⚡ Summoning plugin into NightLord's server...${RESET}"
            
            curl -L -o "$FILE_NAME" "$DOWNLOAD_LINK"

            if [ $? -eq 0 ] && [ -f "$FILE_NAME" ]; then
                echo -e "${GREEN}✨ Success! '$FILE_NAME' has been bound to your domain.${RESET}"
            else
                echo -e "${RED}❌ Failed to download the plugin. Check connection.${RESET}"
            fi
            pause
            ;;
        2)
            echo -e "${CYAN}📦 Currently Active Shadow Soldiers (Installed Plugins):${RESET}"
            echo -e "${GRAY}------------------------------------------------------------${RESET}"
            if [ -n "$(ls -A "$PLUGIN_DIR" 2>/dev/null)" ]; then
                ls -lh "$PLUGIN_DIR" | awk '{print " 🛡️ " $9 " (" $5 ")"}'
            else
                echo -e "${YELLOW}No plugins summoned yet in this domain.${RESET}"
            fi
            echo -e "${GRAY}------------------------------------------------------------${RESET}"
            pause
            ;;
        0) break ;;
        *) echo -e "${RED}Invalid Command!${RESET}"; sleep 1 ;;
        esac
    done
}

# ==========================
# ⚡ GOD-TIER MONARCH UTILITIES
# ==========================
monarch_utilities() {
    while true; do
        header
        echo -e "${PURPLE}══ 🔮 NIGHTLORD'S GOD-TIER MONARCH UTILITIES ══${RESET}"
        echo -e " ${CYAN}[1]${RESET} 🧹 Purge Server Cache & Junk Files"
        echo -e " ${CYAN}[2]${RESET} ⚠️ Wipe World Data (Fresh Dungeon Reset)"
        echo -e " ${CYAN}[3]${RESET} 📁 Open Direct Shell Terminal in Server Dir"
        echo -e " ${CYAN}[4]${RESET} 🛠️ Auto-Fix Paper/Server Permissions"
        echo -e " ${RED}[0]${RESET} ⬅ Back to Main System"
        echo
        read -p "Choose Utility Option [0-4]: " util_choice

        case $util_choice in
        1)
            echo -e "${YELLOW}🧹 Purging useless logs, crash reports, and temp files...${RESET}"
            rm -rf "$MC_DIR/logs/"*.gz
            rm -rf "$MC_DIR/crash-reports/"*
            rm -rf "$MC_DIR/cache/"*
            echo -e "${GREEN}✔ Domain Cleaned Successfully! Maximum performance restored.${RESET}"
            pause
            ;;
        2)
            echo -e "${RED}⚠️ WARNING: This will completely destroy all blocks, builds, and players in the world folder!${RESET}"
            read -p "Are you sure you want to reset NightLord's world? (y/N): " confirm_wipe
            if [[ "$confirm_wipe" =~ ^[Yy]$ ]]; then
                rm -rf "$WORLD_DIR" "$MC_DIR/world_nether" "$MC_DIR/world_the_end"
                echo -e "${GREEN}✔ World wiped successfully. A fresh dungeon awaits your command!${RESET}"
            else
                echo -e "${YELLOW}Wipe aborted. Your world is safe.${RESET}"
            fi
            pause
            ;;
        3)
            echo -e "${CYAN}🚀 Entering interactive sub-shell inside $MC_DIR. Type 'exit' to return.${RESET}"
            cd "$MC_DIR" || return
            bash
            ;;
        4)
            echo -e "${CYAN}🛠️ Fixing ownership and execution permissions for server files...${RESET}"
            chmod +x "$MC_DIR/server.jar" 2>/dev/null
            find "$MC_DIR" -type f -name "*.sh" -exec chmod +x {} \; 2>/dev/null
            echo -e "${GREEN}✔ Permissions normalized under Monarch authority!${RESET}"
            pause
            ;;
        0) break ;;
        *) echo -e "${RED}Invalid Selection!${RESET}"; sleep 1 ;;
        esac
    done
}

# ==========================
# 🎮 COMMAND & BUILD CENTER
# ==========================
mc_cb_menu() {
    while true; do
        header
        echo -e "${PURPLE}══ ⚔️ NIGHTLORD'S COMMAND & BUILD CENTER ══${RESET}"
        echo -e " ${CYAN}[1]${RESET} 🚀 Setup Server Gate"
        echo -e " ${CYAN}[2]${RESET} 🎮 Awaken/Run Server Engine"
        echo -e " ${CYAN}[3]${RESET} 🔌 Shadow Soldier Plugins (Infinite Summoner)"
        echo -e " ${CYAN}[4]${RESET} 📦 Shadow Backup Vault"
        echo -e " ${CYAN}[5]${RESET} 🔮 God-Tier Monarch Utilities"
        echo -e " ${RED}[0]${RESET} ⬅ Back to Main System"
        echo
        read -p "Choose Command [0-5]: " mccb_choice

        case $mccb_choice in
        1) setup_server ;;
        2) run_server ;;
        3) plugins ;;
        4) shadow_backup ;;
        5) monarch_utilities ;;
        0) break ;;
        *) echo -e "${RED}Invalid Selection!${RESET}"; sleep 1 ;;
        esac
    done
}

# ==========================
# ⚙️ STATUS STATS / SETTINGS
# ==========================
settings() {
    while true; do
        header
        echo -e "${PURPLE}══ ⚙️ NIGHTLORD'S STATUS & RAM STATS ══${RESET}"
        echo -e " ${CYAN}[1]${RESET} Auto-Detect Stat Cap (Smart RAM Optimize)"
        echo -e " ${CYAN}[2]${RESET} Allocate Custom Stat Power (Custom RAM)"
        echo -e " ${CYAN}[3]${RESET} View Current Monarch Profile"
        echo -e " ${RED}[0]${RESET} Back to Main System"
        echo
        read -p "Select Status Option [0-3]: " s

        case $s in
        1)
            detect_ram
            echo -e "${GREEN}✔ Status synchronized for NightLord! Maximum RAM assigned.${RESET}"
            pause
            ;;
        2)
            read -p "Enter custom power capacity for NightLord (e.g., 4096M, 8192M): " RAM
            echo "RAM=\"$RAM\"" > "$CONFIG_FILE"
            JAVA_FLAGS="-Xms${RAM} -Xmx${RAM}"
            echo -e "${GREEN}✔ Power successfully recalibrated to $RAM${RESET}"
            pause
            ;;
        3)
            echo -e "${CYAN}Monarch Profile Details:${RESET}"
            echo -e " Monarch Name        : ${PURPLE}NightLord${RESET}"
            echo -e " Assigned RAM Power : ${GREEN}$RAM${RESET}"
            echo -e " Java Execution Flag: ${GREEN}$JAVA_FLAGS${RESET}"
            echo -e " System Config Path : ${GREEN}$CONFIG_FILE${RESET}"
            pause
            ;;
        0) break ;;
        *) echo -e "${RED}Invalid Stat Choice!${RESET}"; sleep 1 ;;
        esac
    done
}

# ==========================
# 🔄 24/7 ETERNAL DUNGEON HOST
# ==========================
host_24_7() {
    header
    echo -e "${GREEN}🔄 Opening NightLord's Infinite Dungeon Daemon (24/7 Host)...${RESET}"
    sleep 1

    while true; do
        curl -fsSL "https://raw.githubusercontent.com/NightLord-pro/NightLordNotTools/refs/heads/main/24-7" | python3
        echo -e "${YELLOW}⚠️ NightLord's dungeon gate flickered. Reopening connection in 3s...${RESET}"
        sleep 3
    done
}

# ==========================
# 🌐 PLAYIT TUNNEL AGENT
# ==========================
playit_setup() {
    header
    echo -e "${GREEN}🌐 Deploying Playit Tunneling Gate for NightLord...${RESET}"
    echo
    wget -q --show-progress https://github.com/playit-cloud/playit-agent/releases/download/v0.15.26/playit-linux-amd64
    chmod +x playit-linux-amd64
    ./playit-linux-amd64
    pause
}

# ==========================
# ☁️ CLOUDFLARED MANAGEMENT
# ==========================
install_cloudflared() {
    clear
    echo -e "${BLUE}┌────────────────────────────────────┐"
    echo -e "│        Installing Cloudflared        │"
    echo -e "└────────────────────────────────────${NC}"

    sudo mkdir -p --mode=0755 /usr/share/keyrings
    curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg \
        | sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null

    echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main' \
        | sudo tee /etc/apt/sources.list.d/cloudflared.list >/dev/null

    sudo apt update
    sudo apt install -y cloudflared

    if ! command -v cloudflared >/dev/null 2>&1; then
        echo -e "${RED}✘ Cloudflared installation failed${NC}"
        pause
        return
    fi

    echo -e "${GREEN}✔ Cloudflared installed successfully${NC}"
    echo ""

    echo -e "${BLUE}🔑 Paste Cloudflare Tunnel token${NC}"
    read -rp "> " USER_INPUT

    CF_TOKEN=$(echo "$USER_INPUT" \
        | sed 's/sudo cloudflared service install //g' \
        | sed 's/cloudflared service install //g' \
        | xargs)

    if [[ -z "$CF_TOKEN" ]]; then
        echo -e "${RED}✘ Invalid or empty token${NC}"
        pause
        return
    fi

    echo -e "${CYAN}🚀 Installing Cloudflared service...${NC}"
    sudo cloudflared service install "$CF_TOKEN"
    sleep 1

    if systemctl is-active --quiet cloudflared; then
        echo -e "${GREEN}✔ Cloudflared service installed & running${NC}"
    else
        echo -e "${YELLOW}⚠ Service installed but not running${NC}"
    fi

    pause
}

uninstall_cloudflared() {
    clear
    echo -e "${BLUE}┌────────────────────────────────────┐"
    echo -e "│      Uninstalling Cloudflared      │"
    echo -e "└────────────────────────────────────${NC}"

    sudo cloudflared service uninstall 2>/dev/null
    sudo apt remove -y cloudflared
    sudo rm -f /etc/apt/sources.list.d/cloudflared.list
    sudo rm -f /usr/share/keyrings/cloudflare-main.gpg

    echo -e "${GREEN}✔ Cloudflared completely removed${NC}"
    pause
}

cloudflared_menu() {
    while true; do
        header
        echo -e "${YELLOW}"
        echo "╔═════════════════════════════════════════════╗"
        echo "║        CLOUDFLARED MANAGEMENT MENU          ║"
        echo "╠═════════════════════════════════════════════╣"
        echo "║                                             ║"
        echo -e " ${GREEN}1) Install / Setup Tunnel${NC}             "
        echo "║                                             ║"
        echo -e " ${RED}2) Uninstall Completely${NC}                   "
        echo "║                                             ║"
        echo -e " ${RED}0) Return to Main System${NC}                " 
        echo "╚═════════════════════════════════════════════╝${NC}"
        echo -ne "${BLUE}Select an option [0-2]: ${NC}"
        read choice

        case $choice in
            1) install_cloudflared ;;
            2) uninstall_cloudflared ;;
            0) break ;;
            *) echo -e "${RED}Invalid option!${NC}"; sleep 1 ;;
        esac
    done
}

# ==========================
# 🪽 WINGS INSTALLER (PTERODACTYL DAEMON)
# ==========================
wings_setup() {
    header
    echo -e "${GREEN}🪽 Initializing Pterodactyl Wings installation suite for NightLord...${RESET}"
    cd "$WORK_DIR"
    bash <(curl -s https://raw.githubusercontent.com/nobita586/Nobita-Hosting/main/cd/wing.sh)
    pause
}

# ==========================
# 📋 BLUEPRINT SETUP (PANEL EXTENSION MANAGER)
# ==========================
blueprint_setup() {
    header
    echo -e "${GREEN}📋 Initializing Blueprint installation suite for NightLord...${RESET}"
    cd "$WORK_DIR"
    bash <(curl -s https://raw.githubusercontent.com/nobita586/Nobita-Hosting/main/cd/blueprint.sh)
    pause
}

# ==========================
# ⚡ PANELS INSTALLER HUB
# ==========================
panels_menu() {
    while true; do
        header
        echo -e "${CYAN}════════════════════════════════════════════════════════${RESET}"
        echo -e "${PURPLE}      ⚡ NIGHTLORD'S SHADOW MONARCH PANELS HUB ⚡      ${RESET}"
        echo -e "${CYAN}════════════════════════════════════════════════════════${RESET}"
        echo -e " ${YELLOW}Monarch Creator & Master:${RESET} ${GREEN}NightLord${RESET}"
        echo
        echo -e " ${CYAN}[1]${RESET} 🚀 jtg (JishnuTheGamer Panel Suite)"
        echo -e " ${CYAN}[2]${RESET} ⚡ Pterodactyl Panel Suite"
        echo -e " ${RED}[0]${RESET} ⬅ Back to Main System"
        echo
        read -p "Select Panel Hub [0-2]: " panel_choice

        case $panel_choice in
        1)
            echo -e "${GREEN}🚀 Initializing jtg installation suite for NightLord...${RESET}"
            cd "$WORK_DIR"
            bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/Jtg/refs/heads/main/install.sh)
            pause
            ;;
        2)
            echo -e "${GREEN}⚡ Initializing Pterodactyl installation suite for NightLord...${RESET}"
            cd "$WORK_DIR"
            bash <(curl -s https://raw.githubusercontent.com/NightLord-pro/NightLordNotTools/refs/heads/main/Petroldectal%20Create)
            pause
            ;;
        0) break ;;
        *) echo -e "${RED}Invalid Panel Choice!${NC}"; sleep 1 ;;
        esac
    done
}

# ==========================
# 🎬 SYSTEM MAIN ENTRY POINT
# ==========================
system_awakening

while true; do
    header

    # --- BIG ASCII BANNER FOR "NIGHT" ---
    echo -e "${PURPLE}${BOLD}"
    echo "  ███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗"
    echo "  ████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝"
    echo "  ██╔██╗ ██║██║██║  ███╗███████║   ██║   "
    echo "  ██║╚██╗██║██║██║   ██║██╔══██║   ██║   "
    echo "  ██║ ╚████║██║╚██████╔╝██║  ██║   ██║   "
    echo "  ╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   "
    echo -e "${RESET}"
    echo -e "${CYAN}                🔗 nightlord link 🔗                 ${RESET}"
    echo -e "${GRAY}────────────────────────────────────────────────────────────${RESET}"

    echo -e "${PURPLE}══ 🌟 NIGHTLORD'S SHADOW MONARCH DASHBOARD v9.4 ══${RESET}"
    echo -e " ${CYAN}[1]${RESET} ⚔️ Command & Build Center (Server, Runtime, Plugins, Backups)"
    echo -e " ${CYAN}[2]${RESET} ⚙️ Status & RAM Manager"
    echo -e " ${CYAN}[3]${RESET} 🔄 Infinite Dungeon Host (24/7)"
    echo -e " ${CYAN}[4]${RESET} 🌐 Playit Tunnel Setup"
    echo -e " ${CYAN}[5]${RESET} ☁️ Cloudflared Tunnel Manager"
    echo -e " ${CYAN}[6]${RESET} ⚡ Panels Installer Hub"
    echo -e " ${CYAN}[7]${RESET} 🪽 Install Wings (Pterodactyl Daemon)"
    echo -e " ${CYAN}[8]${RESET} 📋 Blueprint Setup (Extension Manager)"
    echo -e " ${CYAN}[9]${RESET} 🔮 God-Tier Monarch Utilities & Cleaners"
    echo -e " ${RED}[0]${RESET} ❌ Close System / Log Out"
    echo
    read -p "Enter System Command [0-9]: " main_choice

    case $main_choice in
    1) mc_cb_menu ;;
    2) settings ;;
    3) host_24_7 ;;
    4) playit_setup ;;
    5) cloudflared_menu ;;
    6) panels_menu ;;
    7) wings_setup ;;
    8) blueprint_setup ;;
    9) monarch_utilities ;;
    0)
       clear
       echo -e "${PURPLE}💬 [System]: Logging out, Sovereign Monarch NightLord. Rise again when you are ready. 🌙${RESET}"
       exit 0
       ;;
    *)
       echo -e "${RED}Invalid System Command!${RESET}"
       sleep 1
       ;;
    esac
done
