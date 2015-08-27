# Dell iDrac Service Module (iSM)

Dockerized iSM, built on top of [official CentOS](https://registry.hub.docker.com/u/library/centos/) images.

## Configuration

  - container has to run in privilged mode.
  - container has to run with --net=host so it can access 'idrac' USB interface.
  - default command: `/opt/dell/srvadmin/iSM/sbin/dsm_ism_srvmgrd`.
  - iSM is accessed through iDRAC

## Where this image has been tested

  - RHEL 7
  - CentOS 7 (future)
  - Ubuntu Server 12.04 & 14.04 (future)
  - Debian 7 & 8 (future)

## Run example

```bash
$ docker run --privileged --net=host -d -P --restart=always \
   --name=ism21 jdelaros1/ism21:latest
```

## Known Issues

  - None so far.

## Support

Please note this image is provided as-is and not supported by Dell in any shape or form.

## Report problems or provide feedback

If you run into any problems or would like to provide feedback, please send a note to the [Linux-PoweEdge mailing list](https://lists.us.dell.com/mailman/listinfo/linux-poweredge).
