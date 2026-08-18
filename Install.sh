#!/bin/bash

# ==========================================================
#   ⚔️ SOLO LEVELING: SHADOW MONARCH SYSTEM v11.0 ELITE ⚔️
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
PLUGIN_DIR="$MC_DIR/plugins"
WORLD_DIR="$MC_DIR/world"
BACKUP_DIR="$WORK_DIR/shadow_backups"
CONFIG_FILE="$HOME/.shadow_monarch.conf"
VERSION="11.0 SHADOW MONARCH GOD-TIER (NightLord Edition)"

# Load Config
[ -f "$CONFIG_FILE" ] && source "$CONFIG_FILE"
RAM=${RAM:-"8192M"}
JAVA_FLAGS=${JAVA_FLAGS:-"-Xms${RAM} -Xmx${RAM}"}
SERVER_JAR="${SERVER_JAR:-}"
SERVER_JAR_GLOB="${SERVER_JAR_GLOB:-paper-*.jar}"
MC_VERSION="1.21.11"
LOADER="paper"
MODRINTH_API="https://api.modrinth.com/v2"
USER_AGENT="Shadow-Monarch-Paper-Plugin-Panel/11.0"

# ==========================
# 💠 SOLO LEVELING EPIC SYSTEM AWAKENING
# ==========================
system_awakening() {
    clear
    echo -e "${PURPLE}"
    echo "    ╔══════════════════════════════════════════════════════════╗"
    echo "    ║     [SYSTEM: Welcome Back, Sovereign NightLord]          ║"
    echo "    ║     ⚔️ INITIALIZING SHADOW MONARCH SYSTEM v11.0 ⚔️          ║"
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
    echo -e "${PURPLE}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║         ⚔️ SHADOW MONARCH SUPREME INTERFACE v11.0 ⚔️         ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
    echo -e " ${BRIGHT_PURPLE}◆${RESET} ${CYAN}Mana/RAM:${RESET}  ${GREEN}$RAM${RESET}    │  ${BRIGHT_PURPLE}◆${RESET} ${CYAN}Monarch:${RESET} ${PURPLE}NightLord${RESET}"
    echo -e " ${BRIGHT_PURPLE}◆${RESET} ${CYAN}Directory:${RESET} ${GREEN}$MC_DIR${RESET} │  ${BRIGHT_PURPLE}◆${RESET} ${CYAN}Status:${RESET}  ${GREEN}God-Tier [ONLINE]${RESET}"
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
    echo "RAM=\"$RAM\"" > "$CONFIG_FILE"
}

