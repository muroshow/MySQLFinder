#!/bin/bash

# Sistem dili kontrolü (tr ile başlıyorsa Türkçe, değilse İngilizce)
if [[ "$LANG" == tr* ]]; then
    L_TITLE="MacOS MySQL DİZİN BULMA SİHİRBAZI"
    L_STEP1="Hızlı tarama yapılıyor..."
    L_STEP2="/usr dizini taranıyor..."
    L_STEP3="Derin tarama başlatılıyor..."
    L_RESULT="✅ MySQL DİZİNİ BAŞARIYLA BULUNDU"
    L_PATH="Bulunduğu konum:"
    L_COPY="📋 Yol panoya kopyalandı ve Finder açılıyor..."
    L_DONE="✨ İşlem başarıyla tamamlandı."
    L_NOT_FOUND="❌ MySQL bulunamadı!"
    L_EXIT="Kapatmak için Enter'a basın..."
    L_DEV="Geliştirici:"
else
    L_TITLE="MacOS MySQL DIRECTORY FINDER WIZARD"
    L_STEP1="Running quick scan..."
    L_STEP2="Scanning /usr directory..."
    L_STEP3="Starting deep scan..."
    L_RESULT="✅ MySQL DIRECTORY FOUND SUCCESSFULLY"
    L_PATH="Found Location:"
    L_COPY="📋 Path copied to clipboard and Finder is opening..."
    L_DONE="✨ Process completed successfully."
    L_NOT_FOUND="❌ MySQL not found!"
    L_EXIT="Press Enter to close..."
    L_DEV="Developer:"
fi

# Renkler
GREEN='\033[0;32m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD_WHITE='\033[1;97m' # İsim için parlak beyaz
GRAY='\033[0;90m'
ORANGE='\033[0;33m'
LINKEDIN_BLUE='\033[1;34m' # LinkedIn için parlak mavi
NC='\033[0m' # Renk sıfırlama

# --- BAŞLANGIÇ EKRANI ---
clear
echo -e "${CYAN}==================================================${NC}"
echo -e "${WHITE}      $L_TITLE${NC}"
echo -e "${CYAN}==================================================${NC}"
echo ""

# Fonksiyon: Şık Log Yazma
log_step() {
    echo -e " ${GRAY}[•]${NC} $1"
    sleep 0.5
}

# 1. Adım: Hızlı Tarama
log_step "$L_STEP1"
MYSQL_BIN_PATH=$(which mysql 2>/dev/null)

if [ ! -z "$MYSQL_BIN_PATH" ]; then
    MYSQL_BIN_PATH=$(dirname "$MYSQL_BIN_PATH")
else
    # 2. Adım: /usr Taraması
    log_step "$L_STEP2"
    MYSQL_BIN_PATH=$(find /usr -name "mysql" -type d 2>/dev/null | head -n 1)
    
    if [ -z "$MYSQL_BIN_PATH" ]; then
        # 3. Adım: Derin Tarama
        log_step "$L_STEP3"
        MYSQL_BIN_PATH=$(find / -name "mysql" -type d 2>/dev/null | grep -E "bin/mysql|usr/local/mysql" | head -n 1)
    fi
fi

# --- SONUÇ PANELİ ---
echo ""
if [ ! -z "$MYSQL_BIN_PATH" ]; then
    # İşlemler: Panoya Kopyala
    echo "$MYSQL_BIN_PATH" | pbcopy
    
    # Görsel Sonuç Kartı
    echo -e "  ${GREEN}$L_RESULT${NC}"
    echo -e "  ${WHITE}--------------------------------------------------${NC}"
    echo -e "  ${WHITE}$L_PATH${NC}"
    echo -e "  ${ORANGE}$MYSQL_BIN_PATH${NC}"
    echo -e "  ${WHITE}--------------------------------------------------${NC}"
    echo ""
    echo -e "  ${CYAN}$L_COPY${NC}"
    
    # Finder'ı aç
    open "$MYSQL_BIN_PATH"
    
    echo ""
    echo -e "  ${GREEN}$L_DONE${NC}"
else
    echo -e "  ${RED}$L_NOT_FOUND${NC}"
fi

# --- İMZA VE İLETİŞİM ---
echo ""
echo -e "${CYAN}==================================================${NC}"
echo -e "  ${GRAY}$L_DEV ${BOLD_WHITE}Muharrem AKTAS${NC}"
echo -e "  ${GRAY}Github:   ${WHITE}https://github.com/muroshow/${NC}"
echo -e "  ${GRAY}LinkedIn: ${LINKEDIN_BLUE}https://www.linkedin.com/in/muharremaktas/${NC}"
echo -e "${CYAN}==================================================${NC}"
read -p "$L_EXIT"
