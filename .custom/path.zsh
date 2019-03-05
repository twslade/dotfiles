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

# Gcloud
if [ -d "/usr/lib/google-cloud-sdk/bin/" ]; then
	export PATH="/usr/lib/google-cloud-sdk/bin/:$PATH"
fi

# Java
if [ -d "/usr/lib/jvm/java-8-oracle" ] ; then
	export JAVA_HOME="/usr/lib/jvm/java-8-oracle"
fi

# Ruby Version Manager
[ -s /etc/profile.d/rvm.sh ] && source /etc/profile.d/rvm.sh

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Fuzzy Finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Python Virtual Env
[ -f ~/.python-virtual-envs/python3.5/bin/activate ] && source ~/.python-virtual-envs/python3.5/bin/activate
