curl -L "https://discord.com/api/download?platform=linux&format=deb" -o "/tmp/discord.deb"

if [ ! -f /tmp/discord.deb ]; then
    echo "File not downloaded properly"
    exit 1
fi

apt install -y /tmp/discord.deb
rm -f /tmp/discord.deb
