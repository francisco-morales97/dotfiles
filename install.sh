#!/bin/sh

# Definir variables
GREEN="\033[0;32m"
RED="\033[0;31m"
BOLD="\033[1m"
NC="\033[0m"

printf "${GREEN}${BOLD}Instalando mis configuraciones${NC}\n"
sleep 1
rsync -a .zshenv ~/
rsync -a bin ~/.local/

if [ -e ~/.config/tmux ]; then
    rsync -a xdg_config_home/tmux.conf ~/.config/tmux/
else
    mkdir ~/.config/tmux
    rsync -a xdg_config_home/tmux.conf ~/.config/tmux/
fi

rsync -a xdg_config_home/* ~/.config/
rsync -a xdg_data_home/* ~/.local/share/
echo

printf "${GREEN}${BOLD}Las configuraciones han sido transferidas${NC}\n"
