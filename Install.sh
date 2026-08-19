#!/bin/bash

# ==========================================================
#   ⚔️ SOLO LEVELING: SHADOW MONARCH SYSTEM v12.0 ⚔️
#   [Creator: NightLord | Universal Gate Matrix]
# ==========================================================

# 🎨 Monarch Color Palette & Aesthetics
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
BOLD="\033[1m"
RESET="\033[0m"

# 📂 System Paths & Globals
WORK_DIR="$(pwd)"
MC_DIR="$WORK_DIR/server"
WORLD_DIR="$MC_DIR/world"
BACKUP_DIR="$WORK_DIR/shadow_backups"
CONFIG_FILE="$HOME/.shadow_monarch.conf"
VERSION="v12.0 SUPREME"

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
# 🌌 CINEMATIC SYSTEM BOOT & LOADERS
# ==========================
system_load() {
    local msg="$1"
    clear
    echo -e "${PURPLE}"
    echo "    ╔══════════════════════════════════════════════════════════╗"
    echo -e "    ║  ${CYAN}⚡ SYSTEM PROCESS: ${WHITE}${msg}${PURPLE} "
    echo "    ╚══════════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
    
    # Custom Spinning & Progress Animation
    local spin=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')
    echo -ne "    ${GRAY}Channeling Mana: [${RESET}"
    for i in {1..20}; do
        echo -ne "${BRIGHT_PURPLE}▓${RESET}"
        # Spinner effect
        echo -ne "\b${spin[$((i%10))]}"
        sleep 0.03
        echo -ne "\b${BRIGHT_PURPLE}▓${RESET}"
    done
    echo -e "${GRAY}] ${GREEN}100% SUCCESS${RESET}"
    sleep 0.3
}

boot_sequence() {
    clear
    echo -e "${DEEP_PURPLE}Initializing Neural Link...${RESET}"
    sleep 0.2
    echo -e "${BRIGHT_PURPLE}Bypassing Earth's Gate Protocols...${RESET}"
    sleep 0.3
    echo -e "${CYAN}Verifying Monarch Credentials...${RESET}"
    sleep 0.4
    clear
    echo -e "${PURPLE}${BOLD}"
    echo "  ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗"
    echo "  ██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║"
    echo "  ███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║"
    echo "  ╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║"
    echo "  ███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║"
    echo "  ╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝"
    echo -e "${RESET}"
    echo -e "         ${CYAN}>>> WELCOME BACK, SOVEREIGN NIGHTLORD <<<${RESET}"
    echo -e "         ${GRAY}The shadows await your absolute command.${RESET}"
    echo
    sleep 1.2
}

# ==========================
# 📊 LIVE MONARCH HUD (Header)
# ==========================
header() {
    clear
    # Get live CPU/RAM stats
    local cpu_use=$(top -bn1 | grep load | awk '{printf "%.2f%%", $(NF-2)}')
    local mem_use=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')
    
    echo -e "${PURPLE}"
    echo "╔══════════════════════════════════════════════════════════════════╗"
    echo "║          ⚔️ SHADOW MONARCH SUPREME DASHBOARD ${VERSION} ⚔️           ║"
    echo "╠══════════════════════════════════════════════════════════════════╣"
    echo -e "║ ${CYAN}👑 Monarch:${RESET} ${BRIGHT_PURPLE}NightLord${PURPLE}      │ ${CYAN}🌐 Loader:${RESET}  ${GREEN}$(echo $LOADER | tr '[:lower:]' '[:upper:]')${PURPLE}"
    echo -e "║ ${CYAN}⚡ Mana(RAM):${RESET} ${GREEN}${RAM}${PURPLE}          │ ${CYAN}📂 Dir:${RESET}     ${WHITE}${MC_DIR}${PURPLE}"
    echo -e "║ ${CYAN}⚙️ CPU Load:${RESET}  ${YELLOW}${cpu_use}${PURPLE}          │ ${CYAN}💾 Mem Use:${RESET} ${YELLOW}${mem_use}${PURPLE}"
    echo "╚══════════════════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
}

pause() {
    echo -e "\n${GRAY}──────────────────────────────────────────────────────────────────${RESET}"
    echo -e " ${BRIGHT_PURPLE}❖ Press ENTER to continue commanding...${RESET}"
    read -r
}

