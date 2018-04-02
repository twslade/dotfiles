source <(antibody init)
antibody bundle < $HOME/.zplugins/defaults.txt
antibody bundle < $HOME/.zplugins/oh-my-zsh.txt

#Include all files that end with .zsh in home directory
config_files=(${ZDOTDIR:-$HOME}/.zcustom/*)
## load everything but the path and completion files
for file in ${${config_files}}
do
  source $file
done

settings_files=(${ZDOTDIR:-$HOME}/.zsettings/*.zsh)
for file in ${${settings_files}}
do
  source $file
done

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh