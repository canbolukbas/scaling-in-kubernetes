#https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler
#https://cloud.google.com/kubernetes-engine/docs/concepts/cluster-autoscaler 

gcloud container clusters create example-cluster \
  --num-nodes 2 \
  --zone us-central1-a \
  --node-locations us-central1-a,us-central1-b,us-central1-f \
  --enable-autoscaling --min-nodes 3 --max-nodes 10