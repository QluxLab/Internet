echo "==> Downloading images..."
mkdir .local
docker save -o .local/nginx_alpine.tar nginx:alpine > /dev/null 2>&1
docker save -o .local/adguardhome_latest.tar adguard/adguardhome:latest > /dev/null 2>&1
docker save -o .local/homepage_latest.tar ghcr.io/gethomepage/homepage:latest > /dev/null 2>&1
docker save -o .local/kiwix_serve_latest.tar ghcr.io/kiwix/kiwix-serve:latest > /dev/null 2>&1
docker save -o .local/bookstack_latest.tar lscr.io/linuxserver/bookstack:latest > /dev/null 2>&1
docker save -o .local/mariadb_latest.tar lscr.io/linuxserver/mariadb:latest > /dev/null 2>&1
docker save -o .local/s_pdf_latest.tar frooodle/s-pdf:latest > /dev/null 2>&1
docker save -o .local/open_webui_main.tar ghcr.io/open-webui/open-webui:main > /dev/null 2>&1
docker save -o .local/jellyfin_latest.tar jellyfin/jellyfin:latest > /dev/null 2>&1
docker save -o .local/gitea_latest.tar gitea/gitea:latest > /dev/null 2>&1
docker save -o .local/filebrowser_s6.tar filebrowser/filebrowser:s6 > /dev/null 2>&1
docker save -o .local/vaultwarden_latest.tar vaultwarden/server:latest > /dev/null 2>&1
docker save -o .local/it_tools_latest.tar corentinth/it-tools:latest > /dev/null 2>&1
docker save -o .local/cyberchef_latest.tar mpepping/cyberchef:latest > /dev/null 2>&1
docker save -o .local/excalidraw_latest.tar excalidraw/excalidraw:latest > /dev/null 2>&1
docker save -o .local/uptime_kuma_1.tar louislam/uptime-kuma:1 > /dev/null 2>&1
docker save -o .local/syncthing_latest.tar lscr.io/linuxserver/syncthing:latest > /dev/null 2>&1

echo "==> Downloading Wikipedia content..."
mkdir -p ./wikipedia


echo "Downloading devdocs..."
wget -r -np -nc -c --reject "index.html*" https://ftp.fau.de/kiwix/zim/devdocs/ > /dev/null 2>&1
mv ftp.fau.de/kiwix/zim/devdocs/* ./wikipedia
if [ $? -eq 0 ]; then
    echo "  devdocs downloaded successfully"
else
    echo "  Failed to download devdocs"
fi

if [ "$1" = "--full" ]; then
    echo "Downloading optional content..."
    echo "Downloading English Wikipedia..."
    curl -L -o ./wikipedia/wikipedia_en_all_maxi_2025-06.zim "https://ftp.fau.de/kiwix/zim/wikipedia/wikipedia_en_all_maxi_2025-06.zim" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "  Wikipedia downloaded successfully"
    else
        echo "  Failed to download Wikipedia"
    fi

    echo "Downloading Stack Exchange..."
    curl -L -o ./wikipedia/stackoverflow_com_en_all_2023-11.zim "https://ftp.fau.de/kiwix/zim/stack_exchange/stackoverflow.com_en_all_2023-11.zim" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "  Stack Exchange downloaded successfully"
    else
        echo "  Failed to download Stack Exchange"
    fi
else
    echo "Skipping optional downloads. Use --full flag to download all content."
fi

