cd /share1/git/docker-images/redis-python
docker build -t myapp .

docker run -d -p 5000:5000 --restart=always --name registry registry:2
echo "Sleeping for 2 seconds..."
sleep 2

docker tag redis:alpine m1.dlr.com:5000/redis
docker push m1.dlr.com:5000/redis
docker rmi m1.dlr.com:5000/redis

docker tag myapp:latest m1.dlr.com:5000/myapp
docker push m1.dlr.com:5000/myapp
docker rmi m1.dlr.com:5000/myapp
docker rmi myapp

kubectl apply -f /root/redis.yml
echo "Sleeping for 5 seconds..."
sleep 5
kubectl apply -f /root/myapp.yml

kubectl get all -o wide
echo "Done!"
