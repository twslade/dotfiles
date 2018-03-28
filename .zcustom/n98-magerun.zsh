_n98_magerun_get_command_list () {
  $_comp_command1 --no-ansi | sed "1,/Available commands/d" | awk '/^ +[a-z\-:]+/ { print $1 }'
}


_n98_magerun () {
  _arguments '1: :->command' '*:optional arg:_files'

  case $state in
    command)
      compadd $(_n98_magerun_get_command_list)
      ;;
    *)
  esac
}

compdef _n98_magerun n98-magerun.phar
compdef _n98_magerun n98-magerun