#!/bin/bash

# Renkler
GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

clear
echo "=================================================="
echo "      MySQL DİZİN BULUCU (DEDEKTİF)"
echo "=================================================="
echo -e "${CYAN}MySQL kurulum dizini aranıyor, lütfen bekleyin...${NC}"

# 1. AŞAMA: Hızlı Kontrol (which ve yaygın yollar)
QUICK_FIND=$(which mysql 2>/dev/null)

if [ ! -z "$QUICK_FIND" ]; then
    MYSQL_BIN_PATH=$(dirname "$QUICK_FIND")
    echo -e "${GREEN}✔ Hızlı tarama ile bulundu:${NC} $MYSQL_BIN_PATH"
else
    # 2. AŞAMA: /usr dizini taraması
    echo -e "${CYAN}Hızlı taramada bulunamadı. /usr dizini taranıyor...${NC}"
    USR_FIND=$(find /usr -name "mysql" -type d 2>/dev/null | head -n 1)
    
    if [ ! -z "$USR_FIND" ]; then
        MYSQL_BIN_PATH="$USR_FIND"
        echo -e "${GREEN}✔ /usr içinde bulundu:${NC} $MYSQL_BIN_PATH"
    else
        # 3. AŞAMA: Tüm disk taraması (Son çare)
        echo -e "${RED}Dikkat: /usr içinde bulunamadı. Tüm disk taranıyor...${NC}"
        echo -e "${RED}(Bu işlem birkaç dakika sürebilir ve şifre isteyebilir)${NC}"
        
        # Tüm disk taraması için sudo gerekebilir, daha geniş sonuç için:
        ROOT_FIND=$(find / -name "mysql" -type d 2>/dev/null | grep -E "bin/mysql|usr/local/mysql" | head -n 1)
        
        if [ ! -z "$ROOT_FIND" ]; then
            MYSQL_BIN_PATH="$ROOT_FIND"
            echo -e "${GREEN}✔ Derin tarama ile bulundu:${NC} $MYSQL_BIN_PATH"
        else
            echo -e "${RED}❌ Üzgünüm, MySQL hiçbir yerde bulunamadı!${NC}"
            read -p "Kapatmak için Enter'a basın..."
            exit 1
        fi
    fi
fi

echo "--------------------------------------------------"
echo -e "${CYAN}Klasör açılıyor...${NC}"
sleep 1

# Klasörü Finder'da aç
open "$MYSQL_BIN_PATH"

echo -e "${GREEN}İşlem tamamlandı!${NC}"
echo "=================================================="
read -p "Çıkmak için Enter'a basın..."
