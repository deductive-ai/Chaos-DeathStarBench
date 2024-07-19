bash ./hotelReservation/build_docker_images.sh 
kind delete cluster --name chaos; 
kind create cluster --name chaos; 
kubectl cluster-info --context kind-chaos; 
kubectl config use-context chaos-control-plane;
kind load docker-image krushna/hotel-reservation --name chaos;
kubectl apply -Rf "./hotelReservation/kubernetes/"

# kubectl get pods
# kubectl describe pods <pod_name>
# kubectl delete pods --all
