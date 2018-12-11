VHOST_TEMPLATE="
<VirtualHost *:80>
	ServerName  {template}.local
	ServerAlias {template}.local
	DocumentRoot $SITES_DIR{template}.local
</VirtualHost>
"

watch-apache(){
	tail -f /var/log/apache2/error.log
}

watch-apache-all(){
	tail -f -c0 /var/log/apache2/*error*.log
}

enable-site(){
  	sudo a2ensite $1
}

disable-site(){
	sudo a2dissite $1
}

restart-apache(){
	sudo service apache2 restart
}

remove-site(){
    sudo a2dissite $1
	sudo rm /etc/apache2/sites-available/$1.conf	
	sudo service apache2 reload
}


apache-gen-ssl-cert(){
	if (( ! $# )); then
		echo "Usage: apache-gen-ssl-cert <common-name>.<tld>"
		return 1
	fi
	DOMAIN=$1

	# Add wildcard
	WILDCARD="*.$DOMAIN"

	# Set our CSR variables
	SUBJ="
C=US
ST=SC
O=Local
localityName=Local
commonName=$WILDCARD
organizationalUnitName=Local
emailAddress=test@example.com
"

	# Generate our Private Key, CSR and Certificate
	openssl genrsa -out "$DOMAIN.key" 2048
	openssl req -new -subj "$(echo -n "$SUBJ" | tr "\n" "/")" -key "$DOMAIN.key" -out "$DOMAIN.csr"
	openssl x509 -req -days 3650 -in "$DOMAIN.csr" -signkey "$DOMAIN.key" -out "$DOMAIN.crt"
	rm -f "$DOMAIN.csr"

	echo ""
	echo "Next manual steps:"
	echo "- Use $DOMAIN.crt and $DOMAIN.key to configure Apache/nginx"
	echo "- Import $DOMAIN.crt into Chrome settings: chrome://settings/certificates > tab 'Authorities'"
}


add-site(){
	if (( ! $# )); then
		echo "Usage: magento-uninstall <site-identifier>.local"
		return 1
	fi

	# read template - replace data - write into a new file
	sudo echo "$VHOST_TEMPLATE" | sed "s/{template}/$1/g" | cat > /etc/apache2/sites-available/$1.conf

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