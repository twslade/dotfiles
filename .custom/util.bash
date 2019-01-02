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
