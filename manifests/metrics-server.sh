 kg deployment -l k8s-app=metrics-server -A -o json | \
 jq '.items[0].spec.strategy.rollingUpdate.maxSurge = 1' | \
 jq '.items[0].spec.strategy.rollingUpdate.maxUnavailable = 0' | \
 jq '.items[0].spec.template.spec.containers[0].readinessProbe = {"httpGet": {"path": "/healthz", "port": "https", "scheme": "HTTPS"}}' | \
 sed --expression='s/--metric-resolution=30s/--metric-resolution=15s/g' | \
 kubectl apply -f -