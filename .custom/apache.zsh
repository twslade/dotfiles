VHOST_TEMPLATE="
<VirtualHost *:443>
	ServerName  {template}.local
	ServerAlias www.{template}.local
	DocumentRoot $SITES_DIR{template}.local
	SSLEngine on
	SSLCertificateFile      $SITES_DIR{template}.local/assets/{template}.local.pem
    SSLCertificateKeyFile      $SITES_DIR{template}.local/assets/{template}.local-key.pem

</VirtualHost>
"

watch-apache(){
	tail -f /var/log/apache2/error.log
}

watch-apache-all(){
	tail -f -c0 /var/log/apache2/*error*.log
}


restart-apache(){
	sudo service apache2 restart
}

remove-site(){
    sudo a2dissite $1
	sudo rm /etc/apache2/sites-available/$1.conf	
	sudo service apache2 reload
}


add-site(){
	if (( ! $# )); then
		echo "Usage: add-site <site-identifier>.local"
		return 1
	fi

	# read template - replace data - write into a new file
	sudo echo "$VHOST_TEMPLATE" | \
        sed "s/{template}/$1/g" | \
        cat > /etc/apache2/sites-available/$1.conf

    cd $SITES_DIR/$1.local && \
        mkdir -p $SITES_DIR/$1.local/assets && \ 
        mkcert $1

	sudo a2ensite $1.conf #enable add virtual host

	sudo service apache2 reload #restart server

	sudo echo 127.0.0.1 $1.local >> /etc/hosts #create reference
}

turn-on-xdebug-cli(){
	export XDEBUG_CONFIG="idekey=PHPSTORM"
}
turn-off-xdebug-cli(){
	unset XDEBUG_CONFIG
}
