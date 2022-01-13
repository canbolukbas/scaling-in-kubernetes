# TO DELETE 
kubectl delete -f manifests/prometheus/prometheus-adapter/1-custom-metrics 
kubectl delete -f manifests/prometheus/prometheus-adapter/0-adapter 
kubectl delete -f manifests/app/custom -n app
kubectl delete -f manifests/prometheus/service-monitor.yaml -n app
kubectl delete -f manifests/prometheus/prom.yaml -n prom
kubectl delete -f manifests/prometheus/bundle.yaml -n prom
kubectl delete namespace app
kubectl delete namespace prom 