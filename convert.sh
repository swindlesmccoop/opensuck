#!/bin/sh
# convert your suckless builds from linux to openbsd

_conv() {
	mv "$SUCKPATH/$1" "$SUCKPATH/$1.linux"
	cp patches/$2 "$SUCKPATH/$1"
	printf "Build at \033[0;34m$(readlink -f $SUCKPATH)\033[0m has been \033[0;32msuccessfully patched\033[0m.\n"
}

_help() {
	printf "Help function.\n"
	exit 1
}

case $1 in
	dwm|dwmblocks|st|dmenu) true ;;
	*) _help ;;
esac

printf "Please input path to the build you wish to convert (can be relative or absolute): "
read -r SUCKPATH

case "$1" in
	dwm) _conv config.mk dwm_config.mk ;;
	dwmblocks) _conv Makefile dwmblocks_Makefile ;;
	st) _conv config.mk st_config.mk ;;
	dmenu) _conv config.mk dmenu_config.mk ;;
esac