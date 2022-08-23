#!/bin/bash
# Script that was used to build this package. Enjoy
# Script Create flatpak
# make_winepak.x86_64.sh AppName AppDirectory/ executable.exe # exe from AppDirectory/App.exe

# AppName     : The Name you'd like to use for the shortcut and bundle name
# AppDirectory: Copy the install directory usually in Program Files or in C:\Games
# Icon        : winepak tries to extract, if icon not found in AppDirectory.
#               if you want your own icon copy it to AppDirectory/;
# example: To copy fontlab.png, after installing fontlab using wine)
# cp '~/.local/share/icons/hicolor/256x256/apps/0DE1_FontLab 7.0.png' FontLab7/icon.png

# before running this program, also remove Spaces in folder and exe names, 
# example Fontlab\ 7 to Fontlab7 and Fontlab\ 7.exe to Fontlab7.exe
#
# ############### Large Game >3GB issue
# https://github.com/flatpak/flatpak/issues/483
# create swapfile 40GB in ssd for building and 
# installing
# https://github.com/flatpak/flatpak/issues/1765

SCRIPT_NAME="$(realpath -m $0)"
SCRIPT_DIR=$(dirname ${SCRIPT_NAME})

#echo SCRIPT_NAME="$(realpath -m $0)"
#echo SCRIPT_DIR=$(dirname ${SCRIPT_NAME})

# Function Show help
ShowHelp ()
{

  echo "WinePak: Creates a game bundle with wine runner," \
        "direct-play or portable games or apps."
  echo "Usage:" \
       "$0 --runner -n=\"AppName\" -d=\"./AppDirectory\" -e=\"executable.exe\""
  echo "Options:"
  echo "  -h, --help               Show this help"
  echo "  -n, --appname            Name used for the bundle and shortcut"
  echo "  -d, --appdir             App directory copied to the $pwd (./)"
  echo "  -e, --appexe             Exe file name inside the ./appdir"
  echo "  -r, --runner             Use wine runners"

  echo "Available Runners:"
  echo "  wine5  - wine-5.0  stable"
  echo "  wine7  - wine-7.0  stable"
  echo "  proton - Proton-GE stable"
  echo "Examples:"
  echo "$0 --runner=proton -n=\"Notepadpp\" -d=\"./Notepadpp/\" -e=\"notepadpp.exe\""
  echo "$0 --runner=wine5  -n=\"Notepadpp\" -d=\"./Notepadpp/\" -e=\"notepadpp.exe\""
  echo "$0 --runner=wine7  -n=\"Notepadpp\" -d=\"./Notepadpp/\" -e=\"notepadpp.exe\""
  echo ""
}

# parse command line arguments
for i in "$@"
do
case $i in
    -r=*|--runner=*)
    RUNNER="${i#*=}"
    ;;
    -n=*|--appname=*)
    APP_NAME="${i#*=}"
    ;;
    -d=*|--appdir=*)
    APP_DIR="${i#*=}"
    ;;
    -e=*|--appexe=*)
    APP_EXE="${i#*=}"
    ;;
    -h|--help)
    ShowHelp
    exit
    ;;
    *)
    echo "$@"
    echo "Unknown option given!"
    ShowHelp       # unknown option
    exit
    ;;
esac
done


