# Load Configs
. ./config

echo "[ WARNING ] Deleting mm101-tutorial namespace in 3 seconds..."
kubectl get namespace
sleep 3
kubectl delete namespace mm101-tutorial
kubectl get namespace

#echo "[ WARNING ] Deleting GKE Cluster ${GKE_CLUSTER_NAME} in 15 seconds..."
#gcloud container clusters list
#sleep 15
#gcloud container clusters delete ${GKE_CLUSTER_NAME}
#gcloud container clusters list
