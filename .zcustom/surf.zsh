local base='aHR0cHM6Ly9jYW1zLmNkbi1zdXJmbGluZS5jb20vY2RuLWVjLw=='

base64decode(){
	echo $1 | base64 -d
}

base64encode(){
	echo $1 | base64
}

surf-n-washout(){
	vlc $(base64decode "$base")$(base64decode "ZWMtd2FzaG91dC9jaHVua2xpc3QubTN1OAo=")
}

surf-s-pier(){
	vlc $(base64decode "$base")$(base64decode "ZWMtZm9sbHlwaWVyc291dGgvY2h1bmtsaXN0Lm0zdTgK")
}

surf-n-pier(){
	vlc $(base64decode "$base")$(base64decode "ZWMtZm9sbHlwaWVybm9ydGgvY2h1bmtsaXN0Lm0zdTgK")
}

surf-s-washout() {
	vlc $(base64decode "$base")$(base64decode "ZWMtd2FzaG91dHNvdXRoY2FtL2NodW5rbGlzdC5tM3U4Cg==")
}

surf-frisco(){
	vlc $(base64decode "$base")$(base64decode "ZWMtZnJpc2NvcGllci9jaHVua2xpc3QubTN1OAo=")
}

surf-hatteras(){
	vlc $(base64decode "$base")$(base64decode "ZWMtY2FwZWhhdHRlcmFzL2NodW5rbGlzdC5tM3U4Cg==")
}

surf-s-turns(){
	vlc $(base64decode "$base")$(base64decode "ZWMtcm9kYW50aGUvY2h1bmtsaXN0Lm0zdTgK")
}

surf-bogue(){
	vlc $(base64decode "$base")$(base64decode "ZWMtYm9ndWVpbmxldHBpZXIvY2h1bmtsaXN0Lm0zdTgK")
}
surf-st-augustine-a-st(){
	vlc $(base64decode "$base")$(base64decode "ZWMtc2FpbnRhdWd1c3QvY2h1bmtsaXN0Lm0zdTgK")
}

surf-st-augustine(){
	vlc $(base64decode "$base")$(base64decode "ZWMtc3RhdWd1c3RpbmUvY2h1bmtsaXN0Lm0zdTgK")
}

surf-new-smyrna(){
	vlc $(base64decode "$base")$(base64decode "ZWMtbmV3c215L2NodW5rbGlzdC5tM3U4Cg==")
}

surf-sebastian-inlet(){
	vlc $(base64decode "$base")$(base64decode "ZWMtc2ViYXN0aWFuaW5sZXQvY2h1bmtsaXN0Lm0zdTgK")
}

surf-jacksonville(){
	vlc $(base64decode "$base")$(base64decode "ZWMtamFja3NvbnZpbGxlcGllci9jaHVua2xpc3QubTN1OAo=")
}

surf-jacksonville-18(){
	vlc $(base64decode "$base")$(base64decode "ZWMtamFja3NvbnZpbGxlL2NodW5rbGlzdC5tM3U4Cg==")
}


