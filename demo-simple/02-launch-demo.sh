# Deploys a Match Function and the core demo application in under the open-match-demo namespace
kubectl create namespace open-match-demo
kubectl apply --namespace open-match-demo \
    -f https://open-match.dev/install/v1.2.0/yaml/02-open-match-demo.yaml

# Run this command to make the Demo’s service available locally
kubectl port-forward --namespace open-match-demo service/om-demo 51507:51507

echo "The demo should now be available at localhost:51507"

