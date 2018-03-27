kubectl delete deployment -l app=redis
kubectl delete service -l app=redis
kubectl delete deployment -l app=guestbook
kubectl delete service -l app=guestbook

docker stop registry
docker rm registry

echo "Sleeping for 3 seconds..."
sleep 3
kubectl get all
