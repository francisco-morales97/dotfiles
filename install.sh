#!/bin/sh

# Definir variables
GREEN="\033[0;32m"
RED="\033[0;31m"
BOLD="\033[1m"
NC="\033[0m"

printf "${GREEN}${BOLD}Instalando mis configuraciones${NC}\n"
sleep 1
mv .zshenv ~/
mv bin ~/.local/
mv -f xdg_config_home/* ~/.config/
mv -f xdg_data_home/* ~/.local/share/
if [ -e ~/.cache ]; then
    mv -f xdg_cache_home/* ~/.cache/
else
    mkdir ~/.cache
    mv -f xdg_cache_home/* ~/.cache/
fi
echo

printf "${GREEN}${BOLD}Las configuraciones han sido transferidas${NC}\n"
