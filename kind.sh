bash ./hotelReservation/kubernetes/scripts/build_docker_images.sh 
kind delete cluster --name chaos; 
kind create cluster --name chaos; 
kubectl cluster-info --context kind-chaos; 
kubectl config use-context chaos-control-plane;
kind load docker-image krushna/hotel-reservation --name chaos;
kubectl apply -Rf "./hotelReservation/kubernetes/"

# kubectl get pods
# kubectl describe pods <pod_name>

# ./wrk -D exp -t 2 -c 2 -d 30 -L -s ./wrk2_lua_scripts/mixed-workload_type_1.lua http://frontend.hotel-res.svc.cluster.local:5000 -R 2 

# kubectl delete pods --all
