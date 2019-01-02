php-56(){
	sudo update-alternatives --set php /usr/bin/php5.6
	sudo a2dismod php7.1 php7.0 php7.2
	sudo a2enmod php5.6
	sudo service apache2 restart
}

php-70(){
	sudo update-alternatives --set php /usr/bin/php7.0
	sudo a2dismod php5.6 php7.1 php7.2
	sudo a2enmod php7.0
	sudo service apache2 restart
}

php-71(){
	sudo update-alternatives --set php /usr/bin/php7.1
	sudo a2dismod php5.6 php7.0 php7.2
	sudo a2enmod php7.1
	sudo service apache2 restart
}

php-72(){
	sudo update-alternatives --set php /usr/bin/php7.2
	sudo a2dismod php5.6 php7.1 php7.0
	sudo a2enmod php7.2
	sudo service apache2 restart
}

php-enable-ioncube(){
	sudo ln -s /etc/php/5.6/mods-available/00-ioncube.ini /etc/php/5.6/apache2/conf.d/
	sudo service apache2 restart
}

php-disable-ioncube(){
	sudo rm /etc/php/5.6/apache2/config.d/00-ioncube.ini
	sudo service apache2 restart
}
