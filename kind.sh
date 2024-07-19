kind delete cluster --name chaos; 
kind create cluster --name chaos; 
kubectl cluster-info --context kind-chaos; 
kubectl config use-context chaos-control-plane;
kind load docker-image krushna/hotel-reservation --name chaos;
kubectl apply -Rf "./hotelReservation/kubernetes/"
