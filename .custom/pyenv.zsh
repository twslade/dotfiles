if [ -d  "/home/thomas/.pyenv/bin:$PATH" ]; then
	export PATH="/home/thomas/.pyenv/bin:$PATH"
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

