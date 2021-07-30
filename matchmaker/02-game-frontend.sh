# Load Config
. ./config

REGISTRY="${GCP_ARTIFACT_REGISTRY_REGION}-docker.pkg.dev/${GCP_PROJECT_ID}/${GCP_ARTIFACT_REGISTRY_NAME}"
echo "Artifact Registry Path: ${REGISTRY}"

# Create Namespace
kubectl create namespace mm101-tutorial

# Clone Open Match Repo
git clone https://github.com/googleforgames/open-match.git

# Build the Frontend image.
docker build -t $REGISTRY/mm101-tutorial-frontend -f containers/frontend/Dockerfile .

# Push the Frontend image to the configured Registry.
docker push $REGISTRY/mm101-tutorial-frontend
