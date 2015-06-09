# Dell OpenManage

Dockerized OpenManage, built on top of [official CentOS](https://registry.hub.docker.com/u/library/centos/) images.

## Image tags

- jdelaros1/openmanage:7.4

## Configuration

  - please note container has to run in 'privilged' mode so that the host hardware is exposed to it.
  - exposed port 1311
  - default command: `/opt/dell/srvadmin/sbin/srvadmin-services.sh start`
  - login credentials: root / password

## Run example

```bash
$ docker run --privileged -d -p 1311:1311 \
   -v /lib/modules/`uname -r`:/lib/modules/`uname -r`\
   --name=omsa74 jdelaros1/openmanage:7.4
```

After the container starts, give it about 10-15 seconds for all the OpenManage services to start inside the container.

## Known Issues

  - NIC and MAC information is not found.

## Support

Please note this image is provided as-is and not supported by Dell in any form or shape.

If you run into any problems with this image, please send a note to the [Linux-PoweEdge mailing list](https://lists.us.dell.com/mailman/listinfo/linux-poweredge).
