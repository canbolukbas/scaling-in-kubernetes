kubectl create namespace cpu

#SET_RAMP_UP

set_ramp_up(){
    RAMP_UP=$1
    sed -i "s|<stringProp name=\"ThreadGroup.ramp_time\">.*</stringProp>|<stringProp name=\"ThreadGroup.ramp_time\">${RAMP_UP}</stringProp>|" jmeter/cpu-request-settings.jmx
}

set_service_ip() {
    local  NAMESPACE=$1
    local service_ip=$(kubectl get service -w app-service -n ${NAMESPACE} -o 'go-template={{with .status.loadBalancer.ingress}}{{range .}}{{.ip}}{{"\n"}}{{end}}{{.err}}{{end}}' 2>/dev/null | head -n1)
    sed -i "s|<stringProp name=\"HTTPSampler.domain\">.*</stringProp>|<stringProp name=\"HTTPSampler.domain\">${service_ip}</stringProp>|" jmeter/cpu-request-settings.jmx
}

                                    ### NO SCALING ###

# 1Test CPU                                                      #CAOFF 2 node
kubectl apply -f manifests/app/cpu/deployment.yaml -n cpu
kubectl apply -f manifests/app/cpu/service.yaml -n cpu
set_service_ip cpu
jmeter -n -t jmeter/cpu-request-settings.jmx -l jmeter/cpu-2000-${RAMP_UP}-300-2-nodes.csv -e -o cpu-2000-${RAMP_UP}-300-2-nodes
kubectl delete -f manifests/app/cpu -n cpu

# 2Test Custom-Metric                                           #CAOFF 2 node
./hpa/custom-metrics.sh
set_service_ip app
jmeter -n -t jmeter/cpu-request-settings.jmx -l jmeter/custom-2000-${RAMP_UP}-300-2-nodes.csv -e -o custom-2000-${RAMP_UP}-300-2-nodes
./hpa/custom-metrics-delete.sh

                                    ### TEST HPA ###

# 3Test CPU                                                     #CAOFF 2 node only
kubectl apply -f manifests/app/cpu -n cpu
set_service_ip cpu
jmeter -n -t jmeter/cpu-request-settings.jmx -l jmeter/cpu-2000-${RAMP_UP}-300-hpa-2-nodes-.csv -e -o cpu-2000-${RAMP_UP}-300-hpa-2-nodes
kubectl delete -f manifests/app/cpu -n cpu


# 4Test Custom-Metric                                           #CAOFF 2 node only
./hpa/custom-metrics.sh
kubectl apply -f manifests/app/custom/hpa-custom.yaml -n app
set_service_ip app
# Check if the HPA metric is set to 0 
kubectl get hpa -n app
jmeter -n -t jmeter/cpu-request-settings.jmx -l jmeter/custom-2000-${RAMP_UP}-300-hpa-2-nodes.csv -e -o custom-2000-${RAMP_UP}-300-hpa-2-nodes
./hpa/custom-metrics-delete.sh
kubectl delete -f manifests/app/custom/hpa-custom.yaml -n app


# 5Test CPU with Cluster Autoscaling                            #CAON 2-4 node
kubectl apply -f manifests/app/cpu -n cpu
set_service_ip cpu
jmeter -n -t jmeter/cpu-request-settings.jmx -l jmeter/cpu-2000-${RAMP_UP}-300-hpa-2-4-nodes4.csv -e -o cpu-2000-${RAMP_UP}-300-hpa-2-4-nodes4
kubectl delete -f manifests/app/cpu -n cpu

# 6Test Custom-Metric with Cluster Autoscaling                  #CAON 2-4 node
./hpa/custom-metrics.sh
kubectl apply -f manifests/app/custom/hpa-custom.yaml -n app
set_service_ip app
# Check if the HPA metric is set to 0
kubectl get hpa -n app
jmeter -n -t jmeter/cpu-request-settings.jmx -l jmeter/custom-2000-${RAMP_UP}-300-hpa-2-4-nodes.csv -e -o custom-2000-${RAMP_UP}-300-hpa-2-4-nodes
kubectl delete -f manifests/app/custom/hpa-custom.yaml -n app
./hpa/custom-metrics-delete.sh

                                        ### TEST VPA ###
kubectl create namespace vpa
kubectl apply -f manifests/app/vpa/ -n vpa
set_service_ip vpa
jmeter -n -t jmeter/small-load.jmx -l jmeter/cpu-50-${RAMP_UP}-infinite-vpa-2-nodes.csv -e -o jmeter/cpu-50-${RAMP_UP}-infinite-vpa-2-nodes

# 7Test CPU                                                     #CAOFF 2 node only

jmeter -n -t jmeter/cpu-request-settings.jmx -l jmeter/cpu-2000-${RAMP_UP}-300-vpa-2-nodes.csv -e -o cpu-2000-${RAMP_UP}-300-vpa-2-nodes

# Test Custom-Metric 
VPA only works with CPU and memory usage

# 8Test CPU with Cluster Autoscaling                           #CAON 2-4 node

jmeter -n -t jmeter/cpu-request-settings.jmx -l jmeter/cpu-2000-${RAMP_UP}-300-vpa-2-4-nodes.csv -e -o cpu-2000-${RAMP_UP}-300-vpa-2-4-nodes

# Test Custom-Metric with Cluster Autoscaling
VPA only works with CPU and memory usage

kubectl delete -f manifests/app/vpa/ -n vpa
