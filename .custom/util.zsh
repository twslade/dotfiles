ssh-search(){
	grep -A 3 $1 $HOME/.ssh/config
}

convert-png-to-jpg(){
	for i in *.png ; do convert "$i" "${i%.*}.jpg"; done
}

resize-jpg-for-web(){
    for i in *.jpg; do convert "$i" -scale 50% -strip -quality 86 "$i"; done
}

compress-jpgs(){
	find .  -type f -iregex ".*\.jpe?g" | xargs jpegoptim --strip-all --totals
}

compress-pngs(){
	find . -iname "*.png" | xargs optipng -o7 -strip all
}

#!/bin/sh
#
# Usage: extract <file>
# Description: extracts archived files / mounts disk images
# Note: .dmg/hdiutil is macOS-specific.
#
# credit: http://nparikh.org/notes/zshrc.txt
extract () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)  tar -jxvf $1                        ;;
            *.tar.gz)   tar -zxvf $1                        ;;
            *.bz2)      bunzip2 $1                          ;;
            *.dmg)      hdiutil mount $1                    ;;
            *.gz)       gunzip $1                           ;;
            *.tar)      tar -xvf $1                         ;;
            *.tbz2)     tar -jxvf $1                        ;;
            *.tgz)      tar -zxvf $1                        ;;
            *.zip)      unzip $1                            ;;
            *.ZIP)      unzip $1                            ;;
            *.pax)      cat $1 | pax -r                     ;;
            *.pax.Z)    uncompress $1 --stdout | pax -r     ;;
            *.rar)      unrar x $1                          ;;
            *.Z)        uncompress $1                       ;;
            *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
