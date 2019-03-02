my-mysql(){
	mysql -u "$MYSQL_USER" -p"$MYSQL_PASS"
}

mysql-import-sql-file(){
	if (( ! $# )); then
		echo "Usage: mysql-import-sql-file <database> <file>"
		return 1
	fi

	mysql -u "$MYSQL_USER" -p"$MYSQL_PASS" $1 < $2
}

mysql-import-gzip-sql-file(){
	if (( ! $# )); then
		echo "Usage: mysql-import-gzip-sql-file <database> <file>"
		return 1
	fi
	gunzip < $2 | mysql -u "$MYSQL_USER" -p"$MYSQL_PASS" $1
}

mysql-sanitize-file(){
	if (( ! $# )); then
		echo "Removes DEFINER from mysql backup"
		echo "Usage: mysql-sanitize-file <database-backup.sql> <new-database-backup.sql>"
		return 1
	fi
	sed "s/\/\*[^\/]*DEFINER.*\*\///" $1 > $2
}
