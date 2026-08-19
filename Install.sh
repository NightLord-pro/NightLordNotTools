#!/bin/bash

# ==========================================================
#   ⚔️ SOLO LEVELING: SHADOW MONARCH SYSTEM v12.9 SUPREME ⚔️
#   [Creator: NightLord | Universal Gate Matrix]
# ==========================================================

# Aesthetic Styles & Color Palette (Monarch Theme)
PURPLE="\033[1;35m"
DEEP_PURPLE="\033[38;5;54m"
BRIGHT_PURPLE="\033[38;5;171m"
NEON_BLUE="\033[38;5;39m"
CYAN="\033[1;36m"
GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
WHITE="\033[1;37m"
GRAY="\033[0;90m"
DIM="\033[2m"
BOLD="\033[1m"
RESET="\033[0m"
NC="\033[0m"

# Paths & Settings
WORK_DIR="$(pwd)"
MC_DIR="$WORK_DIR/server"
WORLD_DIR="$MC_DIR/world"
BACKUP_DIR="$WORK_DIR/shadow_backups"
CONFIG_FILE="$HOME/.shadow_monarch.conf"
VERSION="v12.9 SUPREME"

# Load Config if exists
[ -f "$CONFIG_FILE" ] && source "$CONFIG_FILE"
RAM=${RAM:-"8192M"}
JAVA_FLAGS=${JAVA_FLAGS:-"-Xms${RAM} -Xmx${RAM}"}
LOADER=${LOADER:-"paper"}
SERVER_JAR=${SERVER_JAR:-"server.jar"}

update_loader_dirs() {
    local lower_loader=$(echo "$LOADER" | tr '[:upper:]' '[:lower:]')
    if [[ "$lower_loader" == *"fabric"* || "$lower_loader" == *"forge"* || "$lower_loader" == *"neoforge"* ]]; then
        MOD_DIR="$MC_DIR/mods"
    else
        MOD_DIR="$MC_DIR/plugins"
    fi
}
update_loader_dirs

# ==========================
# 💠 EPIC SYSTEM AWAKENING
# ==========================
system_awakening() {
    clear
    echo -e "${BRIGHT_PURPLE}"
    echo "    ╔══════════════════════════════════════════════════════════╗"
    echo "    ║     [SYSTEM: Welcome Back, Sovereign Monarch NightLord]  ║"
    echo "    ║     ⚔️ INITIALIZING SHADOW MONARCH SYSTEM v12.9 ⚔️         ║"
    echo "    ╚══════════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
    echo -e " ${GRAY}Creator Profile:${RESET} ${PURPLE}NightLord${RESET}"
    echo -ne "${NEON_BLUE} [System] Synchronizing Absolute Gate Matrix [${RESET}"
    for i in {1..30}; do
        echo -e -n "${BRIGHT_PURPLE}█${RESET}"
        sleep 0.012
    done
    echo -e "${NEON_BLUE}] ${GREEN}100% AWAKENED${RESET}"
    echo -e "${YELLOW}💬 [System]: 'Arise, NightLord.' Your absolute domain is fully active.${RESET}"
    sleep 0.9
}

# ==========================
# ⚡ ADVANCED SYSTEM LOADING WITH "SYSTEM" BANNER
# ==========================
system_load() {
    local msg="$1"
    clear
    echo -e "${BRIGHT_PURPLE}${BOLD}"
    echo "    ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗"
    echo "    ██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║"
    echo "    ███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║"
    echo "    ╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║"
    echo "    ███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║"
    echo "    ╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝"
    echo -e "${RESET}"
    echo -e "    ${NEON_BLUE}⚡ SUB-ROUTINE: ${WHITE}${msg}${RESET}"
    echo -e "${BRIGHT_PURPLE}    ──────────────────────────────────────────────────────────${RESET}"
    
    local spin=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')
    echo -ne "    ${GRAY}Channeling Mana Matrix: [${RESET}"
    for i in {1..24}; do
        echo -ne "${NEON_BLUE}▒${RESET}"
        echo -ne "\b${spin[$((i%10))]}"
        sleep 0.02
        echo -ne "\b${BRIGHT_PURPLE}█${RESET}"
    done
    echo -e "${GRAY}] ${GREEN}100% SUCCESS${RESET}"
    sleep 0.3
}

