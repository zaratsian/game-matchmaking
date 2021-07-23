
# Delete Open Match and the corresponding sample components from this cluster
kubectl delete psp,clusterrole,clusterrolebinding --selector=release=open-match
kubectl delete namespace open-match

# Delete GKE Cluster
gcloud container clusters delete --zone us-west1-a open-match-cluster

