#https://cloud.google.com/kubernetes-engine/docs/how-to/vertical-pod-autoscaling
#https://docs.aws.amazon.com/eks/latest/userguide/vertical-pod-autoscaler.html
#https://github.com/kubernetes/autoscaler/tree/master/vertical-pod-autoscaler

# You can enable VPA using GUI also

kubectl apply -f manifests/app/vpa 


# TO DELETE
kubectl delete -f manifests/app/vpa/deployment.yaml
kubectl delete -f manifests/app/vpa/vpa.yaml
kubectl delete -f manifests/app/vpa/service.yaml