# ==========================
# 👁️ MONARCH HUD HEADER
# ==========================
header() {
    clear
    local cpu_use=$(top -bn1 | grep load | awk '{printf "%.2f%%", $(NF-2)}' 2>/dev/null || echo "0.00%")
    local mem_use=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }' 2>/dev/null || echo "0.00%")
    
    echo -e "${BRIGHT_PURPLE}"
    echo "╔══════════════════════════════════════════════════════════════════╗"
    echo "║         ⚔️ SHADOW MONARCH SUPREME DASHBOARD ${VERSION} ⚔️          ║"
    echo "╠══════════════════════════════════════════════════════════════════╣"
    echo -e "║ ${NEON_BLUE}👑 Monarch:${RESET} ${BRIGHT_PURPLE}NightLord${BRIGHT_PURPLE}    │ ${NEON_BLUE}🌐 Loader:${RESET}  ${GREEN}$(echo $LOADER | tr '[:lower:]' '[:upper:]')${BRIGHT_PURPLE}"
    echo -e "║ ${NEON_BLUE}⚡ Mana(RAM):${RESET} ${GREEN}${RAM}${BRIGHT_PURPLE}        │ ${NEON_BLUE}📂 Dir:${RESET}     ${WHITE}${MC_DIR}${BRIGHT_PURPLE}"
    echo -e "║ ${NEON_BLUE}⚙️ CPU Load:${RESET}  ${YELLOW}${cpu_use}${BRIGHT_PURPLE}        │ ${NEON_BLUE}💾 Mem Use:${RESET} ${YELLOW}${mem_use}${BRIGHT_PURPLE}"
    echo "╚══════════════════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
}

# ==========================
# 🛑 PAUSE SCREEN
# ==========================
pause() {
    echo -e "\n${GRAY}──────────────────────────────────────────────────────────────────${RESET}"
    echo -e " ${BRIGHT_PURPLE}❖ Press ENTER to return to the Sovereign Domain...${RESET}"
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
# 🌐 ULTIMATE GATE SELECTOR
# ==========================
version_selector() {
    while true; do
        header
        echo -e "${BRIGHT_PURPLE} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${BRIGHT_PURPLE} ║${RESET}           ${WHITE}[ SELECT SERVER CORE (THE GATE) ]${RESET}                ${BRIGHT_PURPLE}║${RESET}"
        echo -e "${BRIGHT_PURPLE} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo -e "  ${GRAY}Supported explicit versions: 1.21.11, 1.21.1, 1.20.4, etc.${RESET}\n"
        
        echo -e "  ${NEON_BLUE}[ 1 ]${RESET} 🔥 PaperMC    ${GRAY}(Optimization & Plugins)${RESET}"
        echo -e "  ${NEON_BLUE}[ 2 ]${RESET} ⚡ PurpurMC   ${GRAY}(High Config & Plugins)${RESET}"
        echo -e "  ${NEON_BLUE}[ 3 ]${RESET} ⚙️ FabricMC   ${GRAY}(Modern Mods & Performance)${RESET}"
        echo -e "  ${NEON_BLUE}[ 4 ]${RESET} 🛠️ ForgeMC    ${GRAY}(Classic Heavy Mods)${RESET}"
        echo -e "  ${NEON_BLUE}[ 5 ]${RESET} 🔗 Custom URL ${GRAY}(Direct Jar Link)${RESET}"
        echo -e "  ${RED}[ 0 ] ⬅ Return${RESET}"
        echo
        echo -ne "${BRIGHT_PURPLE}  nightlord@gate-matrix:~# ${RESET}"
        read v_choice

        case $v_choice in
        1) 
            system_load "Accessing PaperMC Database..."
            echo -ne "${NEON_BLUE}  Enter Paper Version (e.g., 1.21.11, 1.21.1): ${RESET}"
            read MC_VER
            system_load "Fetching PaperMC API for $MC_VER..."
            LATEST_BUILD=$(curl -s "https://api.papermc.io/v2/projects/paper/versions/${MC_VER}" | grep -o '"builds":\[[^]]*\]' | grep -o '[0-9]*' | tail -n 1)
            if [ -z "$LATEST_BUILD" ]; then echo -e "${RED}❌ Version not found!${RESET}"; sleep 2; continue; fi
            DOWNLOAD_URL="https://api.papermc.io/v2/projects/paper/versions/${MC_VER}/builds/${LATEST_BUILD}/downloads/paper-${MC_VER}-${LATEST_BUILD}.jar"
            LOADER="paper"; break ;;
        2) 
            system_load "Accessing PurpurMC Database..."
            echo -ne "${NEON_BLUE}  Enter Purpur Version (e.g., 1.21.11, 1.21.1): ${RESET}"
            read MC_VER
            system_load "Fetching PurpurMC API for $MC_VER..."
            DOWNLOAD_URL="https://api.purpurmc.org/v2/purpur/${MC_VER}/latest/download"
            LOADER="paper"; break ;;
        3)
            system_load "Accessing FabricMC Database..."
            echo -ne "${NEON_BLUE}  Enter Fabric Version (e.g., 1.21.11, 1.21.1): ${RESET}"
            read MC_VER
            system_load "Generating Fabric Installer for $MC_VER..."
            DOWNLOAD_URL="https://meta.fabricmc.net/v2/versions/loader/${MC_VER}/0.16.5/1.0.1/server/jar"
            LOADER="fabric"; break ;;
        4)
            system_load "Accessing Forge Setup..."
            echo -e "${YELLOW}  ⚠️ Forge requires manual direct link installation via CLI usually.${RESET}"
            echo -ne "${NEON_BLUE}  Paste Forge Installer URL: ${RESET}"
            read DOWNLOAD_URL
            LOADER="forge"; break ;;
        5)
            system_load "Accessing Custom Core Link..."
            echo -ne "${NEON_BLUE}  Paste Custom Direct Jar URL: ${RESET}"
            read DOWNLOAD_URL
            echo -ne "${NEON_BLUE}  Select Loader Type (paper/fabric/forge): ${RESET}"
            read LOADER
            [ -z "$LOADER" ] && LOADER="paper"; break ;;
        0) system_load "Returning to Main Command Hub..."; return 1 ;;
        *) echo -e "${RED}  Invalid Gateway!${RESET}"; sleep 1 ;;
        esac
    done
    
    echo "LOADER=\"$LOADER\"" >> "$CONFIG_FILE"
    update_loader_dirs
    return 0
}

