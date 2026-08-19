#!/bin/bash

# ==========================================================
#   ⚔️ SOLO LEVELING: SHADOW MONARCH SYSTEM v11.0 ELITE ⚔️
#   [Created by: NightLord | Universal Exit Protocol 0]
# ==========================================================

# Elite Aesthetic Styles & Color Palette
P_DARK="\033[38;5;54m"
P_MID="\033[38;5;93m"
PURPLE="\033[1;35m"
BRIGHT_PURPLE="\033[38;5;171m"
NEON_BLUE="\033[38;5;39m"
CYAN="\033[1;36m"
GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
WHITE="\033[1;37m"
GRAY="\033[38;5;242m"
DIM="\033[2m"
BOLD="\033[1m"
RESET="\033[0m"
NC="\033[0m"

# Paths & Settings
WORK_DIR="$(pwd)"
MC_DIR="$WORK_DIR/server"
PLUGIN_DIR="$MC_DIR/plugins"
WORLD_DIR="$MC_DIR/world"
BACKUP_DIR="$WORK_DIR/shadow_backups"
CONFIG_FILE="$HOME/.shadow_monarch.conf"
VERSION="11.0 ELITE SHADOW MONARCH (NightLord Edition)"

# Load Config
[ -f "$CONFIG_FILE" ] && source "$CONFIG_FILE"
RAM=${RAM:-"8192M"}
JAVA_FLAGS=${JAVA_FLAGS:-"-Xms${RAM} -Xmx${RAM}"}
SERVER_JAR="${SERVER_JAR:-}"
SERVER_JAR_GLOB="${SERVER_JAR_GLOB:-paper-*.jar}"
MC_VERSION=${MC_VERSION:-"1.21.1"} # Defaulting to 1.21.1 for optimal compatibility
LOADER="paper"
MODRINTH_API="https://api.modrinth.com/v2"
USER_AGENT="Shadow-Monarch-Paper-Plugin-Panel/11.0"

# ==========================
# 🛡️ SYSTEM DEPENDENCY CHECK
# ==========================
check_dependencies() {
    local deps=("curl" "jq" "wget" "tar")
    local missing=()
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" >/dev/null 2>&1; then
            missing+=("$dep")
        fi
    done

    if [ ${#missing[@]} -ne 0 ]; then
        echo -e "${RED}❖ System missing critical cores: ${missing[*]}${RESET}"
        echo -e "${CYAN}❖ NightLord, initiating automatic dependency installation...${RESET}"
        sudo apt-get update -y > /dev/null 2>&1
        sudo apt-get install -y "${missing[@]}" > /dev/null 2>&1
        echo -e "${GREEN}✔ Cores integrated successfully.${RESET}"
        sleep 1
    fi
}

# ==========================
# 💠 SOLO LEVELING EPIC SYSTEM AWAKENING
# ==========================
system_awakening() {
    clear
    check_dependencies
    echo -e "${P_MID}"
    echo "    ╔══════════════════════════════════════════════════════════╗"
    echo "    ║     [SYSTEM: Welcome Back, Sovereign NightLord]          ║"
    echo "    ║     ⚔️ INITIALIZING SHADOW MONARCH SYSTEM v11.0 ⚔️          ║"
    echo "    ╚══════════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
    echo -e " ${GRAY}Creator Profile:${RESET} ${BRIGHT_PURPLE}NightLord${RESET}"
    echo -ne "${CYAN} [System] Synchronizing Absolute Gate Matrix [${RESET}"
    for i in {1..35}; do
        echo -e -n "${BRIGHT_PURPLE}█${RESET}"
        sleep 0.02
    done
    echo -e "${CYAN}] ${GREEN}100% AWAKENED${RESET}"
    echo -e "${YELLOW}💬 [System]: 'Arise, NightLord.' Your absolute domain is fully active.${RESET}"
    sleep 1.2
}

# ==========================
# 👁️ MONARCH HUD HEADER
# ==========================
header() {
    clear
    echo -e "${P_DARK}╔══════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${P_DARK}║${RESET}         ${BRIGHT_PURPLE}⚔️ SHADOW MONARCH SUPREME INTERFACE v11.0 ⚔️${RESET}         ${P_DARK}║${RESET}"
    echo -e "${P_DARK}╚══════════════════════════════════════════════════════════════╝${RESET}"
    echo -e " ${NEON_BLUE}◆${RESET} ${CYAN}Mana/RAM:${RESET}  ${GREEN}$RAM${RESET}    │  ${NEON_BLUE}◆${RESET} ${CYAN}Monarch:${RESET} ${BRIGHT_PURPLE}NightLord${RESET}"
    echo -e " ${NEON_BLUE}◆${RESET} ${CYAN}Target MC:${RESET} ${GREEN}$MC_VERSION${RESET}   │  ${NEON_BLUE}◆${RESET} ${CYAN}Status:${RESET}  ${GREEN}God-Tier [ONLINE]${RESET}"
    echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
    echo
}

# ==========================
# 🛑 PAUSE SCREEN
# ==========================
pause() {
    echo
    echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
    echo -e " ${YELLOW}❖ Press Enter to continue...${RESET}"
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
    save_config
}

# ==========================
# 🌐 GATE VERSION SELECTOR (ALL 1.21.x FOCUS)
# ==========================
version_selector() {
    while true; do
        header
        echo -e "${P_MID} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${P_MID} ║${RESET}                ${WHITE}[ SELECT GATE DIFFICULTY ]${RESET}                 ${P_MID}║${RESET}"
        echo -e "${P_MID} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${BRIGHT_PURPLE}[1]${RESET} Paper 1.21.4  ${GRAY}(Latest Standard)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[2]${RESET} Paper 1.21.1  ${GRAY}(Stable - Best for NightLord Skripts)${RESET} 🔥"
        echo -e "  ${BRIGHT_PURPLE}[3]${RESET} Paper 1.21.11 ${GRAY}(Experimental S-Rank)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[4]${RESET} Custom Direct URL"
        echo -e "  ${RED}[0] Return to Previous Menu${RESET}"
        echo
        echo -ne "${BRIGHT_PURPLE}  nightlord@gate-select:~# ${RESET}"
        read v_choice

        case $v_choice in
        1) 
            DOWNLOAD_URL="https://api.papermc.io/v2/projects/paper/versions/1.21.4/builds/95/downloads/paper-1.21.4-95.jar"
            MC_VERSION="1.21.4"; break ;;
        2) 
            DOWNLOAD_URL="https://api.papermc.io/v2/projects/paper/versions/1.21.1/builds/126/downloads/paper-1.21.1-126.jar"
            MC_VERSION="1.21.1"; break ;;
        3) 
            DOWNLOAD_URL="https://fill-data.papermc.io/v1/objects/e708e8c132dc143ffd73528cccb9532e2eb17628b1a0eee74469bf466c7003f8/paper-1.21.11-116.jar"
            MC_VERSION="1.21.11"; break ;;
        4)
            echo -ne "${CYAN}  Paste Custom Direct Jar URL: ${RESET}"
            read DOWNLOAD_URL
            [ -z "$DOWNLOAD_URL" ] && echo -e "${RED}  Invalid URL!${RESET}" && sleep 1 || break
            ;;
        0) return 1 ;;
        *) echo -e "${RED}  Invalid Gate Choice!${RESET}"; sleep 1 ;;
        esac
    done
    save_config
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

    echo -e "${CYAN} ❖ Opening Gate... Extracting Core Server Data for NightLord...${RESET}"
    curl -L -o server.jar "$DOWNLOAD_URL"

    if [ $? -ne 0 ] || [ ! -s server.jar ]; then
        echo -e "${RED} ❌ Gate Collapse! Download failed. Check your network link.${RESET}"
        rm -f server.jar
        pause
        return
    fi

    echo "eula=true" > eula.txt
    mkdir -p plugins

    echo -e "${GREEN} ✔ Gate Conquered by NightLord! Server core established & EULA signed.${RESET}"
    pause
}

