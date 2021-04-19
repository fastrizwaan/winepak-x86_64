#!/bin/bash
# Script that was used to build this package. Enjoy
# Script Create flatpak
# make_winepak.x86_64.sh AppName AppDirectory/ executable.exe # exe from AppDirectory/App.exe

# Icon: 1st install the program using wine 
# then copy the icon to the 
# cp '~/.local/share/icons/hicolor/256x256/apps/0DE1_FontLab 7.0.png' FontLab7/icon.png

# before running this program, also remove Spaces in folder and exe names, 
# example Fontlab\ 7 to Fontlab7 and Fontlab\ 7.exe to Fontlab7.exe
# This wine is i386 with 6.0 stable built using 
# https://github.com/fastrizwaan/flatpak-wine32
# copy the build-dir/files to wine32-6.0

#Output
echo "1.  Cleaning up previous target		[x]"

#remove target 
rm -rf ./target/


ARGV="$@" ; #saving program creation as commandline.sh

NAME="$1"; shift ;#PROGRAM Name eg. NotepadPP ('+' symbol in Program name like Notepad++ causes error)
APP="$1"; shift  ;#Program directory NotepadPP/ (copied from installed ~/.wine/...)
EXE="$1"; shift  ;#Exe program notepad++.exe, inside subdirectory of $APP i.e., Notepadpp/

NICE_NAME=$(echo $(echo "$NAME" | sed 's/[A-Z]/ \0/g'))
DOT_NAME=$(echo "$NICE_NAME" | tr " " . )
WINEEXE="/app/bin/wine"
ARCH="x86_64"
#WINEVERSION="wine32-6.0-flatpak-wine32"
WINEVERSION="wine-x86_64-6.0"
#WINEVERSION="../runners/proton-x86_64-6.4"
#Output
echo "2.  Creating new target directory	[x]"

mkdir -p target/package/files/lib/i386-linux-gnu 
mkdir -p target/package/files/lib/debug/lib/i386-linux-gnu
mkdir -p target/package/files/lib32
mkdir -p target/package/files/bin
mkdir -p target/package/files/lib
mkdir -p target/package/export/share/applications
mkdir -p target/package/export/share/icons/hicolor/128x128/apps/
mkdir -p target/\[winepak.x86_64\]$DOT_NAME

#Output
echo "3.  Creating run.sh script for sandbox	[x]"

cat << EOF > target/package/files/bin/run.sh
#!/bin/bash
mkdir -p /tmp/wine.$$.prefix/
export WINEPREFIX=~/.local/share/winepak.x86_64/$NAME/
export WINEDLLOVERRIDES="mscoree=d;mshtml=d;"
export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH:/app/lib:/app/lib32:/app/$NAME:/app/lib/wine:/app/lib32/wine:/app/lib/i386-linux-gnu:/app/lib/debug/lib/i386-linux-gnu

export WINEEXE="$WINEEXE"

cd "/app/$(basename "$APP")"

if [ -e winepak.x86_64.md ] ; then
	cat winepak.x86_64.md | sed -e "s|FLATPAKNAME|org.winepak.x86_64.$NAME|" -e "s|WINEPREFIX|\$WINEPREFIX|"
fi

if [ -e winepak.x86_64.reg ] ; then
	$WINEEXE regedit /C winepak.x86_64.reg
fi


if [ "\$1" == "winecfg" ] ; then
	$WINEEXE winecfg
elif [ "\$1" == "regedit" ] ; then
	$WINEEXE regedit
elif [ -e run.sh ] ; then
	sh run.sh \$@
	exit $?
elif [ "\$1" == "bash" ] ; then
	bash 
#elif [ "\$1" == "dxsetup" ] ; then
#	   $WINEEXE /app/$APP/_CommonRedist/DirectX/Jun2010/DXSETUP.exe /SILENT
#	   $WINEEXE /app/$APP/_CommonRedist/vcredist/2010/vcredist_x86.exe /SILENT
#	   $WINEEXE /app/$APP/_CommonRedist/vcredist/2012/vcredist_x86.exe /SILENT
#
#	touch ~/.local/share/winepak.x86_64/$NAME/dxsetup-done.txt
else
# Enable the lines below if dxsetup openal and vcredist is required or 
# run ./run.sh dxsetup
#	if [ ! -f ~/.local/share/winepak.x86_64/$NAME/dxsetup-done.txt ];
#	   then
#           $WINEEXE /app/$APP/_CommonRedist/DirectX/Jun2010/DXSETUP.exe /SILENT
#	   $WINEEXE /app/$APP/_CommonRedist/vcredist/2010/vcredist_x86.exe /SILENT
#	   $WINEEXE /app/$APP/_CommonRedist/vcredist/2012/vcredist_x86.exe /SILENT
#	   touch ~/.local/share/winepak.x86_64/$NAME/dxsetup-done.txt
#        fi

	$WINEEXE "$EXE" \$@
	exit $?
fi
EOF


echo "4.  Creating flatpak metadata 		[x]"

cat << EOF >target/package/metadata
[Application]
name=org.winepak.x86_64.$NAME
runtime=org.freedesktop.Platform/$ARCH/20.08
#runtime=org.freedesktop.Platform.Compat.i386/$ARCH/20.08
command=run.sh

