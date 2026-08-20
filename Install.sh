#!/bin/bash

# ==========================================================
#   ⚔️ SOLO LEVELING: SHADOW MONARCH SYSTEM v12.9 ELITE ⚔️
#   [Created by: NightLord | Universal Exit Protocol 0]
# ==========================================================

# Aesthetic Styles & Color Palette (Monarch Theme)
PURPLE="\033[1;35m"
DEEP_PURPLE="\033[38;5;54m"
BRIGHT_PURPLE="\033[38;5;171m"
NEON_BLUE="\033[38;5;39m"
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
NC="\033[0m"

# Paths & Settings
WORK_DIR="$(pwd)"
MC_DIR="$WORK_DIR/server"
WORLD_DIR="$MC_DIR/world"
BACKUP_DIR="$WORK_DIR/shadow_backups"
CONFIG_FILE="$HOME/.shadow_monarch.conf"
VERSION="v12.9 SUPREME (NightLord Edition)"

# Load Config
[ -f "$CONFIG_FILE" ] && source "$CONFIG_FILE"
RAM=${RAM:-"8192M"}
JAVA_FLAGS=${JAVA_FLAGS:-"-Xms${RAM} -Xmx${RAM}"}
LOADER=${LOADER:-"paper"}
SERVER_JAR=${SERVER_JAR:-"server.jar"}
USER_AGENT="Shadow-Monarch-Panel/12.9"

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
# ⚡ ADVANCED SYSTEM LOADING WITH ANIMATION
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
    echo -e "${DEEP_PURPLE}    ──────────────────────────────────────────────────────────${RESET}"
    
    local spin=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')
    echo -ne "    ${GRAY}Channeling Mana Matrix: [${RESET}"
    
    for i in {1..30}; do
        echo -ne "${NEON_BLUE}▓${RESET}"
        echo -ne "\b${spin[$((i%10))]}"
        sleep 0.02
        echo -ne "\b${BRIGHT_PURPLE}█${RESET}"
    done
    
    echo -e "${GRAY}] ${GREEN}100% AWAKENED${RESET}"
    sleep 0.4
}

# ==========================
# 💠 SOLO LEVELING EPIC SYSTEM AWAKENING
# ==========================
system_awakening() {
    clear
    echo -e "${PURPLE}"
    echo "    ╔══════════════════════════════════════════════════════════╗"
    echo "    ║     [SYSTEM: Welcome Back, Sovereign NightLord]          ║"
    echo "    ║     ⚔️ INITIALIZING SHADOW MONARCH SYSTEM v12.9 ⚔️          ║"
    echo "    ╚══════════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
    echo -e " ${GRAY}Creator Profile:${RESET} ${PURPLE}NightLord${RESET}"
    echo -ne "${CYAN} [System] Synchronizing Absolute Gate Matrix [${RESET}"
    for i in {1..35}; do
        echo -e -n "${BRIGHT_PURPLE}◆${RESET}"
        sleep 0.01
    done
    echo -e "${CYAN}] ${GREEN}100% AWAKENED${RESET}"
    echo -e "${YELLOW}💬 [System]: 'Arise, NightLord.' Your absolute domain is fully active.${RESET}"
    sleep 0.8
}

