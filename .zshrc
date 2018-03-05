source <(antibody init)
antibody bundle < ~/.zplugins
antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-history-substring-search
antibody bundle jimhester/per-directory-history

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