# ==========================
# 🌐 GATE VERSION SELECTOR (ALL 1.21.x FOCUS)
# ==========================
version_selector() {
    while true; do
        header
        echo -e "${PURPLE} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${PURPLE} ║${RESET}                ${WHITE}[ SELECT GATE DIFFICULTY ]${RESET}                 ${PURPLE}║${RESET}"
        echo -e "${PURPLE} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${BRIGHT_PURPLE}[1]${RESET} Paper 1.21.11 ${GRAY}(Latest S-Rank Monarch Core)${RESET} 🔥"
        echo -e "  ${BRIGHT_PURPLE}[2]${RESET} Paper 1.21.10"
        echo -e "  ${BRIGHT_PURPLE}[3]${RESET} Paper 1.21.9"
        echo -e "  ${BRIGHT_PURPLE}[4]${RESET} Paper 1.21.8"
        echo -e "  ${BRIGHT_PURPLE}[5]${RESET} Paper 1.21.4"
        echo -e "  ${BRIGHT_PURPLE}[6]${RESET} Paper 1.21.1"
        echo -e "  ${BRIGHT_PURPLE}[7]${RESET} Custom Direct URL"
        echo -e "  ${RED}[0] Return to Previous Menu${RESET}"
        echo
        echo -ne "${PURPLE}  nightlord@gate-select:~# ${RESET}"
        read v_choice

        case $v_choice in
        1) DOWNLOAD_URL="https://fill-data.papermc.io/v1/objects/e708e8c132dc143ffd73528cccb9532e2eb17628b1a0eee74469bf466c7003f8/paper-1.21.11-116.jar"; break ;;
        2) DOWNLOAD_URL="https://api.papermc.io/v2/projects/paper/versions/1.21.10/builds/1/downloads/paper-1.21.10-1.jar"; break ;;
        3) DOWNLOAD_URL="https://api.papermc.io/v2/projects/paper/versions/1.21.9/builds/1/downloads/paper-1.21.9-1.jar"; break ;;
        4) DOWNLOAD_URL="https://api.papermc.io/v2/projects/paper/versions/1.21.8/builds/1/downloads/paper-1.21.8-1.jar"; break ;;
        5) DOWNLOAD_URL="https://api.papermc.io/v2/projects/paper/versions/1.21.4/builds/95/downloads/paper-1.21.4-95.jar"; break ;;
        6) DOWNLOAD_URL="https://api.papermc.io/v2/projects/paper/versions/1.21.1/builds/126/downloads/paper-1.21.1-126.jar"; break ;;
        7)
            echo -ne "${CYAN}  Paste Custom Direct Jar URL: ${RESET}"
            read DOWNLOAD_URL
            [ -z "$DOWNLOAD_URL" ] && echo -e "${RED}  Invalid URL!${RESET}" && sleep 1 || break
            ;;
        0) return 1 ;;
        *) echo -e "${RED}  Invalid Gate Choice!${RESET}"; sleep 1 ;;
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

    echo -e "${PURPLE} 💬 [System]: Invoking server runtime initialization for Monarch NightLord...${RESET}"
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
        echo -e "${PURPLE} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${PURPLE} ║${RESET}                ${WHITE}[ SHADOW BACKUP VAULT ]${RESET}                    ${PURPLE}║${RESET}"
        echo -e "${PURPLE} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${BRIGHT_PURPLE}[1]${RESET} Create Backup ${GRAY}(Store Domain in Shadows)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[2]${RESET} Restore Backup ${GRAY}(Resurrect from Shadows)${RESET}"
        echo -e "  ${RED}[0] Return to Command Hub${RESET}"
        echo
        echo -ne "${PURPLE}  nightlord@backup-vault:~# ${RESET}"
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
    curl -fsSL \
        --connect-timeout 10 \
        --max-time 30 \
        -A "$USER_AGENT" \
        -H "Accept: application/json" \
        "$1"
}

normalize() {
    printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | tr -cd '[:alnum:]'
}

