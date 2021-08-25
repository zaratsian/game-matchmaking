# Load Config
. ./config

REGISTRY="${GCP_ARTIFACT_REGISTRY_REGION}-docker.pkg.dev/${GCP_PROJECT_ID}/${GCP_ARTIFACT_REGISTRY_NAME}"
echo "Artifact Registry Path: ${REGISTRY}"

#kubectl create namespace ${NAMESPACE}

# Build the image.
docker build -t $REGISTRY/${NAMESPACE}-director -f containers/director/Dockerfile .

# Push the image to the configured Registry.
docker push $REGISTRY/${NAMESPACE}-director
