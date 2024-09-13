export SITES_DIR="$HOME/sites"
export EDITOR="vim"
export TERMINAL="xfce4-terminal"
export BROWSER="google-chrome"


if [ -d "$HOME/.bin" ] ; then
	export PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/go/bin" ] ; then
	export PATH="$HOME/go/bin:$PATH"
fi

if [ -d "$HOME/.config/composer/vendor/bin/" ] ; then
	export PATH="$HOME/.config/composer/vendor/bin/:$PATH"
fi

# Java
if [ -d "/usr/lib/jvm/java-8-oracle" ] ; then
	export JAVA_HOME="/usr/lib/jvm/java-8-oracle"
fi

# Ruby Version Manager
[ -s /etc/profile.d/rvm.sh ] && source /etc/profile.d/rvm.sh



# Linux Brew
if [ -d "/home/linuxbrew/.linuxbrew/bin" ] ; then
	export PATH="/home/linuxbrew/.linuxbrew/bin/:$PATH"
fi