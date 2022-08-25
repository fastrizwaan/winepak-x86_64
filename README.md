# winepak-x86_64
Create and Run Windows 32 bit, and 64 bit Games & Applications Flatpak bundle, Which can be run from desktop shortcut. They are sandboxed, like playonlinux's bottle. 

This is a tribute to original author of flatpak-linux.

winepak (based on original flatpak-linux script) takes a lot of time and is very slow. Instead use [flatpak-wine](https://github.com/fastrizwaan/flatpak-wine) to create game bundles, which is 10 times faster than creating flatpak wine game bundles.

### USAGE: Create wine app/game flatpak bundle
#### See commandline.sh for details
the Script `make_winepak-x86_64.sh` expect 3 things
1. Name of the Program or Game
2. Directory of the Program or Game
3. .exe file name which is inside the Directory (example notepad++.exe)

Here we have NotepadPP directory. 
```
git clone https://github.com/fastrizwaan/winepak-x86_64.git
cd winepak-x86_64/NotepadPP/
sh ./commandline.sh 
./target/\[winepak32\]Notepadpp/install.sh 
./target/\[winepak32\]Notepadpp/run.sh 
```


winepak-x86_64 uses Flatpak Sdk 21.08 with Compat.i386 runtime, please install dependencies.

## Install dependencies
```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install \
runtime/org.freedesktop.Sdk/x86_64/21.08                           \
org.freedesktop.Platform/x86_64/21.08                              \
runtime/org.freedesktop.Sdk.Compat.i386/x86_64/21.08               \
runtime/org.freedesktop.Sdk.Extension.toolchain-i386/x86_64/21.08  \
org.freedesktop.Platform.GL.default/x86_64/21.08                   \
org.freedesktop.Platform.VAAPI.Intel/x86_64/21.08                  \
org.freedesktop.Platform.openh264/x86_64/2.0                       \
org.freedesktop.Platform.Compat.i386/x86_64/21.08                  \
org.freedesktop.Platform.GL32.default/x86_64/21.08

```
#### if you have nvidia gpu, and the game complains about D3D or Opengl or GL install nvidia drivers install nvidia drivers 
```
NVERSION=$(nvidia-settings -q all |grep OpenGLVersion|grep NVIDIA|sed 's/.*NVIDIA \(.*\) /nvidia-\1/g'|sed 's/\./-/g')

sudo flatpak install flathub org.freedesktop.Platform.GL32.$NVERSION -y
```

This bundle is created using "direct play" or "no-install" directory. for Installers (e.g., Setup.exe) use `flatpak-wine` see below.

##### wine used in this winepak-x86_64 from with 21.08 runtime, Also flatpak-wine 0.84+ can create game bundles 10 times faster than winepak, please try:
https://github.com/fastrizwaan/flatpak-wine


