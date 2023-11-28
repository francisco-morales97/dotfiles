# Ejecutar scripts locales
typeset -U path PATH
path=(~/.local/bin $path)
export PATH

# Definicion de variables
export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export LESSHISTFILE=-
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PASSWORD_STORE_DIR=$XDG_DATA_HOME/pass
export GNUPGHOME=$XDG_DATA_HOME/gnupg
