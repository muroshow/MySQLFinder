#!/bin/bash

# Sistem dilini daha sağlam bir yöntemle kontrol et
# LANG değişkeni genelde 'tr_TR.UTF-8' veya 'en_US.UTF-8' döner.
if [[ "$LANG" == tr* ]]; then
    # Türkçe Metinler
    L_TITLE="      macOS MySQL DİZİN BULUCU (DEDEKTİF)"
    L_SEARCHING="MySQL kurulum dizini aranıyor, lütfen bekleyin..."
    L_QUICK_FOUND="✔ Hızlı tarama ile bulundu:"
    L_USR_SEARCHING="Hızlı taramada bulunamadı. /usr dizini taranıyor..."
    L_USR_FOUND="✔ /usr içinde bulundu:"
    L_DEEP_WARN="Dikkat: /usr içinde bulunamadı. Tüm disk taranıyor..."
    L_DEEP_TIME="(Bu işlem birkaç dakika sürebilir)"
    L_DEEP_FOUND="✔ Derin tarama ile bulundu:"
    L_NOT_FOUND="❌ Üzgünüm, MySQL hiçbir yerde bulunamadı!"
    L_OPENING="Klasör açılıyor..."
    L_DONE="İşlem tamamlandı!"
    L_EXIT="Çıkmak için Enter'a basın..."
else
    # English Texts (Default)
    L_TITLE="      macOS MySQL DIRECTORY FINDER (DETECTIVE)"
    L_SEARCHING="Searching for MySQL installation path, please wait..."
    L_QUICK_FOUND="✔ Found via quick scan:"
    L_USR_SEARCHING="Not found in quick scan. Searching /usr directory..."
    L_USR_FOUND="✔ Found in /usr:"
    L_DEEP_WARN="Warning: Not found in /usr. Searching entire disk..."
    L_DEEP_TIME="(This process may take a few minutes)"
    L_DEEP_FOUND="✔ Found via deep scan:"
    L_NOT_FOUND="❌ Sorry, MySQL could not be found anywhere!"
    L_OPENING="Opening folder..."
    L_DONE="Process completed!"
    L_EXIT="Press Enter to exit..."
fi

# Renkler
GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

clear
echo "=================================================="
echo "$L_TITLE"
echo "=================================================="
echo -e "${CYAN}$L_SEARCHING${NC}"

# 1. AŞAMA: Hızlı Kontrol
QUICK_FIND=$(which mysql 2>/dev/null)

if [ ! -z "$QUICK_FIND" ]; then
    MYSQL_BIN_PATH=$(dirname "$QUICK_FIND")
    echo -e "${GREEN}$L_QUICK_FOUND${NC} $MYSQL_BIN_PATH"
else
    # 2. AŞAMA: /usr dizini taraması
    echo -e "${CYAN}$L_USR_SEARCHING${NC}"
    USR_FIND=$(find /usr -name "mysql" -type d 2>/dev/null | head -n 1)
    
    if [ ! -z "$USR_FIND" ]; then
        MYSQL_BIN_PATH="$USR_FIND"
        echo -e "${GREEN}$L_USR_FOUND${NC} $MYSQL_BIN_PATH"
    else
        # 3. AŞAMA: Tüm disk taraması
        echo -e "${RED}$L_DEEP_WARN${NC}"
        echo -e "${RED}$L_DEEP_TIME${NC}"
        
        ROOT_FIND=$(find / -name "mysql" -type d 2>/dev/null | grep -E "bin/mysql|usr/local/mysql" | head -n 1)
        
        if [ ! -z "$ROOT_FIND" ]; then
            MYSQL_BIN_PATH="$ROOT_FIND"
            echo -e "${GREEN}$L_DEEP_FOUND${NC} $MYSQL_BIN_PATH"
        else
            echo -e "${RED}$L_NOT_FOUND${NC}"
            read -p "$L_EXIT"
            exit 1
        fi
    fi
fi

echo "--------------------------------------------------"
echo -e "${CYAN}$L_OPENING${NC}"
sleep 1

# Klasörü Finder'da aç
open "$MYSQL_BIN_PATH"

echo -e "${GREEN}$L_DONE${NC}"
echo "=================================================="
read -p "$L_EXIT"
