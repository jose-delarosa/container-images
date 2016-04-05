# check_openmanage - Dell OpenManage plugin for Nagios

Dockerized [Nagios plugin check_openmanage](http://folk.uio.no/trondham/software/check_openmanage.html) to query a Dell server running OpenManange Server Administrator (OMSA) via SNMP. Built on top of [official CentOS](https://registry.hub.docker.com/u/library/centos/) images.

## Configuration

Use against a server running OMSA with SNMP enabled and properly configured. Check [here](https://github.com/jose-delarosa/docker-images/tree/master/openmanage82/snmp) for configuration information.

## Where this image has been tested

  - RHEL 7
  - CentOS 7

## Run example

```bash
$ docker run -it --rm checkopenmanage check_openmanage -H <server-with-omsa>
OK - System: 'PowerEdge R730', SN: 'xyzxyz', 256 GB ram (16 dimms), 2 logical drives, 8 physical drives
```

## Support

Please note this image is provided as-is and not supported by Dell in any shape or form.

## Report problems or provide feedback

If you run into any problems or would like to provide feedback, please send a note to the [Linux-PoweEdge mailing list](https://lists.us.dell.com/mailman/listinfo/linux-poweredge).
