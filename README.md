# 🔍 MySQL Finder (macOS)

Finding the MySQL installation directory (Path) on macOS systems can sometimes turn into a nightmare. This lightweight and smart script tracks down MySQL, locates its path, and opens the folder for you within seconds.

## ✨ Features

- **Step-by-Step Scanning:** First checks the most common `/usr` directories (Fast), and if not found, scans the entire disk (Deep).
- **Smart Filtering:** Targets only meaningful MySQL directories such as "bin" and "local", eliminating irrelevant results.
- **One-Click Access:** Automatically opens the detected location in **Finder**.
- **User-Friendly:** Provides real-time process updates with a colored terminal interface.

## 🚀 How to Use

1. Download the `MySQL Finder.command` file from this repository.
2. Move the file to your desktop or any folder you prefer.
3. Grant execution permission via Terminal (Only once):
   ```bash
   chmod +x "MySQL Finder.command"
