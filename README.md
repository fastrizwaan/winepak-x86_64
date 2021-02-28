# winepak32
Create Windows 32 bit Games and 32 bit Applications Flatpak bundles with Wine 32 bit included in the bundle. we can create a Game.flatpak bundle which includes Game+Wine+game run script.
winepak32 is uses Flatpak Sdk 20.08 with Compat.i386 runtime

## Build wine 32 flatpak bundle
```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install \
runtime/org.freedesktop.Sdk/x86_64/20.08                           \
org.freedesktop.Platform/x86_64/20.08                              \
runtime/org.freedesktop.Sdk.Compat.i386/x86_64/20.08               \
runtime/org.freedesktop.Sdk.Extension.toolchain-i386/x86_64/20.08  \
org.freedesktop.Platform.GL.default/x86_64/20.08                   \
org.freedesktop.Platform.VAAPI.Intel/x86_64/20.08                  \
org.freedesktop.Platform.openh264/x86_64/2.0                       \
org.freedesktop.Platform.Compat.i386/x86_64/20.08                  \
org.freedesktop.Platform.GL32.default/x86_64/20.08

```
#### if you have nvidia gpu, and the game complains about D3D or Opengl or GL install nvidia drivers install nvidia drivers 
```
NVERSION=$(nvidia-settings -q all |grep OpenGLVersion|grep NVIDIA|sed 's/.*NVIDIA \(.*\) /nvidia-\1/g'|sed 's/\./-/g')

sudo flatpak install flathub org.freedesktop.Platform.GL32.$NVERSION -y
```

## Create wine32 flatpak bundle
```
git clone https://github.com/fastrizwaan/winepak32.git
cd winepak32/NotepadPP/
sh ./commandline.sh 
./target/\[winepak32\]Notepadpp/install.sh 
./target/\[winepak32\]Notepadpp/run.sh 
```
This bundle is created using "direct play" or "no-install" directory. for Installers (e.g., Setup.exe) use `flatpak-wine32` see below.

### wine used in this winepak32 from with 20.08 runtime
https://github.com/fastrizwaan/flatpak-wine32

### Old 18.08 i386 version of make flatpak
https://github.com/fastrizwaan/flatpak-wine 

