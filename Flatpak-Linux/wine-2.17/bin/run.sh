#!/bin/bash
mkdir -p /tmp/wine.9856.prefix/
export WINEPREFIX=$HOME/.local/share/flatpak-linux/Cuphead/
export WINEDLLOVERRIDES="mscoree=d;mshtml=d;"
export WINEEXE="/app/bin/wine"

cd "/app/cuphead"

if [ -e Flatpak-Linux.md ] ; then
	cat Flatpak-Linux.md | sed -e "s|FLATPAKNAME|org.flatpaklinux.Cuphead|" -e "s|WINEPREFIX|$WINEPREFIX|"
fi

if [ "$1" == "winecfg" ] ; then
	/app/bin/wine winecfg
elif [ "$1" == "bash" ] ; then
	bash 
elif [ -e run.sh ] ; then
	sh run.sh $@
	exit 0
else
	/app/bin/wine "Cuphead.exe" $@
	exit 0
fi