# ==========================
# 👁️ MONARCH HUD HEADER
# ==========================
header() {
    clear
    local cpu_use=$(top -bn1 | grep load | awk '{printf "%.2f%%", $(NF-2)}' 2>/dev/null || echo "0.00%")
    local mem_use=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }' 2>/dev/null || echo "0.00%")
    
    echo -e "${DEEP_PURPLE}╔══════════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${DEEP_PURPLE}║${RESET}         ${BOLD}${BRIGHT_PURPLE}⚔️ SHADOW MONARCH SUPREME INTERFACE v12.9 ⚔️          ${DEEP_PURPLE}║${RESET}"
    echo -e "${DEEP_PURPLE}╠══════════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${DEEP_PURPLE}║${RESET} ${NEON_BLUE}👑 Monarch:${RESET} ${WHITE}NightLord${RESET}        ${DEEP_PURPLE}│${RESET} ${NEON_BLUE}⚡ Mana(RAM):${RESET} ${YELLOW}${RAM}${RESET}             "
    echo -e "${DEEP_PURPLE}║${RESET} ${NEON_BLUE}⚙️ CPU Load:${RESET}  ${CYAN}${cpu_use}${RESET}          ${DEEP_PURPLE}│${RESET} ${NEON_BLUE}💾 Mem Use:${RESET} ${CYAN}${mem_use}${RESET}      "
    echo -e "${DEEP_PURPLE}╚══════════════════════════════════════════════════════════════════╝${RESET}"
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
# ⚙️ STATUS STATS / SETTINGS
# ==========================
settings() {
    while true; do
        header
        echo -e "${DEEP_PURPLE} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${DEEP_PURPLE} ║${RESET}                ${WHITE}[ STATUS & RAM MANAGER ]${RESET}                  ${DEEP_PURPLE}║${RESET}"
        echo -e "${DEEP_PURPLE} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${BRIGHT_PURPLE}[1]${RESET} Auto-Detect Stat Cap ${GRAY}(Smart RAM Optimize)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[2]${RESET} Allocate Custom Stat Power ${GRAY}(Custom RAM)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[3]${RESET} View Current Monarch Profile"
        echo -e "  ${RED}[0] Back to Main System${RESET}"
        echo
        echo -ne "${NEON_BLUE}  nightlord@status-mgr:~# ${RESET}"
        read s

        case $s in
        1)
            detect_ram
            echo -e "${GREEN} ✔ Status synchronized for NightLord! Maximum RAM assigned: $RAM${RESET}"
            pause
            ;;
        2)
            echo -ne "${CYAN} Enter custom power capacity for NightLord (e.g., 4096M, 8192M): ${RESET}"
            read RAM
            echo "RAM=\"$RAM\"" > "$CONFIG_FILE"
            JAVA_FLAGS="-Xms${RAM} -Xmx${RAM}"
            echo -e "${GREEN} ✔ Power successfully recalibrated to $RAM${RESET}"
            pause
            ;;
        3)
            echo -e "${CYAN} Monarch Profile Details:${RESET}"
            echo -e "${GRAY} ──────────────────────────────────────────────────────────────${RESET}"
            echo -e "  Monarch Name        : ${PURPLE}NightLord${RESET}"
            echo -e "  Assigned RAM Power  : ${GREEN}$RAM${RESET}"
            echo -e "  Java Execution Flag : ${GREEN}$JAVA_FLAGS${RESET}"
            echo -e "  System Config Path  : ${GREEN}$CONFIG_FILE${RESET}"
            echo -e "${GRAY} ──────────────────────────────────────────────────────────────${RESET}"
            pause
            ;;
        0) break ;;
        *) echo -e "${RED} Invalid Stat Choice!${RESET}"; sleep 1 ;;
        esac
    done
}

# ==========================
# 🔄 24/7 ETERNAL DUNGEON HOST
# ==========================
host_24_7() {
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
    clear
    echo -e "${BLUE}┌────────────────────────────────────┐"
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

        echo -e "${DEEP_PURPLE} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${DEEP_PURPLE} ║${NC}             ${WHITE}[ SYSTEM: SHADOW MONARCH TUNNEL ]${NC}              ${DEEP_PURPLE}║${RESET}"
        echo -e "${DEEP_PURPLE} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo ""
        echo -e "${BRIGHT_PURPLE}  GATE STATUS ${GRAY}───────────────────────────────────────────${NC}"
        echo -e "  ${PURPLE}◆${NC} Architecture : ${WHITE}$arch${NC}"
        echo -e "  ${PURPLE}◆${NC} Monarch Stat : $s_status"
        echo -e "  ${PURPLE}◆${NC} Shadow ID    : $s_pid"
        echo -e "  ${PURPLE}◆${NC} Gate Open    : ${NEON_BLUE}$s_uptime${NC}"
        echo -e "${GRAY} ────────────────────────────────────────────────────────────${NC}"
        echo ""
        echo -e "  ${BRIGHT_PURPLE}[1]${RESET} 🚀 Install / Setup Tunnel"
        echo -e "  ${RED}[2]${RESET} 🗑️ Uninstall Completely"
        echo -e "  ${RED}[0]${RESET} ⬅ Return to Tools Menu"
        echo ""
        echo -ne "${NEON_BLUE}  nightlord@tunnel-hub:~# ${RESET}"
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
        echo "      ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝"
        echo -e "${RESET}"
        echo -e "${CYAN}               MADE BY NIGHTLORD               ${RESET}"
        echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
        echo
        echo -e "  ${BRIGHT_PURPLE}[1]${RESET} 🔄 Infinite Dungeon Host ${GRAY}(24/7 Host)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[2]${RESET} 🌐 Playit Tunnel Setup"
        echo -e "  ${BRIGHT_PURPLE}[3]${RESET} ☁️ Cloudflared Manager"
        echo -e "  ${RED}[0]${RESET} ⬅ Back to Main System"
        echo
        echo -ne "${NEON_BLUE}  nightlord@tools-hub:~# ${RESET}"
        read tool_choice

        case $tool_choice in
        1) host_24_7 ;;
        2) playit_setup ;;
        3) cloudflared_menu ;;
        0) break ;;
        *) echo -e "${RED} Invalid Option!${NC}"; sleep 1 ;;
        esac
    done
}

