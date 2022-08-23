
Copy your direct-play gamdir directory here. e.g., NotepadPP is your gamdir/appdir; and Name you want is My_NotePad and the exe for Notepad is notepadpp.exe which is inside NotepadPP directory. Here's the command to create flatpak-bundle (winepak bundle).
```
./make_winepak-x86_64.sh --runner=proton -n="My_NotePad" -d="./Notepadpp/" -e="notepadpp.exe"
```

Some Games like UE4 are 2 level down the game dir, like `Gamedir/binaries/LAVA/game.exe`, then use if `-d="Gamedir"` then use `-e="Gamedir/binaries/LAVA/game.exe"`
1.2 GB takes around 5 minutes. Flatpak perhaps uses xz or bz2 which is slower. zstd used by WineZGUI is faster. Enjoy
