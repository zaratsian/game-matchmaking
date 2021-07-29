# Load config
. ./config

# Delete Open Match and the corresponding sample components from this cluster
kubectl delete psp,clusterrole,clusterrolebinding --selector=release=open-match
kubectl delete namespace open-match

# Delete GKE Cluster
gcloud container clusters delete --zone ${GKE_MACHINE_ZONE} ${GKE_CLUSTER_NAME}

