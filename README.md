# Fastfetch Theme

A clean, minimalist, Hatsune Miku-themed setup for [Fastfetch](https://github.com/fastfetch-cli/fastfetch).

## Features

- **Custom ASCII Logo:** Replaces the default system logo with a personalized ASCII graphic (`logo.txt`).
- **Structured System Info:** Customized `config.jsonc` highlighting core system specs, OS, terminal, and hardware details with custom color coding and structure.
- **Easy Installation:** Included `install.sh` automated script to copy all files directly to your Fastfetch configuration directory (`~/.config/fastfetch/`).

## Installation

### Prerequisites

Make sure you have **Fastfetch** installed on your Linux / Unix-based environment. *(Note: If you don't have it installed yet, the included `install.sh` script can install it for you in case that u want)*

```bash
# Arch Linux
sudo pacman -S fastfetch

# Ubuntu / Debian
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo apt update && sudo apt install fastfetch

# Fedora
sudo dnf install fastfetch
```

### Quick Setup

1. **Clone this repository:**
   ```bash
   git clone https://github.com/1Dragon-0/fastfetch-theme.git
   cd fastfetch-theme
   ```

2. **Make the installer executable and run it:**
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

3. **Test your setup:**
   ```bash
   fastfetch
   ```

## Repository Structure

```
fastfetch-theme/
├── fastfetch/
│   ├── config.jsonc    # Theme layout & module configuration
│   └── logo.txt        # Custom ASCII logo file
├── install.sh          # Automated installer script
└── README.md           # Documentation
```

## Usage Notes

If you want to manually configure or edit the theme:
- Edit `~/.config/fastfetch/config.jsonc` to change system modules or colors.
- Replace `~/.config/fastfetch/logo.txt` with your own ASCII art.

---

> *This is my first attempt at making a theme for Fastfetch as I'm quite new to this world! Feedback and suggestions are welcome.*

*Created by [1Dragon-0](https://github.com/1Dragon-0)*