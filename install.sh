# Must be downloaded/installed manually:
# - None

INSTALL_DIR="$(pwd)"

sudo apt update
sudo apt upgrade
sudo apt install curl

# "Automatic" downloads
mkdir -p ~/bin
mkdir temp_install
cd temp_install

## Chrome
curl "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -o "chrome.deb"

## Discord
curl -L "https://discord.com/api/download?platform=linux&format=deb" -o "discord.deb"

## Heroic Launcher (Epic Games)
## Not a latest version permalink, hopefully it updates itself
curl -L "https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.18.1/Heroic-2.18.1-linux-amd64.deb" -o "heroic.deb"

## Logic 2
curl -L "https://logic2api.saleae.com/download?os=linux&arch=x64" -o "logic.deb"
chmod +x ./logic.deb
mv ./logic.deb ~/bin/logic

## LTSpice (through Wine)
curl -O "https://ltspice.analog.com/software/LTspice64.msi"

## MikTeX
curl -fsSL "https://miktex.org/download/key" | sudo gpg --dearmor -o /usr/share/keyrings/miktex.gpg
echo "deb [signed-by=/usr/share/keyrings/miktex.gpg] https://miktex.org/download/ubuntu noble universe" | sudo tee /etc/apt/sources.list.d/miktex.list

## Minecraft
curl "https://launcher.mojang.com/download/Minecraft.deb" -o "minecraft.deb"

## Neovim, LazyVim, fonts
curl -L "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage" -o "nvim"
chmod u+x nvim
mv nvim ~/bin/
curl -LO "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/AdwaitaMono.zip"
mkdir -p ~/.local/share/fonts/AdwaitaMono
unzip AdwaitaMono.zip -d ~/.local/share/fonts/AdwaitaMono

## Slack
## Not a latest version permalink, hopefully it updates itself
curl -L "https://downloads.slack-edge.com/desktop-releases/linux/x64/4.47.69/slack-desktop-4.47.69-amd64.deb" -o "slack.deb"

## Spotify
curl "https://download.spotify.com/debian/pubkey_5384CE82BA52C83A.asc" | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

## VeraCrypt
curl -L "https://launchpad.net/veracrypt/trunk/1.26.24/+download/VeraCrypt-1.26.24-x86_64.AppImage" -o "veracrypt"
chmod +x veracrypt
mv veracrypt ~/bin/



# Additional APT repositories
sudo add-apt-repository ppa:kicad/kicad-9.0-releases

sudo apt update
sudo apt install \
	git vim gcc g++ gcc-arm-none-eabi make python3 python3-pip python3.12-venv tmux gdb-multiarch llvm lld dfu-util miktex clang clangd clang-format \
	luarocks ripgrep fzf fd-find clangd npm \
	kicad \
	ssh 7zip htop minicom can-utils cifs-utils tree xclip openssh-server \
	wine-stable spotify-client steam vlc obs-studio inkscape \
	./chrome.deb ./minecraft.deb ./discord.deb ./slack.deb \
	fprintd libpam-fprintd

sudo apt install -f # Fix up errors
sudo apt autoremove --purge # Clean up

sudo npm install markdownlint-cli2 --global

echo "Enable fingerprint sensor support. Use SPACE to select, ENTER for OK, ESC to cancel. ENTER to continue."
read
sudo pam-auth-update # Fingerprint sensor support

wine LTSpice64.msi



# Increase swap size to 8GB
sudo swapoff /swapfile
sudo rm /swapfile
sudo fallocate -l 8G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon --show

# Set kwallet password to empty so networks connect automatically on signin
# Not the most secure, but this is super annoying
echo --------------------
echo KWalletManager GUI will open, click \"Change Password\" and set it to an empty string.
echo -------------------
kwalletmanager5

# Apply symlinks for configuration stuff
rm -f ~/.bashrc
ln -sf "$INSTALL_DIR"/.bashrc      ~/.bashrc
ln -sf "$INSTALL_DIR"/.inputrc     ~/.inputrc
ln -sf "$INSTALL_DIR"/.minicomrc   ~/.minicomrc
ln -sf "$INSTALL_DIR"/.gitconfig   ~/.gitconfig
ln -sf "$INSTALL_DIR"/nvim         ~/.config/nvim
cp "$INSTALL_DIR"/.smbcredentials  ~/
cp -sf "$INSTALL_DIR"/kde/*        ~/.config

# Make minicom and other COM port stuff not require sudo
sudo usermod -a -G dialout $USER

cd ..
rm -rf temp_install

read -p "Reboot now? Enter for yes, Ctrl-C for no"
sudo reboot