# ==========================
# 🏰 GATE SETUP
# ==========================
setup_server() {
    version_selector
    if [ $? -eq 1 ]; then return; fi

    system_load "Materializing Server Core in Real World..."
    header
    mkdir -p "$MC_DIR"
    cd "$MC_DIR" || return

    echo -e "${NEON_BLUE} ❖ Downloading Engine from the Matrix...${RESET}"
    curl -L -o server.jar "$DOWNLOAD_URL"

    if [ $? -ne 0 ] || [ ! -s server.jar ]; then
        echo -e "${RED} ❌ Gate Collapse! Download failed.${RESET}"
        rm -f server.jar; pause; return
    fi

    echo "eula=true" > eula.txt
    mkdir -p "$MOD_DIR"

    echo -e "\n${GREEN} ✔ Gate Conquered! Server core established & EULA signed.${RESET}"
    pause
}

# ==========================
# 🎮 AWAKEN SERVER
# ==========================
run_server() {
    system_load "Igniting Server Runtime Engine..."
    header
    cd "$MC_DIR" || return

    if [ ! -f "server.jar" ]; then
        echo -e "${RED} ❌ No server core found! Setup a server first.${RESET}"
        pause; return
    fi

    echo -e "${BRIGHT_PURPLE} 💬 [System]: 'Arise.' Initializing server runtime...${RESET}"
    echo -e "${GRAY} Current Power Flags: $JAVA_FLAGS${RESET}"
    echo -e "${GRAY}──────────────────────────────────────────────────────────────────${RESET}\n"
    java $JAVA_FLAGS -jar server.jar nogui
    pause
}

# ==========================
# 🔌 SHADOW SOLDIER PLUGINS
# ==========================
plugin_manager() {
    while true; do
        header
        echo -e "${BRIGHT_PURPLE} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${BRIGHT_PURPLE} ║${RESET}         ${WHITE}[ SHADOW SOLDIERS (PLUGINS/MODS HUB) ]${RESET}           ${BRIGHT_PURPLE}║${RESET}"
        echo -e "${BRIGHT_PURPLE} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${NEON_BLUE}[ 1 ]${RESET} 🔎 Search & Download Mod/Plugin ${GRAY}(via Modrinth)${RESET}"
        echo -e "  ${NEON_BLUE}[ 2 ]${RESET} 📦 View Installed Files in $(basename "$MOD_DIR")"
        echo -e "  ${RED}[ 0 ] ⬅ Return${RESET}"
        echo
        echo -ne "${BRIGHT_PURPLE}  nightlord@plugins:~# ${RESET}"
        read p_choice

        case $p_choice in
        1) 
            system_load "Accessing Modrinth Search Protocol..."
            echo -ne "${NEON_BLUE} Enter Mod/Plugin name: ${RESET}"
            read query
            [[ -z "$query" ]] && continue
            
            system_load "Searching Modrinth Database..."
            echo -e "${YELLOW} To maintain script speed, open this link to find your direct JAR:${RESET}"
            echo -e "${WHITE} https://modrinth.com/plugins?q=${query}&g=1.21.1${RESET}"
            echo -e "\n${NEON_BLUE} Paste the direct .jar download link here (or press Enter to cancel):${RESET}"
            read plug_url
            if [[ -n "$plug_url" ]]; then
                system_load "Downloading Shadow Component..."
                cd "$MOD_DIR" || continue
                wget --content-disposition "$plug_url"
                echo -e "${GREEN} ✔ Component Awakened!${RESET}"
            fi
            pause
            ;;
        2)
            system_load "Reading Installed Components..."
            echo -e "${NEON_BLUE} Installed Components:${RESET}"
            ls -lh "$MOD_DIR" | awk '{print $5, $9}' | grep "\.jar"
            pause
            ;;
        0) system_load "Returning to Command Center..."; break ;;
        esac
    done
}

