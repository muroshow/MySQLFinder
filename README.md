# 🔍 macOS MySQL Directory Finder (Wizard) 🧙‍♂️

Finding the MySQL installation directory (Path) on macOS systems can sometimes turn into a nightmare. This lightweight and smart script tracks down MySQL, locates its path, and opens the folder for you within seconds.

## ✨ Features

- **🌍 Automatic Language Support:** Detects your system language. It runs in Turkish for Turkish systems and English for everyone else.
- **🧙‍♂️ Wizard Interface:** Provides a modern, clean terminal UI that shows process history step-by-step.
- **📋 Auto-Copy to Clipboard:** The detected MySQL path is instantly copied to your clipboard—no manual selection needed.
- **🟠 Orange Path Highlight:** The target directory is highlighted in a vibrant orange color for maximum visibility.
- **🔍 Step-by-Step Scanning:** First checks the most common `/usr` directories (Fast), and if not found, scans the entire disk (Deep).
- **🛡️ Smart Filtering:** Targets only meaningful MySQL directories such as "bin" and "local", eliminating irrelevant results.
- **📂 One-Click Access:** Automatically opens the detected location in **Finder** immediately.
- **🎨 User-Friendly:** Provides real-time process updates with a clean, colored terminal interface.

---

## 🚀 How to Use

### Way-1: One-Click Installation (Fastest)
Open your Terminal and paste the following command. This will download the script to your **Desktop** and set permissions automatically:

```bash
curl -L -o ~/Desktop/"macOs MySQL Directory Finder.command" "https://raw.githubusercontent.com/muroshow/MySQLFinder/main/macOs%20MySQL%20Directory%20Finder.command" && chmod +x ~/Desktop/"macOs MySQL Directory Finder.command"
