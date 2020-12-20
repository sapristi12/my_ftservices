openrc &> /dev/null
touch /run/openrc/softlevel
/etc/init.d/mariadb setup &> /dev/null
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
service mariadb restart &> /dev/null

mysql --user=root << EOF
  FLUSH PRIVILEGES;
  CREATE DATABASE wordpress;
  CREATE USER 'erlajoua'@'%' IDENTIFIED BY '1212';
  GRANT ALL ON *.* TO 'erlajoua'@'%' IDENTIFIED BY '1212' WITH GRANT OPTION;
  FLUSH PRIVILEGES;
EOF

mysql --user=root wordpress < wordpress.sql

tail -F /dev/null
