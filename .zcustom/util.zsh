alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

start(){
	sh $HOME/.screenlayout/default.sh
	i3-msg restart
}

convert-png-to-jpg(){
	for i in *.png ; do convert "$i" "${i%.*}.jpg"; done
}

resize-jpg-for-web(){
    for i in *.jpg; do convert "$i" -scale 50% -strip -quality 86 "$i"; done
}
