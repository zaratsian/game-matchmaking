# Load Config
. ./config

REGISTRY="${GCP_ARTIFACT_REGISTRY_REGION}-docker.pkg.dev/${GCP_PROJECT_ID}/${GCP_ARTIFACT_REGISTRY_NAME}"
echo "Artifact Registry Path: ${REGISTRY}"

kubectl create namespace mm101-tutorial

cd ./containers/frontend

git clone https://github.com/googleforgames/open-match.git

# Build the Frontend image.
docker build -t $REGISTRY/mm101-tutorial-frontend .

# Push the Frontend image to the configured Registry.
docker push $REGISTRY/mm101-tutorial-frontend

# Cleanup 
rm -rf open-match
