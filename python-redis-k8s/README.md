# Sample application to deploy on Kubernetes

This is a simple application to test your kubernetes environment. These
instructions assume that you have some experience with Kubernetes and a lot
of experience with any container runtime (here I use podman).

This is a simple python application that connects to a redis database and
increases a counter every time it gets a connection on port 5000. The counter
and the name of the python pod are displayed each time. The redis container
does not use persistent storage.

## A few things to keep in mind

* Assumes there is already an working Kubernetes cluster
* Assumes there is already a local registry

## Instructions

1. Pull latest generic redis image from Docker Hub and upload to your local registry.
2. Build custom python image in the `app/` directory, name it `frontend` and upload it to the local registry.
3. Deploy pods and services using the manifest files provided.
4. Get the service IP address.
5. Use `curl` to test the application on port 5000.
6. See the counter increase by one each time.


Curl the kubernetes frontend service:
```bash
$ curl http://<frontend-service-IP>:5000
Host: frontend-b7c67b745-nhflf, Count: 1
$ curl http://<frontend-service-IP>:5000
Host: frontend-b7c67b745-dqmtc, Count: 2
$ curl http://<frontend-service-IP>:5000
Host: frontend-b7c67b745-mzdf7, Count: 3
```

In this example there are 3 application pods, so notice how the python pod name being used is different each time. This is random, the kubernetes service will select the pod that finds most suitable.

Since there is no persistent storage here, if you deploy more than one redis pod, it is very likely that the python application will hit a different redis pod each time, so the counter will vary from pod to pod.

## Support

These instructions are provided as-is with no support.