# ==========================
# 🛠️ TOOLS & UTILITIES HUB
# ==========================
tools_menu_sub() {
    system_load "Accessing God-Tier Utilities..."
    while true; do
        header
        echo -e "${BRIGHT_PURPLE} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${BRIGHT_PURPLE} ║${RESET}                ${WHITE}[ MONARCH UTILITIES HUB ]${RESET}                   ${BRIGHT_PURPLE}║${RESET}"
        echo -e "${BRIGHT_PURPLE} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${NEON_BLUE}[ 1 ]${RESET} 🧹 Purge Server Logs/Cache"
        echo -e "  ${NEON_BLUE}[ 2 ]${RESET} ⚠️ Wipe World Data ${GRAY}(Hard Reset)${RESET}"
        echo -e "  ${NEON_BLUE}[ 3 ]${RESET} 🔄 Deploy 24/7 Infinite Daemon"
        echo -e "  ${NEON_BLUE}[ 4 ]${RESET} 🌐 Configure PlayIt.gg Tunnel"
        echo -e "  ${RED}[ 0 ] ⬅ Return${RESET}"
        echo
        echo -ne "${BRIGHT_PURPLE}  nightlord@tools-hub:~# ${RESET}"
        read t_choice

        case $t_choice in
        1) 
            system_load "Cleansing Server Logs & Cache..."
            rm -rf "$MC_DIR/logs" "$MC_DIR/cache" 2>/dev/null
            echo -e "${GREEN}✔ Domain Cleansed!${RESET}"; pause ;;
        2) 
            system_load "Preparing World Wipe Protocol..."
            echo -ne "${RED}Wipe World? (y/n): ${RESET}"; read w_conf
            if [[ "$w_conf" == "y" ]]; then 
                system_load "Erasing World Dimensions..."
                rm -rf "$WORLD_DIR" "$MC_DIR/world_nether" "$MC_DIR/world_the_end"
                echo -e "${GREEN}✔ World Erased!${RESET}"
            fi
            pause ;;
        3) 
            system_load "Spawning Eternal Daemon..."
            echo -e "${YELLOW}Spawning Daemon...${RESET}"; pause ;;
        4) 
            system_load "Accessing Tunnel Configuration..."
            echo -e "${YELLOW}Deploying Tunnel...${RESET}"; pause ;;
        0) system_load "Returning to Command Center..."; break ;;
        esac
    done
}

# ==========================
# 🎮 COMMAND & BUILD CENTER
# ==========================
mc_cb_menu() {
    system_load "Initializing Command & Build Center..."
    while true; do
        header
        echo -e "${NEON_BLUE}                🔥 WHAT IS YOUR COMMAND? 🔥               ${RESET}"
        echo -e "${GRAY}──────────────────────────────────────────────────────────────────${RESET}"
        
        echo -e "  ${NEON_BLUE}[ 1 ]${RESET} 🚀 Establish Gate ${GRAY}(Setup Paper/Fabric/Forge 1.21.x)${RESET}"
        echo -e "  ${NEON_BLUE}[ 2 ]${RESET} 🎮 Awaken Server ${GRAY}(Start Engine)${RESET}"
        echo -e "  ${NEON_BLUE}[ 3 ]${RESET} ⚡ Adjust Mana Core ${GRAY}(Change RAM Limit)${RESET}"
        echo -e "  ${NEON_BLUE}[ 4 ]${RESET} 🔌 Manage Shadow Soldiers ${GRAY}(Mods/Plugins)${RESET}"
        echo -e "  ${NEON_BLUE}[ 5 ]${RESET} 🛠️ Monarch Tools & Utilities"
        echo ""
        echo -e "  ${RED}[ 0 ] ⬅ Back to Main System${RESET}"
        echo -e "${GRAY}──────────────────────────────────────────────────────────────────${RESET}"
        echo -ne "${BRIGHT_PURPLE}  nightlord@shadow-monarch:~# ${RESET}"
        read main_choice

        case $main_choice in
        1) setup_server ;;
        2) run_server ;;
        3) 
           system_load "Accessing Mana Core Adjustment..."
           echo -ne "${NEON_BLUE}  Enter new Mana limit (e.g., 4096M, 8192M): ${RESET}"
           read RAM
           echo "RAM=\"$RAM\"" > "$CONFIG_FILE"
           JAVA_FLAGS="-Xms${RAM} -Xmx${RAM}"
           system_load "Recalibrating Mana Cores to $RAM"
           ;;
        4) plugin_manager ;;
        5) tools_menu_sub ;;
        0) system_load "Returning to Sovereign Main Domain..."; break ;;
        *)
           echo -e "${RED}  Invalid Command Structure!${RESET}"
           sleep 1
           ;;
        esac
    done
}

