#!/bin/bash

# ==========================================================
#   ⚔️ SOLO LEVELING: SHADOW MONARCH SYSTEM v8.5 ⚔️
#   [Created by: NightLord | The Only Player Who Can Level Up]
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
BACKUP_DIR="$WORK_DIR/shadow_backups"
CONFIG_FILE="$HOME/.shadow_monarch.conf"
VERSION="8.5 SHADOW MONARCH ELITE (NightLord Edition)"

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
    echo "    ║     [SYSTEM: Welcome Back, Monarch NightLord]           ║"
    echo "    ║     ⚔️ INITIALIZING SHADOW MONARCH SYSTEM v8.5 ⚔️         ║"
    echo "    ╚══════════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
    echo -e " ${GRAY}Creator Profile:${RESET} ${PURPLE}NightLord${RESET}"
    echo -ne "${CYAN} [System] Synchronizing Gate Matrix [${RESET}"
    for i in {1..30}; do
        echo -e -n "${PURPLE}█${RESET}"
        sleep 0.02
    done
    echo -e "${CYAN}] ${GREEN}100% AWAKENED${RESET}"
    echo -e "${YELLOW}💬 [System]: 'Arise, NightLord.' Your absolute power commands this domain.${RESET}"
    sleep 1
}

# ==========================
# 👁️ MONARCH HUD HEADER
# ==========================
header() {
    clear
    echo -e "${PURPLE}"
    echo "╭──────────────────────────────────────────────────────────╮"
    echo "│      ⚔️ SHADOW MONARCH CONTROL INTERFACE v8.5 ⚔️          │"
    echo "╰──────────────────────────────────────────────────────────┘"
    echo -e "${RESET}"
    echo -e " ${CYAN}⚡ Mana/RAM:${RESET}  ${GREEN}$RAM${RESET}    │  ${CYAN}👑 Monarch:${RESET} ${PURPLE}NightLord${RESET}"
    echo -e " ${CYAN}📂 Directory:${RESET} ${GREEN}$MC_DIR${RESET} │  ${CYAN}🛡️ Status:${RESET}  ${GREEN}Secure [ONLINE]${RESET}"
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
        echo -e " ${RED}[8] Return to Command Hub${RESET}"
        echo
        read -p "Select Gate Level [1-8]: " v_choice

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
        8) return 1 ;;
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
    header
    echo -e "${PURPLE}══ 📦 NIGHTLORD'S SHADOW BACKUP VAULT ══${RESET}"
    echo -e " ${CYAN}[1]${RESET} Create Backup (Store in Shadows)"
    echo -e " ${CYAN}[2]${RESET} Restore Backup (Resurrect from Shadows)"
    echo -e " ${RED}[3]${RESET} Back to Menu"
    echo
    read -p "Choose Shadow Action [1-3]: " b_choice

    case $b_choice in
    1)
        if [ ! -d "$MC_DIR" ]; then
            echo -e "${RED}❌ No server folder found to backup!${RESET}"
            pause
            return
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
            return
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
    3)
        return
        ;;
    *)
        echo -e "${RED}Invalid choice!${RESET}"
        sleep 1
        ;;
    esac
}

