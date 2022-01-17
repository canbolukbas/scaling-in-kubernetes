# Scaling In Kubernetes
### Endpoints
- Enter `http://127.0.0.1:8080/cpu` for CPU intensive task.
- Enter `http://127.0.0.1:8080/memory` for memory intensive task.

## Before You Start

When you create a GKE cluster do the following

```
./manifests/metrics-server.sh
```

Then you can follow the scripts under `hpa`, `vpa` and `cluster-autoscaler` folders.

## Docker Examples
1- To build docker image:
```
docker build . -t cakmadam/autoscaling-app:0.2
```
2- To push docker image:
```
docker push cakmadam/autoscaling-app:0.2
```
3- To run docker locally:
```
docker run -it --rm -p 8080:8080 cakmadam/autoscaling-app:0.2
```

## Testing with JMeter
1- Enter GUI. Change JMX file's path variables. Close GUI.
2- Run below on CLI:
```
jmeter -n -t [jmx file] -l [results file (csv)] -e -o [Path to web report folder]
```

To construct HTML report from the CSV results:
``` jmeter -g [results file (csv)] -o [Path to web report folder] ```
