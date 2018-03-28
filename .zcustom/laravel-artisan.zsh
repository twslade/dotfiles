# Laravel5 basic command completion
_laravel5_get_command_list () {
	php artisan --raw --no-ansi list | sed "s/[[:space:]].*//g"
}

_laravel5 () {
  if [ -f artisan ]; then
    compadd `_laravel5_get_command_list`
  fi
}

compdef _laravel5 artisan
compdef _laravel5 la5