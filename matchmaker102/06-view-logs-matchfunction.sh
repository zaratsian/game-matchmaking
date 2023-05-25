
kubectl get pods -n mm102-tutorial

sleep 2

kubectl logs -n mm102-tutorial pod/mm102-tutorial-matchfunction --tail 50


