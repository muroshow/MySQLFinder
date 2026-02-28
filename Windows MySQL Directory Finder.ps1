{\rtf1\ansi\ansicpg1254\cocoartf2867
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 # UTF-8 Deste\uc0\u287 i (T\'fcrk\'e7e karakterler i\'e7in)\
$OutputEncoding = [System.Text.Encoding]::UTF8\
\
# Sistem dili kontrol\'fc\
$Culture = Get-Culture\
if ($Culture.Name -like "tr*") \{\
    $L_TITLE = "Windows MySQL D\uc0\u304 Z\u304 N BULMA S\u304 H\u304 RBAZI"\
    $L_STEP1 = "H\uc0\u305 zl\u305  tarama yap\u305 l\u305 yor (Environment)..."\
    $L_STEP2 = "Program Files dizini taran\uc0\u305 yor..."\
    $L_STEP3 = "T\'fcm disklerde derin tarama yap\uc0\u305 l\u305 yor..."\
    $L_RESULT = "\uc0\u9989  MySQL D\u304 Z\u304 N\u304  BA\u350 ARIYLA BULUNDU"\
    $L_PATH = "Bulundu\uc0\u287 u konum:"\
    $L_COPY = "\uc0\u55357 \u56523  Yol panoya kopyaland\u305  ve Klas\'f6r a\'e7\u305 l\u305 yor..."\
    $L_DONE = "\uc0\u10024  \u304 \u351 lem ba\u351 ar\u305 yla tamamland\u305 ."\
    $L_NOT_FOUND = "\uc0\u10060  MySQL bulunamad\u305 !"\
    $L_EXIT = "Kapatmak i\'e7in Enter'a bas\uc0\u305 n..."\
    $L_DEV = "Geli\uc0\u351 tirici:"\
\} else \{\
    $L_TITLE = "Windows MySQL DIRECTORY FINDER WIZARD"\
    $L_STEP1 = "Running quick scan (Environment)..."\
    $L_STEP2 = "Scanning Program Files..."\
    $L_STEP3 = "Deep scanning all drives..."\
    $L_RESULT = "\uc0\u9989  MySQL DIRECTORY FOUND SUCCESSFULLY"\
    $L_PATH = "Found Location:"\
    $L_COPY = "\uc0\u55357 \u56523  Path copied to clipboard and Folder is opening..."\
    $L_DONE = "\uc0\u10024  Process completed successfully."\
    $L_NOT_FOUND = "\uc0\u10060  MySQL not found!"\
    $L_EXIT = "Press Enter to close..."\
    $L_DEV = "Developer:"\
\}\
\
# Renk Tan\uc0\u305 mlar\u305  (ANSI)\
$E = [char]27\
$CYAN = "$E[0;36m"\
$GREEN = "$E[0;32m"\
$WHITE = "$E[1;37m"\
$BOLD_WHITE = "$E[1;97m"\
$GRAY = "$E[0;90m"\
$ORANGE = "$E[0;33m"\
$LINKEDIN_BLUE = "$E[1;34m"\
$NC = "$E[0m"\
\
# --- BA\uc0\u350 LANGI\'c7 EKRANI ---\
Clear-Host\
Write-Host "$\{CYAN\}==================================================$\{NC\}"\
Write-Host "$\{WHITE\}      $L_TITLE$\{NC\}"\
Write-Host "$\{CYAN\}==================================================$\{NC\}"\
Write-Host ""\
\
function Log-Step($msg) \{\
    Write-Host " $\{GRAY\}[\'95]$\{NC\} $msg"\
    Start-Sleep -Milliseconds 500\
\}\
\
# 1. ADIM: Environment Path kontrol\'fc\
Log-Step "$L_STEP1"\
$MYSQL_PATH = Get-Command mysql.exe -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source\
if ($MYSQL_PATH) \{\
    $MYSQL_BIN_PATH = Split-Path -Path $MYSQL_PATH\
\} else \{\
    # 2. ADIM: Program Files Taramas\uc0\u305 \
    Log-Step "$L_STEP2"\
    $SearchPaths = @("$env:ProgramFiles\\MySQL", "$env:ProgramFiles(x86)\\MySQL")\
    foreach ($path in $SearchPaths) \{\
        if (Test-Path $path) \{\
            $found = Get-ChildItem -Path $path -Filter "mysql.exe" -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1\
            if ($found) \{ $MYSQL_BIN_PATH = $found.DirectoryName; break \}\
        \}\
    \}\
\}\
\
if (-not $MYSQL_BIN_PATH) \{\
    # 3. ADIM: Derin Tarama (T\'fcm C: s\'fcr\'fcc\'fcs\'fc)\
    Log-Step "$L_STEP3"\
    $found = Get-ChildItem -Path "C:\\" -Filter "mysql.exe" -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1\
    if ($found) \{ $MYSQL_BIN_PATH = $found.DirectoryName \}\
\}\
\
# --- SONU\'c7 PANEL\uc0\u304  ---\
Write-Host ""\
if ($MYSQL_BIN_PATH) \{\
    # \uc0\u304 \u351 lemler: Panoya Kopyala ve Klas\'f6r\'fc A\'e7\
    $MYSQL_BIN_PATH | Set-Clipboard\
    \
    Write-Host "  $\{GREEN\}$L_RESULT$\{NC\}"\
    Write-Host "  $\{WHITE\}--------------------------------------------------$\{NC\}"\
    Write-Host "  $\{WHITE\}$L_PATH$\{NC\}"\
    Write-Host "  $\{ORANGE\}$MYSQL_BIN_PATH$\{NC\}"\
    Write-Host "  $\{WHITE\}--------------------------------------------------$\{NC\}"\
    Write-Host ""\
    Write-Host "  $\{CYAN\}$L_COPY$\{NC\}"\
    \
    Invoke-Item $MYSQL_BIN_PATH\
    \
    Write-Host ""\
    Write-Host "  $\{GREEN\}$L_DONE$\{NC\}"\
\} else \{\
    Write-Host "  $\{E\}[0;31m$L_NOT_FOUND$\{NC\}"\
\}\
\
# --- \uc0\u304 MZA VE \u304 LET\u304 \u350 \u304 M ---\
Write-Host ""\
Write-Host "$\{CYAN\}==================================================$\{NC\}"\
Write-Host "  $\{GRAY\}$L_DEV $\{BOLD_WHITE\}Muharrem AKTAS$\{NC\}"\
Write-Host "  $\{GRAY\}Github:   $\{WHITE\}https://github.com/muroshow/$\{NC\}"\
Write-Host "  $\{GRAY\}LinkedIn: $\{LINKEDIN_BLUE\}https://www.linkedin.com/in/muharremaktas/$\{NC\}"\
Write-Host "$\{CYAN\}==================================================$\{NC\}"\
Read-Host "$L_EXIT"}