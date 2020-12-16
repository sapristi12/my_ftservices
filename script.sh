minikube delete
minikube start
minikube ip

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl apply -f metalLB.yaml
kubectl create secret generic -n metallb-system memberlist  --from-literal=secretkey="$(openssl rand -base64 128)"

eval $(minikube docker-env)
IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)
printf "Minikube IP: ${IP}"

#DOCKERS
echo "Dockers :"
#docker build -t service_nginx ./nginx
#docker build -t service_ftps --build-arg IP=${IP} ./ftps
docker build -t mysql --build-arg IP=${IP} ./mysql
docker build -t wordpress --build-arg IP=${IP} ./wordpress
docker build -t phpmyadmin --build-arg IP=${IP} ./phpmyadmin
#docker build -t service_influxdb --build-arg IP=${IP} ./influxdb

#YAML
echo "Pods and services :"
#kubectl create -f ./nginx.yaml
kubectl create -f ./mysql.yaml
#kubectl create -f ./wordpress.yaml
#kubectl create -f ./ftps.yaml
kubectl create -f ./phpmyadmin.yaml
#kubectl create -f ./influxdb.yaml

minikube dashboard
