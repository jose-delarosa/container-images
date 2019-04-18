# Sample application to deploy on Kubernetes

This is a simple application to test your kubernetes environment. These
instructions assume that you have some experience with Kubernetes and a lot
of experience with any container runtime (here I use Docker).

The instructions here do not include any specific commands as it is assumed
you know exactly whay I am talking about. I may add specific commands in the
near future.

This is a simple python application that connects to a redis database and
increases a counter every time it gets a connection on port 5000. The counter
and the name of the python pod are displayed each time.

## A few things to keep in mind

* Assumes you already have a working Kubernetes cluster.
* Assumes you already have a local registry.
* The name of your k8s server should be `master`.
* Does not use persistent storage.

## Instructions

1. Pull latest generic redis image from Docker Hub and upload to your local registry.
2. Build custom python image in the `app/` directory, name it `frontend` and upload it to your local registry.
3. Deploy pods and services using the manifest files provided.
4. Get the service IP address.
5. Use `curl` to test the application on port 5000.
6. See the counter increase by one each time.


On the k8s master:
```bash
$ curl http://<frontend-service-IP>:5000
Host: frontend-b7c67b745-nhflf, Count: 1
$ curl http://<frontend-service-IP>:5000
Host: frontend-b7c67b745-dqmtc, Count: 2
$ curl http://<frontend-service-IP>:5000
Host: frontend-b7c67b745-mzdf7, Count: 3
```

In this example I have 3 application pods, so notice how the python pod name being used is different each time. This is random, the k8s service will select the pod that finds most suitable.

Since I am not using persistent storage here, if you deploy more than one redis pod, it is very likely that the python application will hit a different redis pod each time, so the counter will vary from pod to pod.

## Support

These instructions are provided as-is with no support.