# ==========================
# ⚙️ STATUS STATS / SETTINGS
# ==========================
settings() {
    system_load "Accessing Status & RAM Manager..."
    while true; do
        header
        echo -e "${BRIGHT_PURPLE} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${BRIGHT_PURPLE} ║${RESET}                ${WHITE}[ STATUS & RAM MANAGER ]${RESET}                  ${BRIGHT_PURPLE}║${RESET}"
        echo -e "${BRIGHT_PURPLE} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${NEON_BLUE}[1]${RESET} Auto-Detect Stat Cap ${GRAY}(Smart RAM Optimize)${RESET}"
        echo -e "  ${NEON_BLUE}[2]${RESET} Allocate Custom Stat Power ${GRAY}(Custom RAM)${RESET}"
        echo -e "  ${NEON_BLUE}[3]${RESET} View Current Monarch Profile"
        echo -e "  ${RED}[0] Back to Main System${RESET}"
        echo
        echo -ne "${BRIGHT_PURPLE}  nightlord@status-mgr:~# ${RESET}"
        read s

        case $s in
        1)
            system_load "Detecting System Memory..."
            detect_ram
            echo -e "${GREEN} ✔ Status synchronized for NightLord! Maximum RAM assigned: $RAM${RESET}"
            pause
            ;;
        2)
            system_load "Opening Custom Power Allocation..."
            echo -ne "${NEON_BLUE} Enter custom power capacity for NightLord (e.g., 4096M, 8192M): ${RESET}"
            read RAM
            echo "RAM=\"$RAM\"" > "$CONFIG_FILE"
            JAVA_FLAGS="-Xms${RAM} -Xmx${RAM}"
            system_load "Recalibrating Power Matrix..."
            echo -e "${GREEN} ✔ Power successfully recalibrated to $RAM${RESET}"
            pause
            ;;
        3)
            system_load "Retrieving Monarch Profile..."
            echo -e "${NEON_BLUE} Monarch Profile Details:${RESET}"
            echo -e "${GRAY} ──────────────────────────────────────────────────────────────${RESET}"
            echo -e "  Monarch Name        : ${BRIGHT_PURPLE}NightLord${RESET}"
            echo -e "  Assigned RAM Power  : ${GREEN}$RAM${RESET}"
            echo -e "  Java Execution Flag : ${GREEN}$JAVA_FLAGS${RESET}"
            echo -e "  System Config Path  : ${GREEN}$CONFIG_FILE${RESET}"
            echo -e "${GRAY} ──────────────────────────────────────────────────────────────${RESET}"
            pause
            ;;
        0) system_load "Returning to Sovereign Main Domain..."; break ;;
        *) echo -e "${RED} Invalid Stat Choice!${RESET}"; sleep 1 ;;
        esac
    done
}

# ==========================
# 🔄 24/7 ETERNAL DUNGEON HOST
# ==========================
host_24_7() {
    system_load "Initializing Infinite Dungeon Daemon..."
    header
    echo -e "${GREEN} 🔄 Opening NightLord's Infinite Dungeon Daemon (24/7 Host)...${RESET}"
    sleep 1
    while true; do
        curl -fsSL "https://raw.githubusercontent.com/NightLord-pro/NightLordNotTools/refs/heads/main/24-7" | python3
        echo -e "${YELLOW} ⚠️ NightLord's dungeon gate flickered. Reopening connection in 3s...${RESET}"
        sleep 3
    done
}

# ==========================
# 🌐 PLAYIT TUNNEL AGENT
# ==========================
playit_setup() {
    system_load "Deploying Playit Tunneling Gate..."
    header
    echo -e "${GREEN} 🌐 Deploying Playit Tunneling Gate for NightLord...${RESET}"
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
    system_load "Initiating Cloudflared Setup..."
    clear
    echo -e "${NEON_BLUE}┌────────────────────────────────────┐"
    echo -e "│      Installing Cloudflared       │"
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
        echo -e "${NEON_BLUE}→ Removing old service...${NC}"
        sudo cloudflared service uninstall
        echo -e "${GREEN}✔ Old service removed${NC}"
        echo ""
    fi

    echo -e "${NEON_BLUE}🔑 Paste Cloudflare Tunnel token"
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

    echo -e "${NEON_BLUE}🚀 Installing Cloudflared service...${NC}"
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
    system_load "Preparing Cloudflared Removal..."
    clear
    echo -e "${NEON_BLUE}┌────────────────────────────────────┐"
    echo -e "│      Uninstalling Cloudflared     │"
    echo -e "└────────────────────────────────────${NC}"

    sudo cloudflared service uninstall 2>/dev/null
    sudo apt remove -y cloudflared
    sudo rm -f /etc/apt/sources.list.d/cloudflared.list
    sudo rm -f /usr/share/keyrings/cloudflare-main.gpg

    echo -e "${GREEN}✔ Cloudflared completely removed${NC}"
    pause
}

