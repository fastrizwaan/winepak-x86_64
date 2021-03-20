# winepak-x86_64
Create and Run Windows 32 bit, and 64 bit Games & Applications Flatpak bundle, Which can be run from desktop shortcut. They are sandboxed, like playonlinux's bottle. 

winepak-x86_64 uses Flatpak Sdk 20.08 with Compat.i386 runtime, please install dependencies.

## Install dependencies
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

## Create wine app/game flatpak bundle
```
git clone https://github.com/fastrizwaan/winepak-x86_64.git
cd winepak-x86_64/NotepadPP/
sh ./commandline.sh 
./target/\[winepak32\]Notepadpp/install.sh 
./target/\[winepak32\]Notepadpp/run.sh 
```
This bundle is created using "direct play" or "no-install" directory. for Installers (e.g., Setup.exe) use `flatpak wine-x86_64` see below.

### wine used in this winepak-x86_64 from with 20.08 runtime
https://github.com/fastrizwaan/flatpak-wine