levenshtein() {
    local a="$1"
    local b="$2"
    local la=${#a}
    local lb=${#b}
    local i j
    local -a prev
    local -a cur

    for ((j=0;j<=lb;j++)); do
        prev[j]=$j
    done

    for ((i=1;i<=la;i++)); do
        cur[0]=$i
        for ((j=1;j<=lb;j++)); do
            local cost=0
            [[ "${a:i-1:1}" != "${b:j-1:1}" ]] && cost=1
            local x=$((cur[j-1]+1))
            local y=$((prev[j]+1))
            local z=$((prev[j-1]+cost))
            local m=$x
            ((y<m)) && m=$y
            ((z<m)) && m=$z
            cur[j]=$m
        done
        prev=("${cur[@]}")
    done
    printf '%s' "${prev[lb]}"
}

similarity() {
    local a b
    a="$(normalize "$1")"
    b="$(normalize "$2")"

    [[ -z "$a" || -z "$b" ]] && { printf "0"; return; }
    [[ "$a" == "$b" ]] && { printf "100"; return; }

    if [[ "$a" == *"$b"* || "$b" == *"$a"* ]]; then
        local small=${#a}
        local large=${#b}
        (( ${#a} < ${#b} )) && { small=${#a}; large=${#b}; }
        printf "%s" $((small*100/large))
        return
    fi

    local distance
    distance="$(levenshtein "$a" "$b")"
    local max=${#a}
    (( ${#b} > max )) && max=${#b}
    printf "%s" $(((max-distance)*100/max))
}

save_config() {
cat > "$CONFIG_FILE" <<EOF
RAM=$(printf '%q' "$RAM")
JAVA_FLAGS=$(printf '%q' "$JAVA_FLAGS")
SERVER_JAR=$(printf '%q' "$SERVER_JAR")
SERVER_JAR_GLOB=$(printf '%q' "$SERVER_JAR_GLOB")
EOF
}

search_plugins() {
    local query="$1"
    local encoded
    encoded="$(urlencode "$query")"
    local facets='[["project_type:plugin"],["categories:paper"],["versions:1.21.11"]]'
    local url="${MODRINTH_API}/search?query=${encoded}&facets=$(urlencode "$facets")&limit=20&index=relevance"
    api_get "$url"
}

get_project_version() {
    local project_id="$1"
    local loaders
    local versions
    loaders="$(urlencode '["paper"]')"
    versions="$(urlencode '["1.21.11"]')"
    local url="${MODRINTH_API}/project/${project_id}/version?loaders=${loaders}&game_versions=${versions}"
    local data
    data="$(api_get "$url")" || return 1

    jq -c '
    [
        .[]
        | select(
            .version_type=="release"
            or .version_type=="beta"
            or .version_type=="alpha"
        )
        | . as $v
        | (
            $v.files
            | map(select(.filename | endswith(".jar")))
            | .[0]
        ) as $f
        | select($f != null)
        | {
            id:$v.id,
            version_number:$v.version_number,
            version_type:$v.version_type,
            date_published:$v.date_published,
            file:{
                url:$f.url,
                filename:$f.filename,
                size:($f.size // 0),
                sha1:($f.hashes.sha1 // "")
            }
        }
    ]
    | sort_by(.date_published)
    | reverse
    | .[0]
    // empty
    ' <<< "$data"
}

download_plugin_advanced() {
    local url="$1"
    local filename="$2"
    local expected_sha1="$3"

    local tmp="$PLUGIN_DIR/.${filename}.part"
    local target="$PLUGIN_DIR/$filename"

    echo -e "\n${VIOLET}◈ Awakening plugin...${RESET}"

    if curl -fL --retry 3 --connect-timeout 10 --max-time 300 -A "$USER_AGENT" --progress-bar "$url" -o "$tmp"; then
        if [[ -n "$expected_sha1" ]] && command -v sha1sum >/dev/null 2>&1; then
            local actual
            actual="$(sha1sum "$tmp" | awk '{print $1}')"
            if [[ "$actual" != "$expected_sha1" ]]; then
                rm -f "$tmp"
                echo -e "${RED}✖ SHA-1 verification failed.${RESET}"
                pause
                return 1
            fi
        fi
        mv -f "$tmp" "$target"
        echo -e "\n${GREEN}✓ PLUGIN AWAKENED${RESET}"
        echo -e "${GRAY}$target${RESET}"
    else
        rm -f "$tmp"
        echo -e "${RED}✖ Download failed.${RESET}"
    fi
    pause
}

plugin_search_menu() {
    header
    echo -e "${LPURPLE}${BOLD}◆ PLUGIN SEARCH${RESET}"
    echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"

    read -rp "$(echo -e "${WHITE}Plugin name: ${RESET}")" query
    [[ -n "$query" ]] || {
        echo -e "${RED}Plugin name cannot be empty.${RESET}"
        pause
        return
    }

    echo -e "\n${VIOLET}◈ Searching the Shadow Archive...${RESET}"
    local data
    data="$(search_plugins "$query")" || {
        echo -e "${RED}✖ Modrinth API request failed.${RESET}"
        pause
        return
    }

    local count
    count="$(jq '.hits | length' <<< "$data")"
    ((count > 0)) || {
        echo -e "${RED}✖ No plugin found.${RESET}"
        pause
        return
    }

    local -a matches=()
    local i
    for ((i=0;i<count;i++)); do
        local project_id title author description downloads score version
        project_id="$(jq -r ".hits[$i].project_id" <<< "$data")"
        title="$(jq -r ".hits[$i].title" <<< "$data")"
        author="$(jq -r ".hits[$i].author // \"Unknown\"" <<< "$data")"
        description="$(jq -r ".hits[$i].description // \"\"" <<< "$data")"
        downloads="$(jq -r ".hits[$i].downloads // 0" <<< "$data")"

        score="$(similarity "$query" "$title")"
        ((score >= 55)) || continue

        version="$(get_project_version "$project_id" 2>/dev/null || true)"
        [[ -n "$version" ]] || continue

        matches+=("$score"$'\t'"$project_id"$'\t'"$title"$'\t'"$author"$'\t'"$description"$'\t'"$downloads"$'\t'"$version")
    done

    if ((${#matches[@]}==0)); then
        echo -e "\n${RED}✖ No sufficiently close Paper 1.21.11 plugin match.${RESET}"
        echo -e "${GRAY}The Shadow Monarch rejected weak matches.${RESET}"
        pause
        return
    fi

    IFS=$'\n'
    matches=($(printf '%s\n' "${matches[@]}" | sort -t$'\t' -k1,1nr))
    unset IFS

    echo -e "\n${GREEN}✓ Compatible plugins found:${RESET}\n"

    local n=1
    local row
    for row in "${matches[@]:0:10}"; do
        IFS=$'\t' read -r score project_id title author description downloads version <<< "$row"
        local version_number version_type filename
        version_number="$(jq -r '.version_number' <<< "$version")"
        version_type="$(jq -r '.version_type' <<< "$version")"
        filename="$(jq -r '.file.filename' <<< "$version")"

        echo -e "${LPURPLE}[$n]${RESET} ${BOLD}$title${RESET} ${GRAY}— $score%% match${RESET}"
        echo -e "    ${GRAY}Author:${RESET} $author"
        echo -e "    ${GRAY}Version:${RESET} $version_number"
        echo -e "    ${GRAY}Type:${RESET} $version_type"
        echo -e "    ${GRAY}Jar:${RESET} $filename"
        echo -e "    ${GRAY}${description:0:150}${RESET}\n"
        ((n++))
    done

    read -rp "$(echo -e "${WHITE}Select [1-${#matches[@]}] or 0 to cancel: ${RESET}")" choice
    [[ "$choice" =~ ^[0-9]+$ ]] || return
    ((choice==0)) && return
    ((choice>=1 && choice<=${#matches[@]})) || {
        echo -e "${RED}Invalid selection.${RESET}"
        pause
        return
    }

    local selected="${matches[$((choice-1))]}"
    IFS=$'\t' read -r score project_id title author description downloads version <<< "$selected"
    local version_number filename url sha1
    version_number="$(jq -r '.version_number' <<< "$version")"
    filename="$(jq -r '.file.filename' <<< "$version")"
    url="$(jq -r '.file.url' <<< "$version")"
    sha1="$(jq -r '.file.sha1' <<< "$version")"

    header
    echo -e "${LPURPLE}${BOLD}◆ PLUGIN AWAKENED${RESET}"
    echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
    echo -e "${WHITE}Name       :${RESET} $title"
    echo -e "${WHITE}Author     :${RESET} $author"
    echo -e "${WHITE}Minecraft  :${RESET} $MC_VERSION"
    echo -e "${WHITE}Platform   :${RESET} $LOADER"
    echo -e "${WHITE}Version    :${RESET} $version_number"
    echo -e "${WHITE}Match      :${RESET} $score%"
    echo -e "${WHITE}Jar        :${RESET} $filename"
    echo -e "${WHITE}Destination:${RESET} $PLUGIN_DIR/$filename"
    echo -e "\n${GREEN}✓ Compatibility verified.${RESET}"

    read -rp "$(echo -e "${WHITE}Download? [Y/n]: ${RESET}")" ans
    ans="${ans:-Y}"
    [[ "$ans" =~ ^[Yy]$ ]] || return

    download_plugin_advanced "$url" "$filename" "$sha1"
}

installed_plugins() {
    header
    echo -e "${LPURPLE}${BOLD}◆ INSTALLED PLUGINS${RESET}"
    echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"

    shopt -s nullglob
    local files=("$PLUGIN_DIR"/*.jar)
    shopt -u nullglob

    if ((${#files[@]}==0)); then
        echo -e "${GRAY}No plugins installed.${RESET}"
        pause
        return
    fi

    local i=1
    for file in "${files[@]}"; do
        echo -e "${LPURPLE}%2d.${RESET} $(basename "$file") ${GRAY}($(du -h "$file" | awk '{print $1}'))${RESET}"
        ((i++))
    done
    echo -e "\n${GRAY}Total: ${#files[@]} plugin(s)${RESET}"
    pause
}

remove_plugin() {
    header
    echo -e "${LPURPLE}${BOLD}◆ REMOVE PLUGIN${RESET}"
    echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"

    shopt -s nullglob
    local files=("$PLUGIN_DIR"/*.jar)
    shopt -u nullglob

    ((${#files[@]})) || {
        echo -e "${GRAY}No plugins installed.${RESET}"
        pause
        return
    }

    local i=1
    for file in "${files[@]}"; do
        echo -e "${LPURPLE}[$i]${RESET} $(basename "$file")"
        ((i++))
    done

    read -rp "$(echo -e "${WHITE}Plugin number: ${RESET}")" n
    [[ "$n" =~ ^[0-9]+$ ]] || return
    ((n>=1 && n<=${#files[@]})) || return

    local file="${files[$((n-1))]}"
    read -rp "$(echo -e "${YELLOW}Remove $(basename "$file")? [y/N]: ${RESET}")" ans
    [[ "$ans" =~ ^[Yy]$ ]] || return

    rm -f -- "$file"
    echo -e "${GREEN}✓ Plugin removed.${RESET}"
    pause
}

backup_plugins() {
    header
    echo -e "${LPURPLE}${BOLD}◆ PLUGIN BACKUP${RESET}"
    echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"

    local timestamp
    timestamp="$(date '+%Y-%m-%d_%H-%M-%S')"
    local archive="$BACKUP_DIR/plugins_${timestamp}.tar.gz"

    if tar -czf "$archive" -C "$MC_DIR" plugins 2>/dev/null; then
        echo -e "${GREEN}✓ Backup created.${RESET}"
        echo "$archive"
    else
        echo -e "${RED}✖ Backup failed.${RESET}"
    fi
    pause
}

shadow_plugin_menu() {
    while true; do
        header
        echo -e "${PURPLE} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${PURPLE} ║${RESET}           ${WHITE}[ SHADOW MONARCH — PLUGIN PANEL ]${RESET}              ${PURPLE}║${RESET}"
        echo -e "${PURPLE} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${BRIGHT_PURPLE}[1]${RESET} 🔎 Search & Download Plugin"
        echo -e "  ${BRIGHT_PURPLE}[2]${RESET} 📦 Installed Plugins"
        echo -e "  ${BRIGHT_PURPLE}[3]${RESET} 🗑️ Remove Plugin"
        echo -e "  ${BRIGHT_PURPLE}[4]${RESET} 💾 Backup Plugins"
        echo -e "  ${RED}[0] ⬅ Back to Command Center${RESET}"
        echo
        echo -ne "${PURPLE}  nightlord@plugin-panel:~# ${RESET}"
        read sp_choice

        case $sp_choice in
        1) plugin_search_menu ;;
        2) installed_plugins ;;
        3) remove_plugin ;;
        4) backup_plugins ;;
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
        echo -e "${PURPLE} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${PURPLE} ║${RESET}               ${WHITE}[ GOD-TIER MONARCH UTILITIES ]${RESET}              ${PURPLE}║${RESET}"
        echo -e "${PURPLE} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${BRIGHT_PURPLE}[1]${RESET} 🧹 Purge Server Cache & Junk Files"
        echo -e "  ${BRIGHT_PURPLE}[2]${RESET} ⚠️ Wipe World Data ${GRAY}(Fresh Dungeon Reset)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[3]${RESET} 📁 Open Direct Shell Terminal in Server Dir"
        echo -e "  ${BRIGHT_PURPLE}[4]${RESET} 🛠️ Auto-Fix Paper/Server Permissions"
        echo -e "  ${RED}[0] ⬅ Back to Previous Menu${RESET}"
        echo
        echo -ne "${PURPLE}  nightlord@utilities:~# ${RESET}"
        read util_choice

        case $util_choice in
        1)
            echo -e "${YELLOW} 🧹 Purging useless logs, crash reports, and temp files...${RESET}"
            rm -rf "$MC_DIR/logs/"*.gz "$MC_DIR/crash-reports/"* "$MC_DIR/cache/"*
            echo -e "${GREEN} ✔ Domain Cleaned Successfully! Maximum performance restored.${RESET}"
            pause
            ;;
        2)
            echo -e "${RED} ⚠️ WARNING: This will completely destroy all blocks, builds, and players in the world folder!${RESET}"
            echo -ne "${YELLOW} Are you sure you want to reset NightLord's world? (y/N): ${RESET}"
            read confirm_wipe
            if [[ "$confirm_wipe" =~ ^[Yy]$ ]]; then
                rm -rf "$WORLD_DIR" "$MC_DIR/world_nether" "$MC_DIR/world_the_end"
                echo -e "${GREEN} ✔ World wiped successfully. A fresh dungeon awaits your command!${RESET}"
            else
                echo -e "${YELLOW} ❖ Wipe aborted. Your world is safe.${RESET}"
            fi
            pause
            ;;
        3)
            echo -e "${CYAN} 🚀 Entering interactive sub-shell inside $MC_DIR. Type 'exit' to return.${RESET}"
            cd "$MC_DIR" || return
            bash
            ;;
        4)
            echo -e "${CYAN} 🛠️ Fixing ownership and execution permissions for server files...${RESET}"
            chmod +x "$MC_DIR/server.jar" 2>/dev/null
            find "$MC_DIR" -type f -name "*.sh" -exec chmod +x {} \; 2>/dev/null
            echo -e "${GREEN} ✔ Permissions normalized under Monarch authority!${RESET}"
            pause
            ;;
        0) break ;;
        *) echo -e "${RED} Invalid Selection!${RESET}"; sleep 1 ;;
        esac
    done
}

# ==========================
# 🎮 COMMAND & BUILD CENTER
# ==========================
mc_cb_menu() {
    while true; do
        header
        echo -e "${PURPLE} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${PURPLE} ║${RESET}               ${WHITE}[ COMMAND & BUILD CENTER ]${RESET}                 ${PURPLE}║${RESET}"
        echo -e "${PURPLE} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${BRIGHT_PURPLE}[1]${RESET} 🚀 Setup Server Gate"
        echo -e "  ${BRIGHT_PURPLE}[2]${RESET} 🎮 Awaken/Run Server Engine"
        echo -e "  ${BRIGHT_PURPLE}[3]${RESET} 🔌 Shadow Soldier Plugins ${GRAY}(Advanced Modrinth System)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[4]${RESET} 📦 Shadow Backup Vault"
        echo -e "  ${BRIGHT_PURPLE}[5]${RESET} 🔮 God-Tier Monarch Utilities"
        echo -e "  ${RED}[0] ⬅ Back to Main System${RESET}"
        echo
        echo -ne "${PURPLE}  nightlord@command-center:~# ${RESET}"
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
        echo -e "${PURPLE} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${PURPLE} ║${RESET}                ${WHITE}[ STATUS & RAM MANAGER ]${RESET}                  ${PURPLE}║${RESET}"
        echo -e "${PURPLE} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${BRIGHT_PURPLE}[1]${RESET} Auto-Detect Stat Cap ${GRAY}(Smart RAM Optimize)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[2]${RESET} Allocate Custom Stat Power ${GRAY}(Custom RAM)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[3]${RESET} View Current Monarch Profile"
        echo -e "  ${RED}[0] Back to Main System${RESET}"
        echo
        echo -ne "${PURPLE}  nightlord@status-mgr:~# ${RESET}"
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

        echo -e "${PURPLE} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${PURPLE} ║${NC}             ${WHITE}[ SYSTEM: SHADOW MONARCH TUNNEL ]${NC}              ${PURPLE}║${RESET}"
        echo -e "${PURPLE} ╚════════════════════════════════════════════════════════════╝${RESET}"
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
        echo -ne "${PURPLE}  nightlord@tunnel-hub:~# ${RESET}"
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
        echo -ne "${PURPLE}  nightlord@tools-hub:~# ${RESET}"
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
        echo -ne "${PURPLE}  nightlord@blueprint:~# ${RESET}"
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
    local URL="https://github.com/NightLord-pro/NightLordNotTools/tree/main/PETROTOOLS/EXTENSIONS"
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
        echo -ne "${PURPLE}  nightlord@extensions:~# ${RESET}"
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
        local THEME_URL="https://github.com/NightLord-pro/NightLordNotTools/tree/main/PETROTOOLS/ui"

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
        echo -ne "${PURPLE}  nightlord@theme:~# ${RESET}"
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
        echo "   ╚═╝     ╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝         ╚═╝   "
        echo -e "${RESET}"
        echo -e "${CYAN}               MADE BY NIGHTLORD               ${RESET}"
        echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
        echo
        echo -e "  ${BRIGHT_PURPLE}[1]${RESET} 📋 BLUEP"
        echo -e "  ${BRIGHT_PURPLE}[2]${RESET} 🧩 EXTEN"
        echo -e "  ${BRIGHT_PURPLE}[3]${RESET} 🎨 THEME"
        echo -e "  ${RED}[0]${RESET} ⬅ Back to Main System"
        echo
        echo -ne "${PURPLE}  nightlord@petrotools:~# ${RESET}"
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
        echo -e "${PURPLE} ╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${PURPLE} ║${RESET}            ${WHITE}[ SHADOW MONARCH PANELS HUB ]${RESET}              ${PURPLE}║${RESET}"
        echo -e "${PURPLE} ╚════════════════════════════════════════════════════════════╝${RESET}"
        echo
        echo -e "  ${BRIGHT_PURPLE}[1]${RESET} 🚀 NTH ${GRAY}(NTH MY OWN PANEL - Installed via Official Script)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[2]${RESET} ⚡ jtg ${GRAY}(JishnuTheGamer Panel Suite)${RESET}"
        echo -e "  ${BRIGHT_PURPLE}[3]${RESET} 🛡️ Pterodactyl Panel Suite"
        echo -e "  ${RED}[0] ⬅ Back to Main System${RESET}"
        echo
        echo -ne "${PURPLE}  nightlord@panels-hub:~# ${RESET}"
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

    echo -e "${PURPLE} ══ 🌟 NIGHTLORD'S SHADOW MONARCH DASHBOARD v11.0 ══${RESET}"
    
    # --- UPDATED CLEAN MENU ---
    echo ""
    printf "  \033[1;36m[1]\033[0m ⚔️ Command & Build Center       \033[1;36m[4]\033[0m ⚡ Panels Installer Hub\n"
    echo ""
    printf "  \033[1;36m[2]\033[0m ⚙️ Status & RAM Manager        \033[1;36m[5]\033[0m 🪽 Install Wings (Daemon)\n"
    echo ""
    printf "  \033[1;36m[3]\033[0m 🛠️ TOOLS                       \033[1;36m[6]\033[0m 🛠️ PETRO_T\n"
    echo ""
    echo -e "${CYAN}                MADE BY NIGHTLORD               ${RESET}"
    echo ""
    printf "  \033[1;31m[0]\033[0m ❌ Close System / Log Out\n"
    echo ""
    
    echo -e "${GRAY}──────────────────────────────────────────────────────────────${RESET}"
    echo
    echo -ne "${PURPLE}  nightlord@shadow-monarch:~# ${RESET}"
    read main_choice

    case $main_choice in
    1) mc_cb_menu ;;
    2) settings ;;
    3) tools_menu ;;
    4) panels_menu ;;
    5) wings_setup ;;
    6) petro_tools_menu ;;
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