cloudflared_menu() {
    system_load "Accessing Cloudflared Manager..."
    while true; do
        header
        arch=$(uname -m)
        if systemctl is-active --quiet cloudflared 2>/dev/null; then
            s_status="${GREEN}ONLINE${NC}"
            s_pid=$(pgrep -u root -f cloudflared | head -n 1)
            [ -z "$s_pid" ] && s_pid="Active"
            s_uptime=$(systemctl show cloudflared --property=ActiveEnterTimestamp --value 2>/dev/null)
            [ -z "$s_uptime" ] && s_uptime="Running"
        else
            s_status="${RED}OFFLINE${NC}"
            s_pid="None"
            s_uptime="Gate Closed"
        fi

        echo -e "${BRIGHT_PURPLE} ╔════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${BRIGHT_PURPLE} ║${NC}             ${WHITE}[ SYSTEM: SHADOW MONARCH TUNNEL ]${NC}              ${BRIGHT_PURPLE}║${NC}"
        echo -e "${BRIGHT_PURPLE} ╚════════════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -e "${NEON_BLUE}  GATE STATUS ${GRAY}───────────────────────────────────────────${NC}"
        echo -e "  ${BRIGHT_PURPLE}◆${NC} Architecture : ${WHITE}$arch${NC}"
        echo -e "  ${BRIGHT_PURPLE}◆${NC} Monarch Stat : $s_status"
        echo -e "  ${BRIGHT_PURPLE}◆${NC} Shadow ID    : $s_pid"
        echo -e "  ${BRIGHT_PURPLE}◆${NC} Gate Open    : ${NEON_BLUE}$s_uptime${NC}"
        echo -e "${GRAY} ────────────────────────────────────────────────────────────${NC}"
        echo ""
        echo -e "  ${NEON_BLUE}[1]${NC} 🚀 Install / Setup Tunnel"
        echo -e "  ${RED}[2]${NC} 🗑️ Uninstall Completely"
        echo -e "  ${RED}[0]${NC} ⬅ Return to Tools Menu"
        echo ""
        echo -ne "${BRIGHT_PURPLE}  nightlord@tunnel-hub:~# ${NC}"
        read choice

        case $choice in
            1) install_cloudflared ;;
            2) uninstall_cloudflared ;;
            0) system_load "Returning to Tools Menu..."; break ;;
            *) echo -e "${RED}Invalid option!${NC}"; sleep 1 ;;
        esac
    done
}

# ==========================
# 🛠️ TOOLS HUB MENU
# ==========================
tools_menu() {
    system_load "Initializing Tools & Network Hub..."
    while true; do
        header
        echo -e "${BRIGHT_PURPLE}${BOLD}"
        echo "   ████████╗ ██████╗  ██████╗ ██╗     ███████╗"
        echo "   ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝"
        echo "      ██║   ██║   ██║██║   ██║██║     ███████╗"
        echo "      ██║   ██║   ██║██║   ██║██║     ╚════██║"
        echo "      ██║   ╚██████╔╝╚██████╔╝███████╗███████║"
        echo "      ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝"
        echo -e "${RESET}"
        echo -e "${NEON_BLUE}               MADE BY NIGHTLORD               ${RESET}"
        echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
        echo
        echo -e "  ${NEON_BLUE}[1]${RESET} 🔄 Infinite Dungeon Host ${GRAY}(24/7 Host)${RESET}"
        echo -e "  ${NEON_BLUE}[2]${RESET} 🌐 Playit Tunnel Setup"
        echo -e "  ${NEON_BLUE}[3]${RESET} ☁️ Cloudflared Manager"
        echo -e "  ${RED}[0]${RESET} ⬅ Back to Main System"
        echo
        echo -ne "${BRIGHT_PURPLE}  nightlord@tools-hub:~# ${RESET}"
        read tool_choice

        case $tool_choice in
        1) host_24_7 ;;
        2) playit_setup ;;
        3) cloudflared_menu ;;
        0) system_load "Returning to Sovereign Main Domain..."; break ;;
        *) echo -e "${RED} Invalid Option!${NC}"; sleep 1 ;;
        esac
    done
}

