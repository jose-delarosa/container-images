d=`pwd`
cd /share1/git/docker-images/redis-python-k8s
docker build -t frontend .

docker run -d -p 5000:5000 --restart=always --name registry registry:2
echo "Sleeping for 2 seconds..."
sleep 2

docker tag redis m1.dlr.com:5000/redis
docker push m1.dlr.com:5000/redis
docker rmi m1.dlr.com:5000/redis

docker tag frontend:latest m1.dlr.com:5000/frontend
docker push m1.dlr.com:5000/frontend
docker rmi m1.dlr.com:5000/frontend
docker rmi frontend

kubectl apply -f $d/redis.yml
echo "Sleeping for 5 seconds..."
sleep 5
kubectl apply -f $d/frontend.yml

kubectl get all
