
kubectl get pods -n mm101-tutorial

sleep 2

echo ""
kubectl logs -n mm101-tutorial pod/mm101-tutorial-matchfunction --tail 50
