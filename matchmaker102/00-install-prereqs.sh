# NOTE: This script assumes that 
# Docker and the gcloud SDK are 
# already installed on your machine.

# Load Config
. ./config

# Enable necessary GCP services
gcloud services enable container.googleapis.com
gcloud services enable artifactregistry.googleapis.com
gcloud services enable containerregistry.googleapis.com

# Setup Google Artifact Registry
gcloud artifacts repositories create ${GCP_ARTIFACT_REGISTRY_NAME} \
--repository-format=docker \
--location=${GCP_ARTIFACT_REGISTRY_REGION} \
--description="Open Match Docker Repo"

# Verify that repo has been created
gcloud artifacts repositories list

# Set up authentication to Docker repositories in the region
gcloud auth configure-docker "${GCP_ARTIFACT_REGISTRY_REGION}-docker.pkg.dev"
gcloud auth configure-docker "${GCP_ARTIFACT_REGISTRY_REGION}-docker.pkg.dev"

# -------

# Tag the Docker image with a repository name
# Example: docker tag my-image LOCATION-docker.pkg.dev/PROJECT-ID/REPOSITORY/IMAGE
#docker tag us-docker.pkg.dev/google-samples/containers/gke/hello-app:1.0 \
#us-central1-docker.pkg.dev/PROJECT/quickstart-docker-repo/quickstart-image:tag1

# Docker push to Artifact Registry
#docker push us-central1-docker.pkg.dev/PROJECT/quickstart-docker-repo/quickstart-image:tag1

# Docker pull from Artifact Registry
#docker pull us-central1-docker.pkg.dev/PROJECT/quickstart-docker-repo/quickstart-image:tag1