# ==========================
# 🌐 ULTIMATE GATE SELECTOR (All Loaders & Versions)
# ==========================
version_selector() {
    while true; do
        header
        echo -e "${PURPLE} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${PURPLE} ║${RESET}           ${WHITE}[ SELECT SERVER CORE (THE GATE) ]${RESET}                ${PURPLE}║${RESET}"
        echo -e "${PURPLE} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo -e "  ${GRAY}Supported explicit versions: 1.21.11, 1.21.1, 1.20.4, etc.${RESET}\n"
        
        echo -e "  ${BRIGHT_PURPLE}[ 1 ]${RESET} 🔥 PaperMC    ${GRAY}(Optimization & Plugins)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[ 2 ]${RESET} ⚡ PurpurMC   ${GRAY}(High Config & Plugins)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[ 3 ]${RESET} ⚙️ FabricMC   ${GRAY}(Modern Mods & Performance)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[ 4 ]${RESET} 🛠️ ForgeMC    ${GRAY}(Classic Heavy Mods)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[ 5 ]${RESET} 🔗 Custom URL ${GRAY}(Direct Jar Link)${RESET}"
        echo -e "  ${RED}[ 0 ] ⬅ Return${RESET}"
        echo
        echo -ne "${PURPLE}  nightlord@gate-matrix:~# ${RESET}"
        read v_choice

        case $v_choice in
        1) 
            echo -ne "${CYAN}  Enter Paper Version (e.g., 1.21.11, 1.21.1): ${RESET}"
            read MC_VER
            system_load "Fetching PaperMC API for $MC_VER..."
            LATEST_BUILD=$(curl -s "https://api.papermc.io/v2/projects/paper/versions/${MC_VER}" | grep -o '"builds":\[[^]]*\]' | grep -o '[0-9]*' | tail -n 1)
            if [ -z "$LATEST_BUILD" ]; then echo -e "${RED}❌ Version not found!${RESET}"; sleep 2; continue; fi
            DOWNLOAD_URL="https://api.papermc.io/v2/projects/paper/versions/${MC_VER}/builds/${LATEST_BUILD}/downloads/paper-${MC_VER}-${LATEST_BUILD}.jar"
            LOADER="paper"; break ;;
        2) 
            echo -ne "${CYAN}  Enter Purpur Version (e.g., 1.21.11, 1.21.1): ${RESET}"
            read MC_VER
            system_load "Fetching PurpurMC API for $MC_VER..."
            DOWNLOAD_URL="https://api.purpurmc.org/v2/purpur/${MC_VER}/latest/download"
            LOADER="paper"; break ;;
        3)
            echo -ne "${CYAN}  Enter Fabric Version (e.g., 1.21.11, 1.21.1): ${RESET}"
            read MC_VER
            system_load "Generating Fabric Installer for $MC_VER..."
            # Uses Fabric Meta API to construct direct server jar URL
            DOWNLOAD_URL="https://meta.fabricmc.net/v2/versions/loader/${MC_VER}/0.16.5/1.0.1/server/jar"
            LOADER="fabric"; break ;;
        4)
            echo -e "${YELLOW}  ⚠️ Forge requires manual direct link installation via CLI usually.${RESET}"
            echo -ne "${CYAN}  Paste Forge Installer URL: ${RESET}"
            read DOWNLOAD_URL
            LOADER="forge"; break ;;
        5)
            echo -ne "${CYAN}  Paste Custom Direct Jar URL: ${RESET}"
            read DOWNLOAD_URL
            echo -ne "${CYAN}  Select Loader Type (paper/fabric/forge): ${RESET}"
            read LOADER
            [ -z "$LOADER" ] && LOADER="paper"; break ;;
        0) return 1 ;;
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

    echo -e "${CYAN} ❖ Downloading Engine from the Matrix...${RESET}"
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

    echo -e "${PURPLE} 💬 [System]: 'Arise.' Initializing server runtime...${RESET}"
    echo -e "${GRAY} Current Power Flags: $JAVA_FLAGS${RESET}"
    echo -e "${GRAY}──────────────────────────────────────────────────────────────────${RESET}\n"
    java $JAVA_FLAGS -jar server.jar nogui
    pause
}

# ==========================
# 🔌 SHADOW SOLDIER PLUGINS (Modrinth API integration)
# ==========================
plugin_manager() {
    while true; do
        header
        echo -e "${PURPLE} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${PURPLE} ║${RESET}         ${WHITE}[ SHADOW SOLDIERS (PLUGINS/MODS HUB) ]${RESET}           ${PURPLE}║${RESET}"
        echo -e "${PURPLE} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${BRIGHT_PURPLE}[ 1 ]${RESET} 🔎 Search & Download Mod/Plugin ${GRAY}(via Modrinth)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[ 2 ]${RESET} 📦 View Installed Files in $(basename "$MOD_DIR")"
        echo -e "  ${RED}[ 0 ] ⬅ Return${RESET}"
        echo
        echo -ne "${PURPLE}  nightlord@plugins:~# ${RESET}"
        read p_choice

        case $p_choice in
        1) 
            echo -ne "${CYAN} Enter Mod/Plugin name: ${RESET}"
            read query
            [[ -z "$query" ]] && continue
            
            system_load "Searching Modrinth Database..."
            # Quick open search in browser or curl API logic
            echo -e "${YELLOW} To maintain script speed, open this link to find your direct JAR:${RESET}"
            echo -e "${WHITE} https://modrinth.com/plugins?q=${query}&g=1.21.1${RESET}"
            echo -e "\n${CYAN} Paste the direct .jar download link here (or press Enter to cancel):${RESET}"
            read plug_url
            if [[ -n "$plug_url" ]]; then
                cd "$MOD_DIR" || continue
                wget --content-disposition "$plug_url"
                echo -e "${GREEN} ✔ Component Awakened!${RESET}"
            fi
            pause
            ;;
        2)
            echo -e "${CYAN} Installed Components:${RESET}"
            ls -lh "$MOD_DIR" | awk '{print $5, $9}' | grep "\.jar"
            pause
            ;;
        0) break ;;
        esac
    done
}

