# Load Config
. ./config

REGISTRY="${GCP_ARTIFACT_REGISTRY_REGION}-docker.pkg.dev/${GCP_PROJECT_ID}/${GCP_ARTIFACT_REGISTRY_NAME}"
echo "Artifact Registry Path: ${REGISTRY}"

#kubectl create namespace mm101-tutorial

cd ./containers/matchfunction

git clone https://github.com/googleforgames/open-match.git

# Build the image.
docker build -t $REGISTRY/mm101-tutorial-matchfunction .

# Push the image to the configured Registry.
docker push $REGISTRY/mm101-tutorial-matchfunction

# Cleanup 
rm -rf open-match