# ==========================
# 🪽 WINGS INSTALLER
# ==========================
wings_setup() {
    system_load "Initializing Pterodactyl Wings Suite..."
    header
    echo -e "${GREEN} 🪽 Initializing Pterodactyl Wings installation suite for NightLord...${RESET}"
    cd "$WORK_DIR"
    bash <(curl -s https://raw.githubusercontent.com/nobita586/Nobita-Hosting/main/cd/wing.sh)
    pause
}

# ==========================
# 📋 BLUEPRINT / EXTENSIONS SETUP (PETROTOOLS)
# ==========================
blueprint_setup() {
    system_load "Initializing Blueprint Framework Suite..."
    while true; do
        clear
        if command -v blueprint >/dev/null 2>&1; then
            status="${GREEN}● ONLINE${RESET}"
            installed=true
        else
            status="${RED}● OFFLINE${RESET}"
            installed=false
        fi

        echo -e "${BRIGHT_PURPLE}${BOLD}"
        echo "   ██████╗ ██╗     ██╗   ██╗███████╗██████╗"
        echo "   ██╔══██╗██║     ██║   ██║██╔════╝██╔══██╗"
        echo "   ██████╔╝██║     ██║   ██║█████╗  ██████╔╝"
        echo "   ██╔══██╗██║     ██║   ██║██╔══╝  ██╔═══╝"
        echo "   ██████╔╝███████╗╚██████╔╝███████╗██║"
        echo "   ╚═════╝ ╚══════╝ ╚═════╝ ╚══════╝╚═╝"
        echo -e "${RESET}"
        echo -e "${NEON_BLUE}               MADE BY NIGHTLORD               ${RESET}"
        echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
        echo
        echo -e "   ${NEON_BLUE}BLUEPRINT FRAMEWORK${RESET}"
        echo -e "   Status : $status"
        echo ""

        if [ "$installed" = false ]; then
            echo -e "   ${NEON_BLUE}[1]${RESET} ${GREEN}Install Framework${RESET}"
            echo -e "   ${RED}[0] Back${RESET}"
        else
            echo -e "   ${NEON_BLUE}[1]${RESET} ${GREEN}Reinstall Framework${RESET}"
            echo -e "   ${NEON_BLUE}[2]${RESET} ${GREEN}Update Framework${RESET}"
            echo -e "   ${NEON_BLUE}[3]${RESET} ${GREEN}Info${RESET}"
            echo -e "   ${NEON_BLUE}[4]${RESET} ${GREEN}Version${RESET}"
            echo -e "   ${NEON_BLUE}[5]${RESET} ${RED}Uninstall Framework${RESET}"
            echo -e "   ${RED}[0] Back${RESET}"
        fi

        echo ""
        echo -ne "${BRIGHT_PURPLE}  nightlord@blueprint:~# ${RESET}"
        read bp

        case $bp in
            1)
                system_load "Processing Blueprint Core..."
                if [ "$installed" = false ]; then
                    echo -e "${NEON_BLUE}Installing...${RESET}"
                    rm -f /etc/apt/keyrings/nodesource.gpg 2>/dev/null
                    yes | bash <(curl -s https://raw.githubusercontent.com/nobita329/Nobita-Cloud/refs/heads/main/thame/install.sh)
                else
                    yes | blueprint -rerun-install
                fi
                pause
                ;;
            2) system_load "Upgrading Blueprint..."; yes | blueprint -upgrade; pause ;;
            3) system_load "Fetching Blueprint Info..."; blueprint -info; pause ;;
            4) blueprint -version; pause ;;
            5)
                system_load "Executing Blueprint Deletion..."
                echo -e "${RED}Uninstalling Blueprint Framework + Extensions...${RESET}"
                path=$(which blueprint 2>/dev/null)
                if [ -n "$path" ]; then
                    systemctl stop pterodactyl-queue 2>/dev/null || true
                    rm -f "$path"
                    rm -rf ~/.blueprint ~/.config/blueprint /var/www/pterodactyl/.blueprint /var/www/pterodactyl/app/BlueprintFramework /var/www/pterodactyl/extensions /etc/blueprint /etc/systemd/system/blueprint* /etc/systemd/system/pteroq.service 2>/dev/null
                    echo -e "${GREEN}Fully uninstalled ✔${RESET}"
                else
                    echo -e "${RED}Not installed ❌${RESET}"
                fi
                pause
                ;;
            0) system_load "Returning to Petrotools..."; break ;;
            *) echo -e "${RED}Invalid option${RESET}"; sleep 1 ;;
        esac
    done
}

# ==========================
# 🎨 THEME & EXTENSIONS UI MENU (PETROTOOLS)
# ==========================
petro_tools_menu() {
    system_load "Accessing PetroTools Menu..."
    while true; do
        header
        echo -e "${BRIGHT_PURPLE}${BOLD}"
        echo "   ██████╗ ███████╗████████╗██████╗  ██████╗      ████████╗"
        echo "   ██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗     ╚══██╔══╝"
        echo "   ██████╔╝█████╗     ██║   ██████╔╝██║   ██║        ██║   "
        echo "   ██╔═══╝ ██╔══╝     ██║   ██╔══██╗██║   ██║        ██║   "
        echo "   ██║     ███████╗   ██║   ██║  ██║╚██████╔╝        ██║   "
        echo "   ╚═════╝ ╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝         ╚═╝   "
        echo -e "${RESET}"
        echo -e "${NEON_BLUE}               MADE BY NIGHTLORD               ${RESET}"
        echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
        echo
        echo -e "  ${NEON_BLUE}[1]${RESET} 📋 BLUEPRINT"
        echo -e "  ${NEON_BLUE}[2]${RESET} 🧩 EXTENSIONS"
        echo -e "  ${NEON_BLUE}[3]${RESET} 🎨 THEMES"
        echo -e "  ${RED}[0]${RESET} ⬅ Back to Main System"
        echo
        echo -ne "${BRIGHT_PURPLE}  nightlord@petrotools:~# ${RESET}"
        read pt_choice

        case $pt_choice in
        1) blueprint_setup ;;
        2) system_load "Loading Extensions Menu..."; echo -e "${YELLOW}Extensions menu active.${RESET}"; pause ;;
        3) system_load "Loading Themes Menu..."; echo -e "${YELLOW}Themes menu active.${RESET}"; pause ;;
        0) system_load "Returning to Sovereign Main Domain..."; break ;;
        *) echo -e "${RED} Invalid Option!${NC}"; sleep 1 ;;
        esac
    done
}

