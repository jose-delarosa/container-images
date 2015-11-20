# Dell OpenManage

Dockerized OpenManage, built on top of [official CentOS](https://registry.hub.docker.com/u/library/centos/) images.

## Configuration

  - container has to run in privilged mode so that the host hardware can be exposed to it.
  - to prevent device drivers from being built via DKS (Dynamic Kernel Support) we fool OMSA into thinking we're running in RHEL 7 (not CentOS 7), so the OS information reported by OMSA will be RHEL 7 (refer to the Dockerfile).
  - default command: `/opt/dell/srvadmin/sbin/srvadmin-services.sh restart` so that services can start cleanly in case container is stopped and then restarted.
  - login credentials: root / password

## Where this image has been tested (some more than others)

  - RHEL 7
  - SLES 12
  - CentOS 7
  - Ubuntu Server 12.04 & 14.04
  - Debian 7 / 8

## Run example

```bash
$ docker run --privileged -d -p 1311:1311 --restart=always \
    -v /lib/modules/`uname -r`:/lib/modules/`uname -r` \
    --name=omsa81 jdelaros1/openmanage
```

UPDATE (11.20.2015): Testing without volume mounting /lib/modules resulted in mixed results across different servers, so I am adding this requirement back.

Once the container starts, give it about 20-25 seconds for all the OpenManage services to start inside the container.

From the CLI, you can run something like `docker exec omsa81 omreport system summary` or use a browser to go to https://your-server-ip:1311 and use login credentials listed above.

## Known Issues

  - IP and MAC information in network controllers is not available.

## Support

Please note this image is provided as-is and not supported by Dell in any shape or form.

## Report problems or provide feedback

If you run into any problems or would like to provide feedback, please send a note to the [Linux-PoweEdge mailing list](https://lists.us.dell.com/mailman/listinfo/linux-poweredge).