[Context]
features=devel;multiarch;
shared=network;ipc;
sockets=x11;pulseaudio;
devices=all;
allow=multiarch
filesystems=xdg-documents;~/.local/share/winepak.x86_64/:create

[Environment]
WINEDLLOVERRIDES=mscoree=d,mshtml=d
LD_LIBRARY_PATH=/app/lib:/app/lib32

[Extension org.freedesktop.Platform.Compat.i386]
directory=lib/i386-linux-gnu
version=20.08

[Extension org.freedesktop.Platform.GL32]
directory=lib/i386-linux-gnu/GL
subdirectories=true
add-ld-path=lib
download-if=active-gl-driver
enable-if=active-gl-driver
merge-dirs=vulkan/icd.d;glvnd/egl_vendor.d;OpenCL/vendors;lib/dri;lib/d3d;vulkan/explicit_layer.d
version=1.4
versions=20.08;1.4

[Extension org.freedesktop.Platform.VAAPI.Intel]
directory=lib/dri/intel-vaapi-driver
no-autodownload=true
download-if=have-intel-gpu

[Extension org.gnome.Platform.Compat.i386.Debug]
directory=lib/debug/lib/i386-linux-gnu
version=20.08

[Extension io.github.flatpak_wine32.Locale]
directory=share/runtime/locale
autodelete=true
locale-subset=true

[Extension io.github.flatpak_wine32.Debug]
directory=lib/debug
autodelete=true
no-autodownload=true

EOF

echo "5.  Creating flatpak install script	[x]"

cat << EOF >target/\[winepak.x86_64\]$DOT_NAME/install.sh
#!/bin/bash
# Installs game bundle for user.
# You can delete everything after installation.

DIR=\$(dirname "\$0")
set -ex
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo || true
flatpak --user install -y --app --bundle "\$DIR/org.winepak.x86_64.$NAME.flatpak" || echo "Installation failed. Check if you have Flatpak properly configured. See http://flatpak.org/ for more info."
EOF

echo "6.  Creating flatpak uninstall script	[x]"
cat << EOF >target/\[winepak.x86_64\]$DOT_NAME/uninstall.sh
#!/bin/bash
# You can as well use package manager to uninstall the game
echo You can as well use package manager to uninstall the game

set -ex
flatpak --user uninstall org.winepak.x86_64.$NAME
EOF
 
echo "7.  Creating flatpak run script		[x]"
cat << EOF >target/\[winepak.x86_64\]$DOT_NAME/run.sh
#!/bin/bash
set -ex
flatpak run org.winepak.x86_64.$NAME \$@
EOF

echo "8.  Creating desktop shortcut 		[x]"
cat << EOF >target/package/export/share/applications/org.winepak.x86_64.$NAME.desktop
[Desktop Entry]
Version=1.0
Name=$NICE_NAME
Exec=run.sh
Icon=org.winepak.x86_64.$NAME
StartupNotify=true
Terminal=false
Type=Application
Categories=Game;
EOF

echo "9.  Copying icon file	 		[x]"
# If custom icon.png is provided by the flatpak maker
#set -ex
## adding ImageMagicks's convert for different icon support for non gnome desktops
if [ -e "$APP"/icon.png ]; then 
   cp "$APP"/icon.png \
   target/package/export/share/icons/hicolor/128x128/apps/org.winepak.x86_64.$NAME.png;
else
   echo "    Extracting icon from $EXE file"
   # Extract Icon and copy
   # dnf install icoutils ImageMagick
   wrestool -x --output=. -t14 "$APP"/"$EXE" ; #extracts ico file
   convert "*.ico" "hello.png"; #this will get ping files as hello-0...hellol7.png

   #hello-0.png is the highest resolution 256x256 (some has 128x128)
   #so copy hello-0.png as icon
   cp hello-0.png target/package/export/share/icons/\
hicolor/128x128/apps/org.winepak.x86_64.$NAME.png;

fi


#remove ico and png files
rm -f hello-?.png $EXE*.ico

echo "10. Copying all files 	 		[x]"
cp -rd "$APP" target/package/files/
#32 bit wine files are copied to 
cp -rdf ../runners/$WINEVERSION/* target/package/files

chmod +x target/package/files/bin/run.sh
chmod +x target/\[winepak.x86_64\]$DOT_NAME/install.sh
chmod +x target/\[winepak.x86_64\]$DOT_NAME/uninstall.sh
chmod +x target/\[winepak.x86_64\]$DOT_NAME/run.sh
cp "$0" target/package/files/make_winepak.x86_64.sh
echo "$0" "$ARGV" > target/package/files/commandline.sh

echo "11. Building flatpak 			[x]"
echo "Started build-export"
flatpak build-export target/repo target/package && \
echo "Completed Build-export"
echo "Started bundle"
flatpak build-bundle --arch=$ARCH target/repo  target/\[winepak.x86_64\]$DOT_NAME/org.winepak.x86_64.$NAME.flatpak org.winepak.x86_64.$NAME

# removed runtime-repo for offline installation
#flatpak build-bundle --arch=$ARCH target/repo  target/\[winepak.x86_64\]$DOT_NAME/org.winepak.x86_64.$NAME.flatpak org.winepak.x86_64.$NAME --runtime-repo="https://flathub.org/repo/flathub.flatpakrepo"



echo "12. Flatpak made! 			[x]"
