# Dell OpenManage

Dockerized OpenManage Server Administrator (OMSA), built on top of [official CentOS](https://registry.hub.docker.com/u/library/centos/) images.

## Configuration

  - container has to run in privilged mode so that the host hardware can be exposed to it.
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
    --name=omsa82 jdelaros1/openmanage
```

Testing without volume mounting /lib/modules resulted in mixed results across different servers, so I added this requirement back.

Once the container starts, give it about 20-25 seconds for all the OpenManage services to start inside the container.

## Use

You can monitor your server by going to https://your-server:1311. Use the login credentials given above. You can also run commands from a command console:

```
$ docker exec omsa82 omreport chassis bios
BIOS Information

Manufacturer : Dell Inc.
Version      : 1.2.6
Release Date : 06/08/2015

$ docker exec omsa82 omreport chassis processors
Processors Information

Health : Ok

Index             : 0
Status            : Ok
Connector Name    : CPU1
Processor Brand   : Intel(R) Xeon(R) CPU E5-2630 v3 @ 2.40GHz
Processor Version : Model 63 Stepping 2
Current Speed     : 2400  MHz
State             : Present
Core Count        : 8

Index             : 1
Status            : Ok
Connector Name    : CPU2
Processor Brand   : Intel(R) Xeon(R) CPU E5-2630 v3 @ 2.40GHz
Processor Version : Model 63 Stepping 2
Current Speed     : 2400  MHz
State             : Present
Core Count        : 8

```

## Known Issues

  - IP and MAC information in network controllers is not available.
  - OS information reported is for the container, not the host.

## Support

Please note this image is provided as-is and not supported by Dell in any shape or form.

## Report problems or provide feedback

If you run into any problems or would like to provide feedback, please send a note to the [Linux-PoweEdge mailing list](https://lists.us.dell.com/mailman/listinfo/linux-poweredge).