# ==========================
# 🛠️ TOOLS & UTILITIES HUB
# ==========================
tools_menu() {
    system_load "Accessing God-Tier Utilities..."
    while true; do
        header
        echo -e "${PURPLE} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${PURPLE} ║${RESET}                ${WHITE}[ MONARCH UTILITIES HUB ]${RESET}                   ${PURPLE}║${RESET}"
        echo -e "${PURPLE} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${BRIGHT_PURPLE}[ 1 ]${RESET} 🧹 Purge Server Logs/Cache"
        echo -e "  ${BRIGHT_PURPLE}[ 2 ]${RESET} ⚠️ Wipe World Data ${GRAY}(Hard Reset)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[ 3 ]${RESET} 🔄 Deploy 24/7 Infinite Daemon"
        echo -e "  ${BRIGHT_PURPLE}[ 4 ]${RESET} 🌐 Configure PlayIt.gg Tunnel"
        echo -e "  ${RED}[ 0 ] ⬅ Return${RESET}"
        echo
        echo -ne "${PURPLE}  nightlord@tools-hub:~# ${RESET}"
        read t_choice

        case $t_choice in
        1) 
            rm -rf "$MC_DIR/logs" "$MC_DIR/cache" 2>/dev/null
            echo -e "${GREEN}✔ Domain Cleansed!${RESET}"; pause ;;
        2) 
            echo -ne "${RED}Wipe World? (y/n): ${RESET}"; read w_conf
            if [[ "$w_conf" == "y" ]]; then rm -rf "$WORLD_DIR" "$MC_DIR/world_nether" "$MC_DIR/world_the_end"; echo -e "${GREEN}✔ World Erased!${RESET}"; fi
            pause ;;
        3) 
            echo -e "${YELLOW}Spawning Daemon...${RESET}"; pause ;;
        4) 
            echo -e "${YELLOW}Deploying Tunnel...${RESET}"; pause ;;
        0) break ;;
        esac
    done
}

# ==========================
# 🎬 SYSTEM MAIN ENTRY POINT
# ==========================
boot_sequence

while true; do
    header

    echo -e "${CYAN}                🔥 WHAT IS YOUR COMMAND? 🔥               ${RESET}"
    echo -e "${GRAY}──────────────────────────────────────────────────────────────────${RESET}"
    
    echo -e "  ${BRIGHT_PURPLE}[ 1 ]${RESET} 🚀 Establish Gate ${GRAY}(Setup Paper/Fabric/Forge 1.21.x)${RESET}"
    echo -e "  ${BRIGHT_PURPLE}[ 2 ]${RESET} 🎮 Awaken Server ${GRAY}(Start Engine)${RESET}"
    echo -e "  ${BRIGHT_PURPLE}[ 3 ]${RESET} ⚡ Adjust Mana Core ${GRAY}(Change RAM Limit)${RESET}"
    echo -e "  ${BRIGHT_PURPLE}[ 4 ]${RESET} 🔌 Manage Shadow Soldiers ${GRAY}(Mods/Plugins)${RESET}"
    echo -e "  ${BRIGHT_PURPLE}[ 5 ]${RESET} 🛠️ Monarch Tools & Utilities"
    echo ""
    echo -e "  ${RED}[ 0 ] 🛑 Disconnect System (Log Out)${RESET}"
    echo -e "${GRAY}──────────────────────────────────────────────────────────────────${RESET}"
    echo -ne "${PURPLE}  nightlord@shadow-monarch:~# ${RESET}"
    read main_choice

    case $main_choice in
    1) setup_server ;;
    2) run_server ;;
    3) 
       echo -ne "${CYAN}  Enter new Mana limit (e.g., 4096M, 8192M): ${RESET}"
       read RAM
       echo "RAM=\"$RAM\"" > "$CONFIG_FILE"
       JAVA_FLAGS="-Xms${RAM} -Xmx${RAM}"
       system_load "Recalibrating Mana Cores to $RAM"
       ;;
    4) plugin_manager ;;
    5) tools_menu ;;
    0)
       system_load "Saving State & Extracting Mind..."
       clear
       echo -e "${PURPLE} 💬 [System]: Logging out, Sovereign NightLord. Rise again when you are ready. 🌙${RESET}"
       exit 0
       ;;
    *)
       echo -e "${RED}  Invalid Command Structure!${RESET}"
       sleep 1
       ;;
    esac
done
