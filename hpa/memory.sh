kubectl create namespace memory
kubectl apply -f manifests/app/memory -n memory

#kubectl get all -n memory

#kubectl config set-context --current --namespace=memory
#kubens memory


# TO DELETE
kubectl delete -f manifests/app/memory -n memory
kubectl delete namespace memory
