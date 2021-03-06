#https://github.com/kubernetes-sigs/prometheus-adapter/blob/master/docs/walkthrough.md

#Create namespace prom
kubectl create namespace prom 
kubectl label namespace prom monitoring=prom
kubectl create namespace app
kubectl label namespace app monitoring=prom

# Deploy Prometheus Operator
kubectl create -f manifests/prometheus/bundle.yaml -n prom

# Deploy Prometheus
kubectl apply -f manifests/prometheus/prom.yaml -n prom
#kubectl delete -f manifests/prometheus/prom.yaml -n prom

# Deploy Service Monitor
kubectl apply -f manifests/prometheus/service-monitor.yaml -n app
#kubectl delete -f manifests/prometheus/service-monitor.yaml -n app

#Create application
kubectl apply -f manifests/app/custom/deployment.yaml -n app
kubectl apply -f manifests/app/custom/service.yaml -n app

# Deploy adapter 
kubectl apply -f manifests/prometheus/prometheus-adapter/0-adapter 
kubectl apply -f manifests/prometheus/prometheus-adapter/1-custom-metrics 