# ==========================
# 🪽 WINGS INSTALLER
# ==========================
wings_setup() {
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
    while true; do
        clear

        if command -v blueprint >/dev/null 2>&1; then
            status="${GREEN}● ONLINE${RESET}"
            installed=true
        else
            status="${RED}● OFFLINE${RESET}"
            installed=false
        fi

        echo -e "${PURPLE}${BOLD}"
        echo "   ██████╗ ██╗     ██╗   ██╗███████╗██████╗"
        echo "   ██╔══██╗██║     ██║   ██║██╔════╝██╔══██╗"
        echo "   ██████╔╝██║     ██║   ██║█████╗  ██████╔╝"
        echo "   ██╔══██╗██║     ██║   ██║██╔══╝  ██╔═══╝"
        echo "   ██████╔╝███████╗╚██████╔╝███████╗██║"
        echo "   ╚═════╝ ╚══════╝ ╚═════╝ ╚══════╝╚═╝"
        echo -e "${RESET}"
        echo -e "${CYAN}               MADE BY NIGHTLORD               ${RESET}"
        echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
        echo
        echo -e "   ${CYAN}BLUEPRINT FRAMEWORK${RESET}"
        echo -e "   Status : $status"
        echo ""

        if [ "$installed" = false ]; then
            echo -e "   ${BRIGHT_PURPLE}[1]${RESET} ${GREEN}Install Framework${RESET}"
            echo -e "   ${RED}[0] Back${RESET}"
        else
            echo -e "   ${BRIGHT_PURPLE}[1]${RESET} ${GREEN}Reinstall Framework${RESET}"
            echo -e "   ${BRIGHT_PURPLE}[2]${RESET} ${GREEN}Update Framework${RESET}"
            echo -e "   ${BRIGHT_PURPLE}[3]${RESET} ${GREEN}Info${RESET}"
            echo -e "   ${BRIGHT_PURPLE}[4]${RESET} ${GREEN}Version${RESET}"
            echo -e "   ${BRIGHT_PURPLE}[5]${RESET} ${RED}Uninstall Framework${RESET}"
            echo -e "   ${RED}[0] Back${RESET}"
        fi

        echo ""
        echo -ne "${NEON_BLUE}  nightlord@blueprint:~# ${RESET}"
        read bp

        case $bp in
            1)
                if [ "$installed" = false ]; then
                    echo -e "${CYAN}Installing...${RESET}"
                    rm -f /etc/apt/keyrings/nodesource.gpg 2>/dev/null
                    yes | bash <(curl -s https://raw.githubusercontent.com/nobita329/Nobita-Cloud/refs/heads/main/thame/install.sh)
                else
                    yes | blueprint -rerun-install
                fi
                pause
                ;;
            2)
                yes | blueprint -upgrade
                pause
                ;;
            3)
                blueprint -info
                pause
                ;;
            4)
                blueprint -version
                pause
                ;;
            5)
                echo -e "${RED}Uninstalling Blueprint Framework + Extensions...${RESET}"
                path=$(which blueprint 2>/dev/null)

                if [ -n "$path" ]; then
                    systemctl stop pterodactyl-queue 2>/dev/null || true
                    rm -f "$path"
                    rm -rf ~/.blueprint
                    rm -rf ~/.config/blueprint
                    rm -rf /var/www/pterodactyl/.blueprint
                    rm -rf /var/www/pterodactyl/app/BlueprintFramework
                    rm -rf /var/www/pterodactyl/app/BlueprintFramework/*
                    rm -rf /var/www/pterodactyl/extensions
                    rm -rf /var/www/pterodactyl/extensions/*
                    rm -rf /etc/blueprint
                    rm -f /etc/systemd/system/blueprint* 2>/dev/null
                    rm -f /etc/systemd/system/pteroq.service 2>/dev/null

                    if [ -f /var/www/pterodactyl/blueprint.backup.tar.gz ]; then
                        echo -e "${YELLOW}Restoring backup...${RESET}"
                        rm -f /var/www/pterodactyl/blueprint.backup.tar.gz
                    fi

                    if command -v mysql >/dev/null 2>&1; then
                        echo -e "${YELLOW}Cleaning database...${RESET}"
                        mysql -e "DROP TABLE IF EXISTS pterodactyl.blueprint_extensions;" 2>/dev/null || true
                    fi

                    systemctl daemon-reload 2>/dev/null || true

                    echo -e "${GREEN}Fully uninstalled (Framework + Extensions) ✔${RESET}"
                else
                    echo -e "${RED}Not installed ❌${RESET}"
                fi
                pause
                ;;
            0)
                break
                ;;
            *)
                echo -e "${RED}Invalid option${RESET}"
                sleep 1
                ;;
        esac
    done
}

is_installed_ext() {
    [[ -d "/var/www/pterodactyl/storage/extensions/${1%.blueprint}" ]] && return 0 || return 1
}

is_selected_ext() {
    local index=$1
    [[ " ${selected_indices[*]} " =~ " $index " ]] && return 0 || return 1
}

run_blueprint_ext() {
    local NAME="$1"
    local ACTION="$2"
    local URL="https://github.com/NightLord-pro/NightLordNotTools/raw/main/PETROTOOLS/EXTENSIONS"
    cd /var/www/pterodactyl || exit 1
    if [[ "$ACTION" == "install" ]]; then
        echo -e "${GREEN}📥 Installing ${NAME%.blueprint}...${NC}"
        wget -q "$URL/$NAME" -O "$NAME"
        if [[ -s "$NAME" ]]; then
            yes | blueprint -i "$NAME"
            rm -f "$NAME"
        else
            echo -e "${RED}[!] Failed to download $NAME${NC}"
        fi
    else
        echo -e "${RED}🗑️ Removing ${NAME%.blueprint}...${NC}"
        yes | blueprint -r "${NAME%.blueprint}"
    fi
}

petrotools_extensions_menu() {
    local selected_indices=()

    local names=(
        "versionchanger.blueprint"
        "stats.blueprint"
        "servericonimporter.blueprint"
        "serverbackgrounds.blueprint"
        "motdmaker.blueprint"
        "modrinthbrowser.blueprint"
        "huxregister.blueprint"
        "minecraftplayermanager.blueprint"
    )

    while true; do
        clear

        echo -e "${PURPLE}${BOLD}"
        echo "   ███████╗██╗  ██╗████████╗███████╗███╗   ██╗"
        echo "   ██╔════╝╚██╗██╔╝╚══██╔══╝██╔════╝████╗  ██║"
        echo "   █████╗   ╚███╔╝    ██║   █████╗  ██╔██╗ ██║"
        echo "   ██╔══╝   ██╔██╗    ██║   ██╔══╝  ██║╚██╗██║"
        echo "   ███████╗██╔╝ ██╗   ██║   ███████╗██║ ╚████║"
        echo "   ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═══╝"
        echo -e "${RESET}"
        echo -e "${CYAN}               MADE BY NIGHTLORD               ${RESET}"
        echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
        echo
        echo -e "   ${CYAN}EXTEN${RESET}"
        echo ""

        local count=0
        for i in "${!names[@]}"; do
            num=$((i+1))
            clean_name="${names[$i]%.blueprint}"

            is_installed_ext "$clean_name" && status="${GREEN}●${NC}" || status="${RED}○${NC}"
            is_selected_ext "$i" && select_mark="${YELLOW}[+]${NC}" || select_mark="   "

            display_name="${clean_name:0:22}"
            printf " %b ${BRIGHT_PURPLE}%2d${NC} %-22s %b  " "$select_mark" "$num" "$display_name" "$status"

            ((count++))
            [[ $((count % 2)) -eq 0 ]] && echo ""
        done

        [[ $((count % 2)) -ne 0 ]] && echo ""

        echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
        echo -e " ${WHITE}SELECTED:${NC} ${YELLOW}${#selected_indices[@]}${NC} items"
        echo -e " ${GREEN}I${NC} => Install All    ${RED}R${NC} => Remove All    ${RED}0${NC} => Back"
        echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
        echo -ne "${NEON_BLUE}  nightlord@extensions:~# ${RESET}"
        read choice

        case $choice in
            0)
                break
                ;;
            i|I|r|R)
                if [[ ${#selected_indices[@]} -eq 0 ]]; then
                    echo -e "${RED}Nothing selected!${NC}"
                    sleep 1
                    continue
                fi
                action_type="install"
                [[ "$choice" =~ [rR] ]] && action_type="remove"
                for idx in "${selected_indices[@]}"; do
                    run_blueprint_ext "${names[$idx]}" "$action_type"
                done
                selected_indices=()
                echo ""
                read -p "Done. Press Enter to return..."
                ;;
            *)
                for val in $choice; do
                    if [[ "$val" =~ ^[0-9]+$ ]] && (( val >= 1 && val <= ${#names[@]} )); then
                        idx=$((val-1))
                        if is_selected_ext "$idx"; then
                            for i in "${!selected_indices[@]}"; do
                                if [[ ${selected_indices[i]} -eq $idx ]]; then
                                    unset 'selected_indices[i]'
                                fi
                            done
                            selected_indices=("${selected_indices[@]}")
                        else
                            selected_indices+=("$idx")
                        fi
                    else
                        echo -e "${RED}Invalid option: $val${NC}"
                        sleep 0.5
                    fi
                done
                ;;
        esac
    done
}

# ==========================
# 🎨 THEME UI MENU (PETROTOOLS)
# ==========================
petrotools_theme_menu() {
    local theme_names=(
        "nebula.blueprint"
        "euphoriatheme.blueprint"
    )

    is_installed_theme() {
        local slug="${1%.blueprint}"
        [[ -d "/var/www/pterodactyl/storage/extensions/$slug" ]] && return 0 || return 1
    }

    run_theme_blueprint() {
        local NAME="$1"
        local ACTION="$2"
        local THEME_URL="https://github.com/NightLord-pro/NightLordNotTools/raw/main/PETROTOOLS/ui"

        cd /var/www/pterodactyl || {
            echo -e "${RED}Directory not found!${RESET}"
            return
        }

        if [[ "$ACTION" == "install" ]]; then
            echo -e "\n${GREEN}📥 Downloading & Installing ${NAME%.blueprint}...${RESET}"
            wget -q "$THEME_URL/$NAME" -O "$NAME"
            if [[ -f "$NAME" ]]; then
                yes | blueprint -i "$NAME"
                rm -f "$NAME"
                echo -e "${GREEN}✅ Installation completed!${RESET}"
            else
                echo -e "${RED}❌ Download failed!${RESET}"
            fi
        else
            echo -e "\n${RED}🗑️ Removing ${NAME%.blueprint}...${RESET}"
            yes | blueprint -r "${NAME%.blueprint}"
            echo -e "${GREEN}✅ Removal completed!${RESET}"
        fi
    }

    while true; do
        clear
        echo -e "${PURPLE}${BOLD}"
        echo "   ████████╗██╗  ██╗███████╗███╗   ███╗███████╗"
        echo "   ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝"
        echo "      ██║   ███████║█████╗  ██╔████╔██║█████╗  "
        echo "      ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝  "
        echo "      ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗"
        echo "      ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝"
        echo -e "${RESET}"
        echo -e "${CYAN}               MADE BY NIGHTLORD               ${RESET}"
        echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
        echo
        echo -e "   ${CYAN}SELECT A THEME UI:${RESET}"
        echo ""

        local count=0
        for i in "${!theme_names[@]}"; do
            num=$((i+1))
            clean_name="${theme_names[$i]%.blueprint}"

            if is_installed_theme "$clean_name"; then
                status="${GREEN}●${RESET}"
            else
                status="${RED}○${RESET}"
            fi

            printf "  ${BRIGHT_PURPLE}%2d${RESET} %-22s %b   " "$num" "$clean_name" "$status"
            ((count++))
            (( count % 2 == 0 )) && echo ""
        done

        (( count % 2 != 0 )) && echo ""

        echo -e "\n  ${RED} 0 ${RESET} Back to PetroTools"
        echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
        echo -ne "${NEON_BLUE}  nightlord@theme:~# ${RESET}"
        read opt

        [[ "$opt" == "0" ]] && break

        if ! [[ "$opt" =~ ^[0-9]+$ ]]; then
            echo -e "\n${RED} ❌ Invalid Option${RESET}"
            sleep 1
            continue
        fi

        index=$((opt-1))
        NAME="${theme_names[$index]}"

        if [[ -z "$NAME" ]]; then
            echo -e "\n${RED} ❌ Invalid Option${RESET}"
            sleep 1
            continue
        fi

        clean_name="${NAME%.blueprint}"

        while true; do
            header
            if is_installed_theme "$clean_name"; then
                cur_status="${GREEN}ALREADY INSTALLED${RESET}"
            else
                cur_status="${RED}NOT INSTALLED${RESET}"
            fi

            echo -e " ${WHITE}SELECTED UI:${RESET} ${CYAN}$clean_name${RESET}"
            echo -e " ${WHITE}STATUS:${RESET}      $cur_status"
            echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
            echo -e "  ${BRIGHT_PURPLE}[ 1 ]${RESET} Install"
            echo -e "  ${RED}[ 2 ]${RESET} Uninstall"
            echo -e "  ${YELLOW}[ 0 ]${RESET} Back to Theme Menu"
            echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
            read -p " 👉 Action: " action

            case "$action" in
                1)
                    run_theme_blueprint "$NAME" "install"
                    pause
                    break
                    ;;
                2)
                    run_theme_blueprint "$NAME" "remove"
                    pause
                    break
                    ;;
                0)
                    break
                    ;;
                *)
                    echo -e "\n${RED}❌ Invalid Choice${RESET}"
                    sleep 1
                    ;;
            esac
        done
    done
}

petro_tools_menu() {
    while true; do
        header
        echo -e "${PURPLE}${BOLD}"
        echo "   ██████╗ ███████╗████████╗██████╗  ██████╗      ████████╗"
        echo "   ██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗     ╚══██╔══╝"
        echo "   ██████╔╝█████╗     ██║   ██████╔╝██║   ██║        ██║   "
        echo "   ██╔═══╝ ██╔══╝     ██║   ██╔══██╗██║   ██║        ██║   "
        echo "   ██║     ███████╗   ██║   ██║  ██║╚██████╔╝        ██║   "
        echo "   ╚═════╝ ╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝         ╚═╝   "
        echo -e "${RESET}"
        echo -e "${CYAN}               MADE BY NIGHTLORD               ${RESET}"
        echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
        echo
        echo -e "  ${BRIGHT_PURPLE}[1]${RESET} 📋 BLUEP"
        echo -e "  ${BRIGHT_PURPLE}[2]${RESET} 🧩 EXTEN"
        echo -e "  ${BRIGHT_PURPLE}[3]${RESET} 🎨 THEME"
        echo -e "  ${RED}[0]${RESET} ⬅ Back to Main System"
        echo
        echo -ne "${NEON_BLUE}  nightlord@petrotools:~# ${RESET}"
        read pt_choice

        case $pt_choice in
        1) blueprint_setup ;;
        2) petrotools_extensions_menu ;;
        3) petrotools_theme_menu ;;
        0) break ;;
        *) echo -e "${RED} Invalid Option!${NC}"; sleep 1 ;;
        esac
    done
}

# ==========================
# ⚡ PANELS INSTALLER HUB
# ==========================
panels_menu() {
    while true; do
        header
        echo -e "${DEEP_PURPLE} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${DEEP_PURPLE} ║${RESET}            ${WHITE}[ SHADOW MONARCH PANELS HUB ]${RESET}              ${DEEP_PURPLE}║${RESET}"
        echo -e "${DEEP_PURPLE} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${BRIGHT_PURPLE}[1]${RESET} 🚀 NTH ${GRAY}(NTH MY OWN PANEL - Installed via Official Script)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[2]${RESET} ⚡ jtg ${GRAY}(JishnuTheGamer Panel Suite)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[3]${RESET} 🛡️ Pterodactyl Panel Suite"
        echo -e "  ${RED}[0] ⬅ Back to Main System${RESET}"
        echo
        echo -ne "${NEON_BLUE}  nightlord@panels-hub:~# ${RESET}"
        read panel_choice

        case $panel_choice in
        1)
            echo -e "${GREEN} 🚀 Initializing NTH (NightLord's Own Panel) installation suite...${RESET}"
            cd "$WORK_DIR"
            bash <(curl -s https://raw.githubusercontent.com/NightLord-pro/NTH/refs/heads/main/install.sh)
            pause
            ;;
        2)
            echo -e "${GREEN} 🚀 Initializing jtg installation suite for NightLord...${RESET}"
            cd "$WORK_DIR"
            bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/Jtg/refs/heads/main/install.sh)
            pause
            ;;
        3)
            echo -e "${GREEN} ⚡ Initializing Pterodactyl installation suite for NightLord...${RESET}"
            cd "$WORK_DIR"
            bash <(curl -s https://raw.githubusercontent.com/NightLord-pro/NightLordNotTools/refs/heads/main/Petroldectal%20Create)
            pause
            ;;
        0) break ;;
        *) echo -e "${RED} Invalid Panel Choice!${NC}"; sleep 1 ;;
        esac
    done
}

# ==========================
# 🌐 ULTIMATE GATE SELECTOR (FOR MC-CB)
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
        0) system_load "Returning to Command Center..."; return 1 ;;
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
# 🛠️ TOOLS & UTILITIES HUB (MC-CB SUB)
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
# 🎮 COMMAND & BUILD CENTER (MAIN MENU)
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
# 🎬 SYSTEM MAIN ENTRY POINT
# ==========================
system_awakening

while true; do
    header

    # --- SLEEK ASCII BANNER FOR "NIGHT" ---
    echo -e "${PURPLE}${BOLD}"
    echo "  ███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗"
    echo "  ████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝"
    echo "  ██╔██╗ ██║██║██║  ███╗███████║   ██║   "
    echo "  ██║╚██╗██║██║██║   ██║██╔══██║   ██║   "
    echo "  ██║ ╚████║██║╚██████╔╝██║  ██║   ██║   "
    echo "  ╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   "
    echo -e "${RESET}"
    echo -e "${CYAN}                👑 NIGHTLORD SUPREME DOMAIN 👑               ${RESET}"
    echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"

    echo -e "${PURPLE} ══ 🌟 NIGHTLORD'S SHADOW MONARCH DASHBOARD v12.9 ══${RESET}"
    
    # --- UPDATED MENU WITH COMMAND & BUILD CENTER ---
    echo ""
    printf "  \033[1;36m[1]\033[0m ⚙️ Status & RAM Manager        \033[1;36m[2]\033[0m ⚡ Panels Installer Hub\n"
    echo ""
    printf "  \033[1;36m[3]\033[0m 🪽 Install Wings (Daemon)      \033[1;36m[4]\033[0m 🛠️ TOOLS\n"
    echo ""
    printf "  \033[1;36m[5]\033[0m 🛠️ PETRO_T                   \033[1;36m[6]\033[0m 🔥 Command & Build Center\n"
    echo ""
    echo -e "${CYAN}                MADE BY NIGHTLORD               ${RESET}"
    echo ""
    printf "  \033[1;31m[0]\033[0m ❌ Close System / Log Out\n"
    echo ""
    
    echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
    echo
    echo -ne "${NEON_BLUE}  nightlord@shadow-monarch:~# ${RESET}"
    read main_choice

    case $main_choice in
    1) settings ;;
    2) panels_menu ;;
    3) wings_setup ;;
    4) tools_menu ;;
    5) petro_tools_menu ;;
    6) mc_cb_menu ;;
    0)
       clear
       echo -e "${PURPLE} 💬 [System]: Logging out, Sovereign Monarch NightLord. Rise again when you are ready. 🌙${RESET}"
       exit 0
       ;;
    *)
       echo -e "${RED} Invalid System Command!${RESET}"
       sleep 1
       ;;
    esac
done
