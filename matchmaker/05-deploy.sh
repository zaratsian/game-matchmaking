# Load config
. ./config

git clone https://github.com/googleforgames/open-match.git

TUTORIALROOT=open-match/tutorials/matchmaker101/
cd $TUTORIALROOT

# Deploy the Match Function, the Game Frontend and the Director 
# to the same cluster as Open Match deployment but to a different namespace. 
# The $TUTORIALROOT/matchmaker.yaml deploys these components to a mm101-tutorial namespace
sed "s|REGISTRY_PLACEHOLDER|$REGISTRY|g" matchmaker.yaml | kubectl apply -f -

# Cleanup 
rm -rf ../../../open-match
