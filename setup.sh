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
kubectl apply -f metalLB.yaml
kubectl create secret generic -n metallb-system memberlist  --from-literal=secretkey="$(openssl rand -base64 128)"
echo "\e[32mOK !"

eval $(minikube docker-env)

echo "\e[34mCréations des dockers..."

echo "\e[93mBuilding image nginx"
docker build -t nginx ./nginx > /dev/null
echo "\e[93mBuilding image ftps"
docker build -t ftps ./ftps > /dev/null
echo "\e[93mBuilding image mysql"
docker build -t mysql ./mysql > /dev/null
echo "\e[93mBuilding image wordpress"
docker build -t wordpress ./wordpress > /dev/null
echo "\e[93mBuilding image phpmyadmin"
docker build -t phpmyadmin ./phpmyadmin > /dev/null
echo "\e[93mBuilding image influxdb"
docker build -t influxdb ./influxdb > /dev/null
echo "\e[93mBuilding image telegraf"
docker build -t telegraf ./telegraf > /dev/null
echo "\e[93mBuilding image grafana"
docker build -t grafana ./grafana > /dev/null
echo "\e[32mOK !"

echo "\e[34mApplication des fichiers .yaml..."
kubectl create -f ./nginx.yaml > /dev/null
kubectl create -f ./mysql.yaml > /dev/null
kubectl create -f ./wordpress.yaml > /dev/null
kubectl create -f ./ftps.yaml > /dev/null
kubectl create -f ./phpmyadmin.yaml > /dev/null
kubectl create -f ./influxdb.yaml > /dev/null
kubectl create -f ./telegraf.yaml > /dev/null
kubectl create -f ./grafana.yaml > /dev/null
echo "\e[32mOK !"

minikube dashboard
