#!/bin/sh

echo "\e[34mSuppresion de l'ancien cluster..."
minikube delete
echo "\e[32mOK !"

echo "\e[34mCréation du nouveau cluster..."
minikube start
echo "\e[32mOK !"

echo "\e[34mInstallation de metalLB..."
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl apply -f ./srcs/metalLB.yaml
kubectl create secret generic -n metallb-system memberlist  --from-literal=secretkey="$(openssl rand -base64 128)"
echo "\e[32mOK !"

eval $(minikube docker-env)

echo "\e[34mCréations des dockers..."

echo "\e[93mBuilding image nginx"
docker build -t nginx ./srcs/nginx > /dev/null
echo "\e[93mBuilding image ftps"
docker build -t ftps ./srcs/ftps > /dev/null
echo "\e[93mBuilding image mysql"
docker build -t mysql ./srcs/mysql > /dev/null
echo "\e[93mBuilding image wordpress"
docker build -t wordpress ./srcs/wordpress > /dev/null
echo "\e[93mBuilding image phpmyadmin"
docker build -t phpmyadmin ./srcs/phpmyadmin > /dev/null
echo "\e[93mBuilding image influxdb"
docker build -t influxdb ./srcs/influxdb > /dev/null
echo "\e[93mBuilding image telegraf"
docker build -t telegraf ./srcs/telegraf > /dev/null
echo "\e[93mBuilding image grafana"
docker build -t grafana ./srcs/grafana > /dev/null
echo "\e[32mOK !"

echo "\e[34mApplication des fichiers .yaml..."
kubectl create -f ./srcs/nginx.yaml > /dev/null
kubectl create -f ./srcs/mysql.yaml > /dev/null
kubectl create -f ./srcs/wordpress.yaml > /dev/null
kubectl create -f ./srcs/ftps.yaml > /dev/null
kubectl create -f ./srcs/phpmyadmin.yaml > /dev/null
kubectl create -f ./srcs/influxdb.yaml > /dev/null
kubectl create -f ./srcs/telegraf.yaml > /dev/null
kubectl create -f ./srcs/grafana.yaml > /dev/null
echo "\e[32mOK !"
echo "=== PHPMYADMIN ==="
echo "Login : erlajoua | password : 1212"
echo "== FTPS ==="
echo "Login : admin | password : admin"
echo "show content : curl --ftp-ssl --insecure --user admin:admin ftp://172.17.0.2"
echo "upload file : curl --ftp-ssl --insecure --user admin:admin -T namefile ftp://172.17.0.2"
echo "download file : curl --ftp-ssl --insecure --user admin:admin ftp://172.17.0.2 -o ./namefile"
echo "=== GRAFANA ==="
echo "Login : admin | password : admin"
echo "=== INFLUXDB ==="
echo "Login : admin | password : admin"
echo "databasename : influxdatabase"
echo "=== MYSQL ==="
echo "Login : erlajoua | password : 1212"
echo "databasename : wordpress"
minikube dashboard
