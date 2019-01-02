source <(antibody init)
antibody bundle < $HOME/.zplugins/defaults.txt

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

