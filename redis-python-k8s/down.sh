kubectl delete svc redissvc
kubectl delete svc myappsvc
kubectl delete rc myapp
kubectl delete rc myredis

docker stop registry
docker rm registry

echo "Sleeping for 3 seconds..."
sleep 3
kubectl get all -o wide
echo "Done!"