# ==========================
# ⚡ PANELS INSTALLER HUB
# ==========================
panels_menu() {
    system_load "Accessing Panels Installer Hub..."
    while true; do
        header
        echo -e "${BRIGHT_PURPLE} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${BRIGHT_PURPLE} ║${RESET}            ${WHITE}[ SHADOW MONARCH PANELS HUB ]${RESET}              ${BRIGHT_PURPLE}║${RESET}"
        echo -e "${BRIGHT_PURPLE} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${NEON_BLUE}[1]${RESET} 🚀 NTH ${GRAY}(NTH MY OWN PANEL - Installed via Official Script)${RESET}"
        echo -e "  ${NEON_BLUE}[2]${RESET} ⚡ jtg ${GRAY}(JishnuTheGamer Panel Suite)${RESET}"
        echo -e "  ${NEON_BLUE}[3]${RESET} 🛡️ Pterodactyl Panel Suite"
        echo -e "  ${RED}[0] ⬅ Back to Main System${RESET}"
        echo
        echo -ne "${BRIGHT_PURPLE}  nightlord@panels-hub:~# ${RESET}"
        read panel_choice

        case $panel_choice in
        1)
            system_load "Deploying NTH Panel Suite..."
            echo -e "${GREEN} 🚀 Initializing NTH installation suite...${RESET}"
            cd "$WORK_DIR"
            bash <(curl -s https://raw.githubusercontent.com/NightLord-pro/NTH/refs/heads/main/install.sh)
            pause
            ;;
        2)
            system_load "Deploying JishnuTheGamer Suite..."
            echo -e "${GREEN} 🚀 Initializing jtg installation suite...${RESET}"
            cd "$WORK_DIR"
            bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/Jtg/refs/heads/main/install.sh)
            pause
            ;;
        3)
            system_load "Deploying Pterodactyl Panel Suite..."
            echo -e "${GREEN} ⚡ Initializing Pterodactyl installation suite...${RESET}"
            cd "$WORK_DIR"
            bash <(curl -s https://raw.githubusercontent.com/NightLord-pro/NightLordNotTools/refs/heads/main/Petroldectal%20Create)
            pause
            ;;
        0) system_load "Returning to Sovereign Main Domain..."; break ;;
        *) echo -e "${RED} Invalid Panel Choice!${NC}"; sleep 1 ;;
        esac
    done
}

# ==========================
# 🎬 SYSTEM MAIN ENTRY POINT
# ==========================
system_awakening

while true; do
    header

    echo -e "${BRIGHT_PURPLE}${BOLD}"
    echo "  ███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗"
    echo "  ████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝"
    echo "  ██╔██╗ ██║██║██║  ███╗███████║   ██║   "
    echo "  ██║╚██╗██║██║██║   ██║██╔══██║   ██║   "
    echo "  ██║ ╚████║██║╚██████╔╝██║  ██║   ██║   "
    echo "  ╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   "
    echo -e "${RESET}"
    echo -e "${NEON_BLUE}                👑 NIGHTLORD SUPREME DOMAIN 👑               ${RESET}"
    echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"

    echo -e "${BRIGHT_PURPLE} ══ 🌟 NIGHTLORD'S SHADOW MONARCH DASHBOARD v12.9 ══${RESET}"
    
    echo ""
    printf "  \033[1;36m[1]\033[0m ⚔️ Command & Build Center       \033[1;36m[4]\033[0m ⚡ Panels Installer Hub\n"
    echo ""
    printf "  \033[1;36m[2]\033[0m ⚙️ Status & RAM Manager        \033[1;36m[3]\033[0m 🪽 Install Wings (Daemon)\n"
    echo ""
    printf "  \033[1;36m[3]\033[0m 🛠️ TOOLS                       \033[1;36m[6]\033[0m 🛠️ PETRO_T\n"
    echo ""
    echo -e "${NEON_BLUE}                MADE BY NIGHTLORD               ${RESET}"
    echo ""
    printf "  \033[1;31m[0]\033[0m ❌ Close System / Log Out\n"
    echo ""
    
    echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
    echo
    echo -ne "${BRIGHT_PURPLE}  nightlord@shadow-monarch:~# ${RESET}"
    read main_choice

    case $main_choice in
    1) mc_cb_menu ;;
    2) settings ;;
    3) tools_menu ;;
    4) panels_menu ;;
    5) wings_setup ;;
    6) petro_tools_menu ;;
    0)
       system_load "Shutting Down Shadow Protocol..."
       clear
       echo -e "${BRIGHT_PURPLE} 💬 [System]: Logging out, Sovereign Monarch NightLord. Rise again when you are ready. 🌙${RESET}"
       exit 0
       ;;
    *)
       echo -e "${RED} Invalid System Command!${RESET}"
       sleep 1
       ;;
    esac
done
