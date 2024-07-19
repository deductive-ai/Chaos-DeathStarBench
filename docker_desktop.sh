bash ./hotelReservation/build_docker_images.sh 
kubectl config use-context docker-desktop
kubectl delete pods --all
kubectl apply -Rf "./hotelReservation/kubernetes/"
cd hotelReservation
./wrk -D exp -t 2 -c 2 -d 30 -L -s ./wrk2_lua_scripts/mixed-workload_type_1.lua http://frontend.hotel-res.svc.cluster.local:5000 -R 2 

# kubectl get pods
# kubectl describe pods <pod_name>
# kubectl delete pods --all
