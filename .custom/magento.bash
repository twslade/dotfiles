get-magento-root() {
  local magentopath=`git rev-parse --show-toplevel`;
  echo $(find $magentopath -name "Mage.php" | sed s/app\\\/Mage.php//)
}

magento-uninstall(){
  if (( ! $# )); then
    echo "Usage: magento-uninstall <path/to/magento>"
    return 1
  fi
  n98-magerun.phar uninstall --installationFolder="$1" -f
}

magento-fix-permissions(){
  git config core.fileMode false
  chmod 777 $(get-magento-root)/media/ $(get-magento-root)/var/ $(get-magento-root)/app/etc/ -R
}

magento-clear-cache(){
  rm -rf $(get-magento-root)/var/cache $(get-magento-root)/var/full_page_cache
  rm -rf /tmp/magento/var/cache/
  rm -rf /tmp/magento/var/full_page_cache/
}

magento-clear-session(){
  sudo rm -rf $(get-magento-root)/var/session
}

magento-clear-logs(){
  find $(get-magento-root)/var/log/ -iname "*.log" -print0 | xargs -0 rm
}

magento-watch-exception(){
  less +F $(get-magento-root)/var/log/exception.log
}

magento-watch-system(){
  less +F $(get-magento-root)/var/log/system.log
}

magento-watch-all(){
  tail -f $(get-magento-root)/var/log/*.log /var/log/apache/*error.log
}

magento-install(){
  if (( ! $# )); then
    echo "Usage: magento-install <site-identifier>.local"
    return 1
  fi
  echo "Installing magento into folder $1.local...."
  n98-magerun.phar install --installationFolder="$1.local" --dbName="$1-db" --dbHost="localhost" --dbUser="$MYSQL_USER" --dbPass="$MYSQL_PASS" --dbPort="3306" --baseUrl="http://$1.local/" --replaceHtaccessFile="n"
  add-site $1
  cd $1.local && magento-admin-user-create && magento-customer-create
}

magento-admin-user-create(){
  n98-magerun.phar admin:user:create "$MAGE_USER" t@t.com "$MAGE_PASS" t s
}

magento-customer-create(){
  n98-magerun.phar customer:create t@t.com "$MAGE_PASS" t s 1
}

apache-tail-error-notify(){
  tail -f /var/log/apache2/error.log | grep --line-buffered error | while read line; do notify-send "Exception" "$line"; done
}

magento-tail-system-notify(){
   tail -n0 -f $(get-magento-root)/var/log/system.log | while read line; do notify-send "System Message" "$line"; done
}

magento-tail-exception-notify(){
  tail -f $(get-magento-root)/var/log/exception.log | grep --line-buffered exception | while read line; do notify-send "Exception" "$line"; done
}

magento-optimize-media(){
  find . -iname "*.jpg" -exec jpegoptim -m70 --strip-all -o -t {} \;
  find . -iname "*.png" | while read png;
  do
    echo "crushing $png"
    pngcrush -reduce "$png" /tmp/temp.png
    mv -f /tmp/temp.png "$png"
  done;
}