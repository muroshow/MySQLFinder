@echo off
chcp 65001 >nul

:: ============================================================
::  MySQL Finder - Windows
::  Gelistirici : Muharrem AKTAS
::  Github      : https://github.com/muroshow/
::  LinkedIn    : https://www.linkedin.com/in/muharremaktas/
:: ============================================================
::  Cift tikla -> Terminal acilir, MySQL dizinini bulur, 
::  panoya kopyalar, klasoru acar. Enter'a basana kadar
::  pencere ACIK kalir (macOS .command gibi).
:: ============================================================

:: Gecici PS1 dosyasi olustur
set "TMP_PS1=%TEMP%\mysql_finder_tmp.ps1"

(
echo $OutputEncoding = [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
echo.
echo $Culture = Get-Culture
echo if ^($Culture.Name -like "tr*"^) {
echo     $L_TITLE     = "Windows MySQL DiZiN BULMA SiHiRBAZI"
echo     $L_STEP1     = "Hizli tarama yapiliyor ^(Environment^)..."
echo     $L_STEP2     = "Program Files dizini taraniyor..."
echo     $L_STEP3     = "Tum disklerde derin tarama yapiliyor..."
echo     $L_RESULT    = "OK  MySQL DiZiNi BASARIYLA BULUNDU"
echo     $L_PATH      = "Bulundugu konum:"
echo     $L_COPY      = ">>  Yol panoya kopyalandi ve Klasor aciliyor..."
echo     $L_DONE      = "**  Islem basariyla tamamlandi."
echo     $L_NOT_FOUND = "XX  MySQL bulunamadi!"
echo     $L_EXIT      = "Kapatmak icin Enter basin..."
echo     $L_DEV       = "Gelistirici:"
echo } else {
echo     $L_TITLE     = "Windows MySQL DIRECTORY FINDER WIZARD"
echo     $L_STEP1     = "Running quick scan ^(Environment^)..."
echo     $L_STEP2     = "Scanning Program Files..."
echo     $L_STEP3     = "Deep scanning all drives..."
echo     $L_RESULT    = "OK  MySQL DIRECTORY FOUND SUCCESSFULLY"
echo     $L_PATH      = "Found Location:"
echo     $L_COPY      = ">>  Path copied to clipboard and Folder is opening..."
echo     $L_DONE      = "**  Process completed successfully."
echo     $L_NOT_FOUND = "XX  MySQL not found!"
echo     $L_EXIT      = "Press Enter to close..."
echo     $L_DEV       = "Developer:"
echo }
echo.
echo $E=[char]27
echo $CYAN          = "$E[0;36m"
echo $GREEN         = "$E[0;32m"
echo $WHITE         = "$E[1;37m"
echo $BOLD_WHITE    = "$E[1;97m"
echo $GRAY          = "$E[0;90m"
echo $ORANGE        = "$E[0;33m"
echo $LINKEDIN_BLUE = "$E[1;34m"
echo $RED           = "$E[0;31m"
echo $NC            = "$E[0m"
echo.
echo Clear-Host
echo Write-Host "${CYAN}==================================================${NC}"
echo Write-Host "${WHITE}      $L_TITLE${NC}"
echo Write-Host "${CYAN}==================================================${NC}"
echo Write-Host ""
echo.
echo function Log-Step^($msg^) {
echo     Write-Host " ${GRAY}[*]${NC} $msg"
echo     Start-Sleep -Milliseconds 500
echo }
echo.
echo Log-Step $L_STEP1
echo $MYSQL_PATH = Get-Command mysql.exe -ErrorAction SilentlyContinue ^| Select-Object -ExpandProperty Source
echo if ^($MYSQL_PATH^) {
echo     $MYSQL_BIN_PATH = Split-Path -Path $MYSQL_PATH
echo } else {
echo     Log-Step $L_STEP2
echo     $SearchPaths = @^("$env:ProgramFiles\MySQL", "$env:ProgramFiles^(x86^)\MySQL"^)
echo     foreach ^($path in $SearchPaths^) {
echo         if ^(Test-Path $path^) {
echo             $found = Get-ChildItem -Path $path -Filter "mysql.exe" -Recurse -ErrorAction SilentlyContinue ^| Select-Object -First 1
echo             if ^($found^) { $MYSQL_BIN_PATH = $found.DirectoryName; break }
echo         }
echo     }
echo }
echo if ^(-not $MYSQL_BIN_PATH^) {
echo     Log-Step $L_STEP3
echo     $found = Get-ChildItem -Path "C:\" -Filter "mysql.exe" -Recurse -ErrorAction SilentlyContinue ^| Select-Object -First 1
echo     if ^($found^) { $MYSQL_BIN_PATH = $found.DirectoryName }
echo }
echo.
echo Write-Host ""
echo if ^($MYSQL_BIN_PATH^) {
echo     $MYSQL_BIN_PATH ^| Set-Clipboard
echo     Write-Host "  ${GREEN}$L_RESULT${NC}"
echo     Write-Host "  ${WHITE}--------------------------------------------------${NC}"
echo     Write-Host "  ${WHITE}$L_PATH${NC}"
echo     Write-Host "  ${ORANGE}$MYSQL_BIN_PATH${NC}"
echo     Write-Host "  ${WHITE}--------------------------------------------------${NC}"
echo     Write-Host ""
echo     Write-Host "  ${CYAN}$L_COPY${NC}"
echo     Invoke-Item $MYSQL_BIN_PATH
echo     Write-Host ""
echo     Write-Host "  ${GREEN}$L_DONE${NC}"
echo } else {
echo     Write-Host "  ${RED}$L_NOT_FOUND${NC}"
echo }
echo.
echo Write-Host ""
echo Write-Host "${CYAN}==================================================${NC}"
echo Write-Host "  ${GRAY}$L_DEV ${BOLD_WHITE}Muharrem AKTAS${NC}"
echo Write-Host "  ${GRAY}Github:   ${WHITE}https://github.com/muroshow/${NC}"
echo Write-Host "  ${GRAY}LinkedIn: ${LINKEDIN_BLUE}https://www.linkedin.com/in/muharremaktas/${NC}"
echo Write-Host "${CYAN}==================================================${NC}"
echo Read-Host $L_EXIT
) > "%TMP_PS1%"

:: Windows Terminal varsa onu kullan, yoksa PowerShell penceresi
where wt.exe >nul 2>&1
if %errorlevel% == 0 (
    wt.exe powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%TMP_PS1%"
) else (
    start "MySQL Finder" powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%TMP_PS1%"
)
