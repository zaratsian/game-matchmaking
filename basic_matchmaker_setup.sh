# Container Registry URI
REGISTRY=gcr.io/$(gcloud config list --format 'value(core.project)')-basic-matchmaker

# Clone Open Match Repo
git clone https://github.com/googleforgames/open-match.git

# Set path to matchmaker 101 assets
TUTORIALROOT=open-match/tutorials/matchmaker101

# Create matchmaker namespace
kubectl create namespace mm101-tutorial