# If no arguments are given show help
if [ $# -lt 4 ];  then
     echo "$0 needs 4 arguments, $# given! see Examples below"
    ShowHelp
    exit
fi

PROTON_URL="https://github.com/fastrizwaan/winepak-x86_64/releases/download/runners/Proton-GE-7.29.tar.zst"
WINE5_URL="https://github.com/fastrizwaan/winepak-x86_64/releases/download/runners/wine-5.0.tar.zst"
WINE7_URL="https://github.com/fastrizwaan/winepak-x86_64/releases/download/runners/wine-7.0.tar.zst"

PROTON_ZST="$(basename ${PROTON_URL})"                       ; # Proton-GE-7.29.tar.zst
PROTON_TAR="$(basename ${PROTON_URL}|sed 's/\.zst//g')"     ; # Proton-GE-7.29.tar
PROTON_DIR="$(basename ${PROTON_URL}|sed 's/\.tar\.zst//g')"; # Proton-GE-7.29

WINE5_ZST="$(basename ${WINE5_URL})"                       ; # wine-5.0.tar.zst
WINE5_TAR="$(basename ${WINE5_URL}|sed 's/\.zst//g')"     ; # wine-5.0.tar
WINE5_DIR="$(basename ${WINE5_URL}|sed 's/\.tar\.zst//g')"; # wine-5.0

WINE7_ZST="$(basename ${WINE7_URL})"                       ; # wine-7.0.tar.zst
WINE7_TAR="$(basename ${WINE7_URL}|sed 's/\.zst//g')"     ; # wine-7.0.tar
WINE7_DIR="$(basename ${WINE7_URL}|sed 's/\.tar\.zst//g')"; # wine-7.0

#echo "$PWD"
RUNNERS_DIR="${SCRIPT_DIR}/runners"

if   [ "${RUNNER}" = "proton" ]; then
       if [ -d "${RUNNERS_DIR}/${PROTON_DIR}" ]; then
            echo "Proton Directory already existing, not downloding"
       else
            echo "Proton Directory not found, downloading and extracting"
            wget -c "${PROTON_URL}" -P ${RUNNERS_DIR}/ ; # Download in runners dir
            zstd -f -d "${RUNNERS_DIR}/${PROTON_ZST}"  ; # uncompress zst file
            mkdir -p "${RUNNERS_DIR}/${PROTON_DIR}"    ; # Create dir
            # extract tar file inside runners/Proton-GE-7.29
            tar -xf "${RUNNERS_DIR}/${PROTON_TAR}" -C "${RUNNERS_DIR}/${PROTON_DIR}"
       fi
       RUNNER="${PROTON_DIR}"
          
elif [ "${RUNNER}" = "wine5" ]; then
       if [ -d "${RUNNERS_DIR}/${WINE5_DIR}" ]; then
            echo "Proton Directory already existing, not downloding"
       else
            echo "Proton Directory not found, downloading and extracting"
            wget -c "${WINE5_URL}" -P ${RUNNERS_DIR}/ ; # Download in runners dir
            zstd -f -d "${RUNNERS_DIR}/${WINE5_ZST}"  ; # uncompress zst file
            mkdir -p "${RUNNERS_DIR}/${WINE5_DIR}"    ; # Create dir
            # extract tar file inside runners/Proton-GE-7.29
            tar -xf "${RUNNERS_DIR}/${WINE5_TAR}" -C "${RUNNERS_DIR}/${WINE5_DIR}"
       fi
       RUNNER="${WINE5_DIR}"
           
elif [ "${RUNNER}" = "wine7" ]; then
       if [ -d "${RUNNERS_DIR}/${WINE7_DIR}" ]; then
            echo "Proton Directory already existing, not downloding"
       else
            echo "Proton Directory not found, downloading and extracting"
            wget -c "${WINE7_URL}" -P ${RUNNERS_DIR}/ ; # Download in runners dir
            zstd -f -d "${RUNNERS_DIR}/${WINE7_ZST}"  ; # uncompress zst file
            mkdir -p "${RUNNERS_DIR}/${WINE7_DIR}"    ; # Create dir
            # extract tar file inside runners/Proton-GE-7.29
            tar -xf "${RUNNERS_DIR}/${WINE7_TAR}" -C "${RUNNERS_DIR}/${WINE7_DIR}"
       fi
       RUNNER="${WINE7_DIR}"
fi
### Variables ###
TARGET_DIR="./target"

#Output
# Remove Target
echo -n "1.  Cleaning up previous target " && rm -rf "${TARGET_DIR}" || exit 1 && echo -e "\t[x]"

ARGV="$@" ; #saving program creation as commandline.sh

NAME="$APP_NAME"; # PROGRAM Name eg. NotepadPP ('+' symbol in Program name like Notepad++ causes error)
APP="$APP_DIR"  ; # Program directory NotepadPP/ (copied from installed ~/.wine/...)
EXE="$APP_EXE"  ; # Exe program notepad++.exe, inside subdirectory of $APP i.e., Notepadpp/

NICE_NAME=$(echo $(echo "${NAME}" | sed 's/[A-Z]/ \0/g'))
DOT_NAME=$(echo "${NICE_NAME}" | tr " " "." )
WINEEXE="/app/bin/wine"
ARCH="x86_64"
#WINEVERSION="wine32-6.0-flatpak-wine32"
#WINEVERSION="wine-x86_64-6.0"
WINEVERSION="${RUNNER}"
#Output
echo -n "2.  Creating new target directory" 

mkdir -p "${TARGET_DIR}/package/files/lib/i386-linux-gnu" \
         "${TARGET_DIR}/package/files/lib/debug/lib/i386-linux-gnu" \
         "${TARGET_DIR}/package/files/lib32" \
         "${TARGET_DIR}/package/files/bin" \
         "${TARGET_DIR}/package/files/lib" \
         "${TARGET_DIR}/package/export/share/applications" \
         "${TARGET_DIR}/package/export/share/icons/hicolor/128x128/apps/" \
         "${TARGET_DIR}/[winepak.x86_64]$DOT_NAME" || exit 1 && echo -e "\t[x]"

# Output
echo -n "3.  Creating run.sh script for sandbox" || exit 1 && echo -e "\t[x]"

cat << EOF > "${TARGET_DIR}/package/files/bin/run.sh"
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


echo -n "4.  Creating flatpak metadata   " || exit 1 && echo -e "\t[x]"

cat << EOF >"${TARGET_DIR}/package/metadata"
[Application]
name=org.winepak.x86_64.$NAME
runtime=org.freedesktop.Platform/$ARCH/21.08
#runtime=org.freedesktop.Platform.Compat.i386/$ARCH/21.08
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
version=21.08

[Extension org.freedesktop.Platform.GL32]
directory=lib/i386-linux-gnu/GL
subdirectories=true
add-ld-path=lib
download-if=active-gl-driver
enable-if=active-gl-driver
merge-dirs=vulkan/icd.d;glvnd/egl_vendor.d;OpenCL/vendors;lib/dri;lib/d3d;vulkan/explicit_layer.d
version=1.4
versions=21.08;1.4

[Extension org.freedesktop.Platform.VAAPI.Intel]
directory=lib/dri/intel-vaapi-driver
no-autodownload=true
download-if=have-intel-gpu

[Extension org.gnome.Platform.Compat.i386.Debug]
directory=lib/debug/lib/i386-linux-gnu
version=21.08

[Extension io.github.flatpak_wine32.Locale]
directory=share/runtime/locale
autodelete=true
locale-subset=true

[Extension io.github.flatpak_wine32.Debug]
directory=lib/debug
autodelete=true
no-autodownload=true

EOF

echo -n "5.  Creating flatpak install script " || exit 1 && echo -e "\t[x]"

cat << EOF > "${TARGET_DIR}/[winepak.x86_64]$DOT_NAME/install.sh"
#!/bin/bash
# Installs game bundle for user.
# You can delete everything after installation.

DIR=\$(dirname "\$0")
set -ex
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo || true
flatpak --user install -y flathub org.winehq.Wine/x86_64/stable-21.08
flatpak --user install -y --app --bundle "\$DIR/org.winepak.x86_64.$NAME.flatpak" || echo "Installation failed. Check if you have Flatpak properly configured. See http://flatpak.org/ for more info."
EOF

echo -n "6.  Creating flatpak uninstall script " || exit 1 && echo -e "\t[x]"
cat << EOF >"${TARGET_DIR}/[winepak.x86_64]$DOT_NAME/uninstall.sh"
#!/bin/bash
# You can as well use package manager to uninstall the game
echo You can as well use package manager to uninstall the game

set -ex
flatpak --user uninstall org.winepak.x86_64.$NAME
EOF
 
echo -n "7.  Creating flatpak run script "
cat << EOF >"${TARGET_DIR}/[winepak.x86_64]$DOT_NAME/run.sh" || exit 1 && echo -e "\t[x]"
#!/bin/bash
set -ex
flatpak run org.winepak.x86_64.$NAME \$@
EOF

echo -n "8.  Creating desktop shortcut   "
cat << EOF >"${TARGET_DIR}/package/export/share/applications/org.winepak.x86_64.$NAME.desktop" || exit 1 && echo -e "\t[x]"
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

echo -n "9.  Copying icon file           "
# If custom icon.png is provided by the flatpak maker
#set -ex
## adding ImageMagicks's convert for different icon support for non gnome desktops
export TEMPDIR="./tmp-icondir"
export ICONFILE="${TARGET_DIR}/package/export/share/icons/\
hicolor/128x128/apps/org.winepak.x86_64.$NAME.png"

if [ -e "$APP"/icon.png ]; then 
   cp "$APP"/icon.png "${ICONFILE}" || exit 1 && echo -e "\t[x]"
else
########## ICON ##########
mkdir -p ${TEMPDIR} && \
echo "    Created directory ${TEMPDIR}"
WORKING_DIR="$PWD"
#cd ${TEMPDIR}

# wrestool extracts ico file from EXE
wrestool -x -t 14 ""$APP"/"$EXE"" > "${TEMPDIR}/${EXE}.ico" 2> /dev/null && \
echo "    Extracting icon from $EXE file"

# Only try to extract Icon when Icon is Found in the EXE
# icotool extracts all png files from ico files
# Select and copy the best png image file by sorting using ls -S1.
icotool -x "${TEMPDIR}/${EXE}.ico" 2>/dev/null && \
echo "Icotool: Extracting png files from" \
     "${EXE}.ico" && \
cp $(ls -S -1 ${TEMPDIR}/${EXE}*.png  | head -n 1) "${ICONFILE}" || exit 1 && (echo -e "\t[x]"; WARN="false")


# If icon could not be copied, warn the user
if [ "${WARN}" != "false" ]; then
     echo "Icon could not be copied... Using empty icon"
     touch "${ICONFILE}"
fi

# remove TEMPDIR
rm -r ${TEMPDIR}
#cd "${WORKING_DIR}"
# Cleanup tempdir and clear variable
unset WARN

#################
#   echo "    Extracting icon from $EXE file"
#   # Extract Icon and copy
#   # dnf install icoutils ImageMagick
#   wrestool -x --output=. -t14 "$APP"/"$EXE" ; #extracts ico file
#   convert "*.ico" "hello.png"; #this will get ping files as hello-0...hellol7.png

#   #hello-0.png is the highest resolution 256x256 (some has 128x128)
#   #so copy hello-0.png as icon
#   cp hello-0.png "${TARGET_DIR}/package/export/share/icons/\
#hicolor/128x128/apps/org.winepak.x86_64.$NAME.png;

fi


#remove ico and png files
rm -f hello-?.png $EXE*.ico

echo -n "10. Copying appdir files          "
cp -rd "$APP" "${TARGET_DIR}/package/files/" || exit 1 && echo -e "\t[x]"
#32 bit wine files are copied to 
echo -n "11. Copying ${RUNNER} files       "
cp -rdf ${RUNNERS_DIR}/${RUNNER}/* "${TARGET_DIR}/package/files" || exit 1 && echo -e "\t[x]"

echo -n "12. Copying run.sh script         "
chmod +x "${TARGET_DIR}/package/files/bin/run.sh" || exit 1 && echo -e "\t[x]"

echo -n "13. Copying install.sh script     "
chmod +x "${TARGET_DIR}/[winepak.x86_64]$DOT_NAME/install.sh" || exit 1 && echo -e "\t[x]"

echo -n "14. Copying uninstall.sh script   "
chmod +x "${TARGET_DIR}/[winepak.x86_64]$DOT_NAME/uninstall.sh" || exit 1 && echo -e "\t[x]"

echo -n "15. Copying launch script         "
chmod +x "${TARGET_DIR}/[winepak.x86_64]$DOT_NAME/run.sh" || exit 1 && echo -e "\t[x]"

echo -n "16. Copying $0"
cp "$0" "${TARGET_DIR}/package/files/make_winepak.x86_64.sh" || exit 1 && echo -e "\t[x]"

echo -n "17. Copying commandline.sh script "
echo "$0" "$ARGV" > "${TARGET_DIR}/package/files/commandline.sh" || exit 1 && echo -e "\t[x]"

echo "Building flatpak bundle..."

flatpak build-export "${TARGET_DIR}/repo" "${TARGET_DIR}/package" || exit 1 \
&& echo -e "18. Build-export \t\t\t[x]"

echo -n "19. Started build-bundle          "
flatpak build-bundle --arch=$ARCH ${TARGET_DIR}/repo  "${TARGET_DIR}/[winepak.x86_64]$DOT_NAME/org.winepak.x86_64.$NAME.flatpak" org.winepak.x86_64.$NAME || exit 1 && (echo -e "\t[x]")

echo "20. Flatpak created! 			             [x]"

# removed runtime-repo for offline installation
#flatpak build-bundle --arch=$ARCH ${TARGET_DIR}/repo  "${TARGET_DIR}/[winepak.x86_64]$DOT_NAME/org.winepak.x86_64.$NAME.flatpak org.winepak.x86_64.$NAME" --runtime-repo="https://flathub.org/repo/flathub.flatpakrepo"




