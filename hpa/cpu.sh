kubectl create namespace cpu
kubectl apply -f manifests/app/cpu -n cpu

#kubectl get all -n cpu

#kubectl config set-context --current --namespace=cpu

# without pod autoscaling
#kubectl delete -f manifests/app/cpu/hpa-cpu.yaml    

# TO DELETE
kubectl delete -f manifests/app/cpu -n cpu
kubectl delete namespace cpu