# ==========================
# 🔌 SHADOW SOLDIER PLUGINS
# ==========================
plugins() {
    while true; do
        header
        mkdir -p "$PLUGIN_DIR"
        cd "$PLUGIN_DIR" || return

        echo -e "${PURPLE}══ 🔌 NIGHTLORD'S SHADOW SOLDIERS (PLUGINS) ══${RESET}"
        echo -e " ${CYAN}[1]${RESET} ViaVersion (Cross-Gate Support)"
        echo -e " ${CYAN}[2]${RESET} ViaBackwards"
        echo -e " ${CYAN}[3]${RESET} SkinsRestorer"
        echo -e " ${CYAN}[4]${RESET} Connect (Minekube Tunnel)"
        echo -e " ${CYAN}[5]${RESET} Playit Plugin"
        echo -e " ${CYAN}[6]${RESET} EssentialsX"
        echo -e " ${CYAN}[7]${RESET} ⚡ Summon All Shadow Soldiers (Install All)"
        echo -e " ${RED}[8]${RESET} Return to Hub"
        echo
        read -p "Select Soldier Option [1-8]: " p

        case $p in
        1) curl -L -o ViaVersion.jar https://github.com/ViaVersion/ViaVersion/releases/download/5.10.0/ViaVersion-5.10.0.jar; echo -e "${GREEN}✔ ViaVersion Summoned for NightLord!${RESET}"; pause ;;
        2) curl -L -o ViaBackwards.jar https://github.com/ViaVersion/ViaBackwards/releases/download/5.10.0/ViaBackwards-5.10.0.jar; echo -e "${GREEN}✔ ViaBackwards Summoned for NightLord!${RESET}"; pause ;;
        3) curl -L -o SkinsRestorer.jar https://github.com/SkinsRestorer/SkinsRestorer/releases/download/15.12.0/SkinsRestorer.jar; echo -e "${GREEN}✔ SkinsRestorer Summoned for NightLord!${RESET}"; pause ;;
        4) curl -L -o Connect.jar https://github.com/minekube/connect-java/releases/latest/download/connect-spigot.jar; echo -e "${GREEN}✔ Connect Summoned for NightLord!${RESET}"; pause ;;
        5) curl -L -o playit-plugin.jar https://github.com/playit-cloud/playit-minecraft-plugin/releases/latest/download/playit-plugin.jar; echo -e "${GREEN}✔ Playit Summoned for NightLord!${RESET}"; pause ;;
        6) curl -L -o EssentialsX.jar https://github.com/EssentialsX/Essentials/releases/latest/download/EssentialsX.jar; echo -e "${GREEN}✔ EssentialsX Summoned for NightLord!${RESET}"; pause ;;
        7)
            echo -e "${CYAN}💬 [System]: Extracting all shadow soldiers simultaneously for NightLord...${RESET}"
            curl -L -o ViaVersion.jar https://github.com/ViaVersion/ViaVersion/releases/download/5.10.0/ViaVersion-5.10.0.jar
            curl -L -o ViaBackwards.jar https://github.com/ViaVersion/ViaBackwards/releases/download/5.10.0/ViaBackwards-5.10.0.jar
            curl -L -o SkinsRestorer.jar https://github.com/SkinsRestorer/SkinsRestorer/releases/download/15.12.0/SkinsRestorer.jar
            curl -L -o Connect.jar https://github.com/minekube/connect-java/releases/latest/download/connect-spigot.jar
            curl -L -o playit-plugin.jar https://github.com/playit-cloud/playit-minecraft-plugin/releases/latest/download/playit-plugin.jar
            curl -L -o EssentialsX.jar https://github.com/EssentialsX/Essentials/releases/latest/download/EssentialsX.jar
            echo -e "${GREEN}✔ NightLord's Full Army Deployed Successfully!${RESET}"
            pause
            ;;
        8) break ;;
        *) echo -e "${RED}Invalid Command!${RESET}"; sleep 1 ;;
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
        echo -e " ${CYAN}[3]${RESET} 🔌 Shadow Soldier Plugins"
        echo -e " ${CYAN}[4]${RESET} 📦 Shadow Backup Vault"
        echo -e " ${RED}[0]${RESET} ⬅ Back to Main System"
        echo
        read -p "Choose Command [0-4]: " mccb_choice

        case $mccb_choice in
        1) setup_server ;;
        2) run_server ;;
        3) plugins ;;
        4) shadow_backup ;;
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
        echo -e " ${RED}[4]${RESET} Back to Main System"
        echo
        read -p "Select Status Option [1-4]: " s

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
        4) break ;;
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
    echo -e "│       Installing Cloudflared       │"
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

    if systemctl list-units --type=service | grep -q cloudflared; then
        echo -e "${YELLOW}⚠ Existing Cloudflared service detected${NC}"
        echo -e "${CYAN}→ Removing old service...${NC}"
        sudo cloudflared service uninstall
        echo -e "${GREEN}✔ Old service removed${NC}"
        echo ""
    fi

    echo -e "${BLUE}🔑 Paste Cloudflare Tunnel token"
    echo -e "${DIM}(sirf token ya poora command — dono chalega)${NC}"
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
        echo -e "${YELLOW}→ Check with: systemctl status cloudflared${NC}"
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
        echo -e "║ ${GREEN}1) Install / Setup Tunnel${NC}   ║"
        echo "║                                             ║"
        echo -e "║ ${RED}2) Uninstall Completely${NC}       ║"         
        echo "║                                             ║"
        echo -e "║ ${RED}3) Return to Main System${NC}      ║" 
        echo "╚═════════════════════════════════════════════╝${NC}"
        echo -ne "${BLUE}Select an option [1-3]: ${NC}"
        read choice

        case $choice in
            1) install_cloudflared ;;
            2) uninstall_cloudflared ;;
            3) break ;;
            *) echo -e "${RED}Invalid option!${NC}"; sleep 1 ;;
        esac
    done
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

    echo -e "${PURPLE}══ 🌟 NIGHTLORD'S SHADOW MONARCH DASHBOARD v8.5 ══${RESET}"
    echo -e " ${CYAN}[1]${RESET} ⚔️ Command & Build Center (Server, Runtime, Backups)"
    echo -e " ${CYAN}[2]${RESET} ⚙️ Status & RAM Manager"
    echo -e " ${CYAN}[3]${RESET} 🔄 Infinite Dungeon Host (24/7)"
    echo -e " ${CYAN}[4]${RESET} 🌐 Playit Tunnel Setup"
    echo -e " ${CYAN}[5]${RESET} ☁️ Cloudflared Tunnel Manager"
    echo -e " ${CYAN}[6]${RESET} ⚡ Panels Installer Hub"
    echo -e " ${RED}[0]${RESET} ❌ Close System / Log Out"
    echo
    read -p "Enter System Command [0-6]: " main_choice

    case $main_choice in
    1) mc_cb_menu ;;
    2) settings ;;
    3) host_24_7 ;;
    4) playit_setup ;;
    5) cloudflared_menu ;;
    6) panels_menu ;;
    0)
       clear
       echo -e "${PURPLE}💬 [System]: Logging out, Monarch NightLord. Rise again when you are ready. 🌙${RESET}"
       exit 0
       ;;
    *)
       echo -e "${RED}Invalid System Command!${RESET}"
       sleep 1
       ;;
    esac
done
