export SITES_DIR="$HOME/sites"
export EDITOR=vim
if [ -d "$HOME/bin" ] ; then
	export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
fi

if [ -f "$HOME/.local/bin/aws_zsh_completer.sh" ] ; then
	source $HOME/.local/bin/aws_zsh_completer.sh
fi

if [ -d "/usr/lib/jvm/java-10-oracle" ] ; then
	export JAVA_HOME="/usr/lib/jvm/java-10-oracle"
fi

[ -f ~/.local/share/funky/funky.sh ] && source ~/.local/share/funky/funky.sh

[ -f ~/.python-virtual-envs/python3.5/bin/activate ] && source ~/.python-virtual-envs/python3.5/bin/activate
