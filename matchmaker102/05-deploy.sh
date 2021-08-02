# Load config
. ./config

REGISTRY="${GCP_ARTIFACT_REGISTRY_REGION}-docker.pkg.dev/${GCP_PROJECT_ID}/${GCP_ARTIFACT_REGISTRY_NAME}"
echo "Artifact Registry Path: ${REGISTRY}"

TUTORIALROOT=open-match/tutorials/matchmaker102/
cd $TUTORIALROOT

# Deploy the Match Function, the Game Frontend and the Director 
# to the same cluster as Open Match deployment but to a different namespace. 
# The $TUTORIALROOT/matchmaker.yaml deploys these components to a mm101-tutorial namespace
sed "s|REGISTRY_PLACEHOLDER|$REGISTRY|g" matchmaker.yaml | kubectl apply -f -
