# Dell System Update (DSU)

Dockerized DSU, built on top of [official CentOS](https://registry.hub.docker.com/u/library/centos/) images.

Please note that this container image is for debugging purposes ONLY.

## Image tags

- jdelaros1/dsu:15.05.00

## Configuration

  - please note container has to run in 'privilged' mode so that the host hardware can be exposed to it.
  - ssh credentials: root / password

## Run example

```bash
$ docker run --privileged -d -P --name=dsu jdelaros1/dsu:15.05.00
```

Get IP address of container and login with credentials above. Once inside the container, run "dsu --inventory". See [here](http://linux.dell.com/repo/hardware/DSU_15.05.00/) for details.

## Known Issues

  - Hardware inventory does not work. This image is for debugging only.

## Support

Please note this image is provided as-is and not supported by Dell in any form or shape.