# ==========================
# 🎮 AWAKEN SERVER (RUN)
# ==========================
run_server() {
    header
    cd "$MC_DIR" || return

    local jar="$SERVER_JAR"
    if [[ -z "$jar" ]]; then
        shopt -s nullglob
        local jars=("$MC_DIR"/$SERVER_JAR_GLOB)
        shopt -u nullglob
        if ((${#jars[@]})); then
            jar="${jars[0]}"
        elif [ -f "server.jar" ]; then
            jar="server.jar"
        fi
    fi

    if [[ -z "$jar" || ! -f "$jar" ]]; then
        echo -e "${RED} ❌ No core found in NightLord's domain! Setup a server first.${RESET}"
        pause
        return
    fi

    echo -e "${BRIGHT_PURPLE} 💬 [System]: Invoking server runtime initialization for Monarch NightLord...${RESET}"
    echo -e "${GRAY} Assigned Power Flags: $JAVA_FLAGS${RESET}"
    echo
    java $JAVA_FLAGS -jar "$(basename "$jar")" nogui
    pause
}

# ==========================
# 📦 SHADOW BACKUP VAULT
# ==========================
shadow_backup() {
    while true; do
        header
        echo -e "${P_MID} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${P_MID} ║${RESET}                ${WHITE}[ SHADOW BACKUP VAULT ]${RESET}                    ${P_MID}║${RESET}"
        echo -e "${P_MID} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${BRIGHT_PURPLE}[1]${RESET} Create Backup ${GRAY}(Store Domain in Shadows)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[2]${RESET} Restore Backup ${GRAY}(Resurrect from Shadows)${RESET}"
        echo -e "  ${RED}[0] Return to Command Hub${RESET}"
        echo
        echo -ne "${BRIGHT_PURPLE}  nightlord@backup-vault:~# ${RESET}"
        read b_choice

        case $b_choice in
        1)
            if [ ! -d "$MC_DIR" ]; then
                echo -e "${RED} ❌ No server folder found to backup!${RESET}"
                pause
                continue
            fi
            mkdir -p "$BACKUP_DIR"
            TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
            BACKUP_FILE="$BACKUP_DIR/nightlord_backup_$TIMESTAMP.tar.gz"
            echo -e "${CYAN} 📦 Compressing domain data into NightLord's Shadow Realm...${RESET}"
            tar -czf "$BACKUP_FILE" -C "$WORK_DIR" server
            echo -e "${GREEN} ✔ Backup Secured successfully at: $BACKUP_FILE${RESET}"
            pause
            ;;
        2)
            if [ ! -d "$BACKUP_DIR" ]; then
                echo -e "${RED} ❌ No backups found in the vault!${RESET}"
                pause
                continue
            fi
            echo -e "${CYAN} Available Shadows (Backups):${RESET}"
            echo -e "${GRAY} ──────────────────────────────────────────────────────────────${RESET}"
            select b_file in "$BACKUP_DIR"/*.tar.gz; do
                if [ -n "$b_file" ]; then
                    echo -e "${YELLOW} ❖ Extracting shadows back to NightLord's domain...${RESET}"
                    rm -rf "$MC_DIR"
                    tar -xzf "$b_file" -C "$WORK_DIR"
                    echo -e "${GREEN} ✔ Resurrected Successfully, My Monarch!${RESET}"
                    break
                else
                    echo -e "${RED} Invalid selection.${RESET}"
                    break
                fi
            done
            pause
            ;;
        0) break ;;
        *) echo -e "${RED} Invalid choice!${RESET}"; sleep 1 ;;
        esac
    done
}

# ==========================================================
# 🔌 ADVANCED SHADOW MONARCH MODRINTH PLUGIN SYSTEM v11.0
# ==========================================================
urlencode() {
    jq -nr --arg v "$1" '$v|@uri'
}

api_get() {
    curl -fsSL --connect-timeout 10 --max-time 30 -A "$USER_AGENT" -H "Accept: application/json" "$1"
}

normalize() {
    printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | tr -cd '[:alnum:]'
}

save_config() {
cat > "$CONFIG_FILE" <<EOF
RAM=$(printf '%q' "$RAM")
JAVA_FLAGS=$(printf '%q' "$JAVA_FLAGS")
SERVER_JAR=$(printf '%q' "$SERVER_JAR")
SERVER_JAR_GLOB=$(printf '%q' "$SERVER_JAR_GLOB")
MC_VERSION=$(printf '%q' "$MC_VERSION")
EOF
}

search_plugins() {
    local query="$1"
    local encoded
    encoded="$(urlencode "$query")"
    local facets="[[\"project_type:plugin\"],[\"categories:paper\"],[\"versions:$MC_VERSION\"]]"
    local url="${MODRINTH_API}/search?query=${encoded}&facets=$(urlencode "$facets")&limit=20&index=relevance"
    api_get "$url"
}

get_project_version() {
    local project_id="$1"
    local loaders
    local versions
    loaders="$(urlencode '["paper"]')"
    versions="$(urlencode "[\"$MC_VERSION\"]")"
    local url="${MODRINTH_API}/project/${project_id}/version?loaders=${loaders}&game_versions=${versions}"
    local data
    data="$(api_get "$url")" || return 1

    jq -c '
    [
        .[] | select(.version_type=="release" or .version_type=="beta" or .version_type=="alpha")
        | . as $v
        | ($v.files | map(select(.filename | endswith(".jar"))) | .[0]) as $f
        | select($f != null)
        | { id:$v.id, version_number:$v.version_number, version_type:$v.version_type, file:{url:$f.url, filename:$f.filename, sha1:($f.hashes.sha1 // "")} }
    ] | sort_by(.date_published) | reverse | .[0] // empty
    ' <<< "$data"
}

plugin_search_menu() {
    header
    echo -e "${BRIGHT_PURPLE}${BOLD}◆ PLUGIN SEARCH (Target: $MC_VERSION)${RESET}"
    echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"

    read -rp "$(echo -e "${WHITE}Plugin name: ${RESET}")" query
    [[ -n "$query" ]] || return

    echo -e "\n${CYAN}◈ Searching the Shadow Archive for NightLord...${RESET}"
    local data
    data="$(search_plugins "$query")" || { echo -e "${RED}✖ Modrinth API request failed.${RESET}"; pause; return; }

    local count
    count="$(jq '.hits | length' <<< "$data")"
    ((count > 0)) || { echo -e "${RED}✖ No plugin found for $MC_VERSION.${RESET}"; pause; return; }

    # (Simplified similarity check for faster display)
    echo -e "\n${GREEN}✓ Compatible plugins found:${RESET}\n"
    local -a matches=()
    for ((i=0; i<count && i<10; i++)); do
        local title="$(jq -r ".hits[$i].title" <<< "$data")"
        local author="$(jq -r ".hits[$i].author // \"Unknown\"" <<< "$data")"
        local project_id="$(jq -r ".hits[$i].project_id" <<< "$data")"
        matches+=("$project_id|$title|$author")
        echo -e "${BRIGHT_PURPLE}[$((i+1))]${RESET} ${BOLD}$title${RESET} ${GRAY}by $author${RESET}"
    done

    read -rp "$(echo -e "\n${WHITE}Select [1-${#matches[@]}] or 0 to cancel: ${RESET}")" choice
    ((choice==0)) && return
    ((choice>=1 && choice<=${#matches[@]})) || return

    local selected="${matches[$((choice-1))]}"
    local project_id="${selected%%|*}"
    local title="$(echo "$selected" | cut -d'|' -f2)"
    
    echo -e "${CYAN}◈ Verifying Gate Compatibility...${RESET}"
    local version
    version="$(get_project_version "$project_id" 2>/dev/null)"
    
    if [[ -z "$version" ]]; then
        echo -e "${RED}✖ No valid .jar found for $MC_VERSION.${RESET}"
        pause; return
    fi

    local url="$(jq -r '.file.url' <<< "$version")"
    local filename="$(jq -r '.file.filename' <<< "$version")"

    echo -e "\n${GREEN}✓ Plugin target locked: $filename${RESET}"
    read -rp "$(echo -e "${WHITE}Download? [Y/n]: ${RESET}")" ans
    [[ "${ans:-Y}" =~ ^[Yy]$ ]] || return

    echo -e "${BRIGHT_PURPLE}◈ Awakening plugin...${RESET}"
    curl -fL --progress-bar "$url" -o "$PLUGIN_DIR/$filename"
    echo -e "${GREEN}✓ PLUGIN AWAKENED IN DOMAIN${RESET}"
    pause
}

shadow_plugin_menu() {
    while true; do
        header
        echo -e "${P_MID} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${P_MID} ║${RESET}           ${WHITE}[ SHADOW MONARCH — PLUGIN PANEL ]${RESET}              ${P_MID}║${RESET}"
        echo -e "${P_MID} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${BRIGHT_PURPLE}[1]${RESET} 🔎 Search & Download Plugin ${GRAY}(Modrinth API)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[2]${RESET} 📦 Installed Plugins List"
        echo -e "  ${RED}[0] ⬅ Back to Command Center${RESET}"
        echo
        echo -ne "${BRIGHT_PURPLE}  nightlord@plugin-panel:~# ${RESET}"
        read sp_choice

        case $sp_choice in
        1) plugin_search_menu ;;
        2) ls -lh "$PLUGIN_DIR"/*.jar 2>/dev/null | awk '{print $5, $9}' || echo "No plugins."; pause ;;
        0) break ;;
        *) echo -e "${RED} Invalid Command!${RESET}"; sleep 1 ;;
        esac
    done
}

# ==========================
# 🔮 UTILITIES
# ==========================
monarch_utilities() {
    while true; do
        header
        echo -e "${P_MID} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${P_MID} ║${RESET}               ${WHITE}[ GOD-TIER MONARCH UTILITIES ]${RESET}              ${P_MID}║${RESET}"
        echo -e "${P_MID} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${BRIGHT_PURPLE}[1]${RESET} 🧹 Purge Server Cache & Junk Files"
        echo -e "  ${BRIGHT_PURPLE}[2]${RESET} ⚠️ Wipe World Data ${GRAY}(Fresh Dungeon Reset)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[3]${RESET} 📁 Open Direct Shell Terminal in Server Dir"
        echo -e "  ${RED}[0] ⬅ Back to Previous Menu${RESET}"
        echo
        echo -ne "${BRIGHT_PURPLE}  nightlord@utilities:~# ${RESET}"
        read util_choice

        case $util_choice in
        1)
            echo -e "${YELLOW} 🧹 Purging useless logs, crash reports, and temp files...${RESET}"
            rm -rf "$MC_DIR/logs/"*.gz "$MC_DIR/crash-reports/"* "$MC_DIR/cache/"* 2>/dev/null
            echo -e "${GREEN} ✔ Domain Cleaned Successfully! Maximum performance restored.${RESET}"
            pause
            ;;
        2)
            echo -e "${RED} ⚠️ WARNING: This will destroy all blocks, builds, and players!${RESET}"
            read -p " Are you sure you want to reset NightLord's world? (y/N): " confirm_wipe
            if [[ "$confirm_wipe" =~ ^[Yy]$ ]]; then
                rm -rf "$WORLD_DIR" "$MC_DIR/world_nether" "$MC_DIR/world_the_end"
                echo -e "${GREEN} ✔ World wiped successfully. A fresh dungeon awaits!${RESET}"
            fi
            pause
            ;;
        3) bash -c "cd $MC_DIR && bash" ;;
        0) break ;;
        esac
    done
}

# ==========================
# 🎮 COMMAND & BUILD CENTER
# ==========================
mc_cb_menu() {
    while true; do
        header
        echo -e "${P_MID} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${P_MID} ║${RESET}               ${WHITE}[ COMMAND & BUILD CENTER ]${RESET}                 ${P_MID}║${RESET}"
        echo -e "${P_MID} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${BRIGHT_PURPLE}[1]${RESET} 🚀 Setup Server Gate ${GRAY}(Select Version & Download)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[2]${RESET} 🎮 Awaken/Run Server Engine"
        echo -e "  ${BRIGHT_PURPLE}[3]${RESET} 🔌 Shadow Soldier Plugins ${GRAY}(Advanced Modrinth System)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[4]${RESET} 📦 Shadow Backup Vault"
        echo -e "  ${BRIGHT_PURPLE}[5]${RESET} 🔮 God-Tier Monarch Utilities"
        echo -e "  ${RED}[0] ⬅ Back to Main System${RESET}"
        echo
        echo -ne "${BRIGHT_PURPLE}  nightlord@command-center:~# ${RESET}"
        read mccb_choice

        case $mccb_choice in
        1) setup_server ;;
        2) run_server ;;
        3) shadow_plugin_menu ;;
        4) shadow_backup ;;
        5) monarch_utilities ;;
        0) break ;;
        *) echo -e "${RED} Invalid Selection!${RESET}"; sleep 1 ;;
        esac
    done
}

# ==========================
# ⚙️ STATUS STATS / SETTINGS
# ==========================
settings() {
    while true; do
        header
        echo -e "${P_MID} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${P_MID} ║${RESET}                ${WHITE}[ STATUS & RAM MANAGER ]${RESET}                  ${P_MID}║${RESET}"
        echo -e "${P_MID} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${BRIGHT_PURPLE}[1]${RESET} Auto-Detect Stat Cap ${GRAY}(Smart RAM Optimize)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[2]${RESET} Allocate Custom Stat Power ${GRAY}(Custom RAM)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[3]${RESET} View Current Monarch Profile"
        echo -e "  ${RED}[0] Back to Main System${RESET}"
        echo
        echo -ne "${BRIGHT_PURPLE}  nightlord@status-mgr:~# ${RESET}"
        read s

        case $s in
        1) detect_ram; echo -e "${GREEN} ✔ Status synchronized! Maximum RAM assigned: $RAM${RESET}"; pause ;;
        2)
            echo -ne "${CYAN} Enter custom power capacity (e.g., 4096M, 8192M): ${RESET}"
            read NEW_RAM
            RAM=$NEW_RAM
            JAVA_FLAGS="-Xms${RAM} -Xmx${RAM}"
            save_config
            echo -e "${GREEN} ✔ Power successfully recalibrated to $RAM${RESET}"
            pause ;;
        3)
            echo -e "${CYAN} Monarch Profile Details:${RESET}"
            echo -e "  Assigned RAM Power  : ${GREEN}$RAM${RESET}"
            echo -e "  Java Execution Flag : ${GREEN}$JAVA_FLAGS${RESET}"
            pause ;;
        0) break ;;
        esac
    done
}

# ==========================
# 🛠️ TOOLS HUB MENU
# ==========================
tools_menu() {
    while true; do
        header
        echo -e "${PURPLE}${BOLD}"
        echo "   ████████╗ ██████╗  ██████╗ ██╗     ███████╗"
        echo "   ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝"
        echo "      ██║   ██║   ██║██║   ██║██║     ███████╗"
        echo "      ██║   ██║   ██║██║   ██║██║     ╚════██║"
        echo "      ██║   ╚██████╔╝╚██████╔╝███████╗███████║"
        echo "      ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝${RESET}"
        echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[1]${RESET} 🔄 Infinite Dungeon Host ${GRAY}(24/7 Host Script)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[2]${RESET} 🌐 Playit Tunnel Setup"
        echo -e "  ${RED}[0]${RESET} ⬅ Back to Main System"
        echo
        echo -ne "${BRIGHT_PURPLE}  nightlord@tools-hub:~# ${RESET}"
        read tool_choice

        case $tool_choice in
        1) curl -fsSL "https://raw.githubusercontent.com/NightLord-pro/NightLordNotTools/refs/heads/main/24-7" | python3 ;;
        2) 
            wget -q --show-progress https://github.com/playit-cloud/playit-agent/releases/download/v0.15.26/playit-linux-amd64
            chmod +x playit-linux-amd64; ./playit-linux-amd64 ;;
        0) break ;;
        esac
    done
}

# ==========================
# 🎬 SYSTEM MAIN ENTRY POINT
# ==========================
system_awakening

while true; do
    header

    # --- SLEEK ASCII BANNER FOR "NIGHT" ---
    echo -e "${P_DARK}${BOLD}"
    echo "  ███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗"
    echo "  ████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝"
    echo "  ██╔██╗ ██║██║██║  ███╗███████║   ██║   "
    echo "  ██║╚██╗██║██║██║   ██║██╔══██║   ██║   "
    echo "  ██║ ╚████║██║╚██████╔╝██║  ██║   ██║   "
    echo "  ╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   "
    echo -e "${RESET}"
    echo -e "${CYAN}                👑 NIGHTLORD SUPREME DOMAIN 👑               ${RESET}"
    echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
    echo -e "${PURPLE} ══ 🌟 NIGHTLORD'S SHADOW MONARCH DASHBOARD v11.0 ══${RESET}"
    
    # --- PERFECTLY ALIGNED GRID MENU ---
    echo ""
    printf "  ${CYAN}[1]${RESET} ⚔️ Command & Build Center       ${CYAN}[4]${RESET} ⚡ Panels Installer Hub\n"
    echo ""
    printf "  ${CYAN}[2]${RESET} ⚙️ Status & RAM Manager        ${CYAN}[5]${RESET} 🪽 Install Wings (Daemon)\n"
    echo ""
    printf "  ${CYAN}[3]${RESET} 🛠️ Tools Hub                   ${CYAN}[6]${RESET} 🧩 Petro_Tools Framework\n"
    echo ""
    echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
    printf "  ${RED}[0]${RESET} ❌ Close System / Log Out\n"
    echo ""
    echo -ne "${BRIGHT_PURPLE}  nightlord@shadow-monarch:~# ${RESET}"
    read main_choice

    case $main_choice in
    1) mc_cb_menu ;;
    2) settings ;;
    3) tools_menu ;;
    4) 
        echo -e "${GREEN} Launching NTH Setup...${RESET}"
        bash <(curl -s https://raw.githubusercontent.com/NightLord-pro/NTH/refs/heads/main/install.sh)
        pause ;;
    5) 
        echo -e "${GREEN} Launching Wings Setup...${RESET}"
        bash <(curl -s https://raw.githubusercontent.com/nobita586/Nobita-Hosting/main/cd/wing.sh)
        pause ;;
    6) 
        echo -e "${GREEN} PetroTools selected (Requires Blueprint Framework).${RESET}"
        pause ;;
    0)
       clear
       echo -e "${P_DARK} 💬 [System]: Logging out, Sovereign Monarch NightLord. Rise again when you are ready. 🌙${RESET}"
       exit 0
       ;;
    *)
       echo -e "${RED} Invalid System Command!${RESET}"
       sleep 1
       ;;
    esac
done
