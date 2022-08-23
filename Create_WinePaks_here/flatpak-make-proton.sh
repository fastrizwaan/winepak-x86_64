if [ "$#" -eq 0 ]; then
     echo "Example:"
     echo ../make_winepak-x86_64.sh --runner=proton  -n="Notepadpp" -d="./Notepadpp/" -e="notepadpp.exe"
fi

../make_winepak-x86_64.sh $@
