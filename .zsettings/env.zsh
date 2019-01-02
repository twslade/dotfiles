export SITES_DIR="$HOME/sites"
export EDITOR="vim"
export TERMINAL="xfce4-terminal"
export BROWSER="google-chrome"



if [ -d "$HOME/.bin" ] ; then
	export PATH="$HOME/.bin:$PATH"
fi

# AWS Cli Helper
if [ -f "$HOME/.local/bin/aws_zsh_completer.sh" ] ; then
	source $HOME/.local/bin/aws_zsh_completer.sh
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
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Python Virtual Env
[ -f ~/.python-virtual-envs/python3.5/bin/activate ] && source ~/.python-virtual-envs/python3.5/bin/activate
