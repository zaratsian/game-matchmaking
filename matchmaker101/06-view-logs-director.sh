
kubectl get pods -n mm101-tutorial

sleep 2

echo ""
kubectl logs -n mm101-tutorial pod/mm101-tutorial-director --tail 50


