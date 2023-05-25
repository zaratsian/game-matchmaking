# Load config
. ./config

# Enable necessary GCP services
# NOTE: Change to to Artifact Registry
gcloud services enable containerregistry.googleapis.com
gcloud services enable container.googleapis.com

# Create a GKE Cluster in this project
# https://cloud.google.com/sdk/gcloud/reference/container/clusters/create
gcloud container clusters create ${GKE_CLUSTER_NAME} \
    --enable-ip-alias \
    --machine-type ${GKE_MACHINE_TYPE} \
    --zone ${GKE_MACHINE_ZONE} \
    --num-nodes=${GKE_MIN_NODES} \
    --enable-autoscaling \
    --min-nodes=${GKE_MIN_NODES} \
    --max-nodes=${GKE_MAX_NODES} \
    --tags ${GKE_CLUSTER_TAGS}

# Get kubectl credentials against GKE
# Updates a kubeconfig file with appropriate credentials and 
# endpoint information to point kubectl at a specific cluster in 
# Google Kubernetes Engine
# https://cloud.google.com/sdk/gcloud/reference/container/clusters/get-credentials
gcloud container clusters get-credentials ${GKE_CLUSTER_NAME} --zone ${GKE_MACHINE_ZONE}

# Install the core Open Match services.
# 01-open-match-core.yaml installs Open Match with the default configs.
kubectl apply --namespace open-match \
    -f https://open-match.dev/install/v1.7.0/yaml/01-open-match-core.yaml

# Get the Pod State
# NOTE: Open Match needs to be customized to run as a Matchmaker.
# This custom configuration is provided to the Open Match 
# components via a ConfigMap (om-configmap-override). 
# Thus, starting the core service pods will remain in 
# ContainerCreating until this config map is available.
kubectl get -n open-match pod

# Install the Default Evaluator
kubectl apply --namespace open-match \
    -f https://open-match.dev/install/v1.7.0/yaml/06-open-match-override-configmap.yaml \
    -f https://open-match.dev/install/v1.7.0/yaml/07-open-match-default-evaluator.yaml

