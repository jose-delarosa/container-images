# Dell OpenManage

Dockerized OpenManage, built on top of [official CentOS](https://registry.hub.docker.com/u/library/centos/) images.

## Image tags

- jdelaros1/openmanage:latest
- jdelaros1/openmanage:8.1

## Configuration

  - container has to run in privilged mode so that the host hardware can be exposed to it.
  - exposed port 1311
  - default command: `/opt/dell/srvadmin/sbin/srvadmin-services.sh start`
  - login credentials: root / password

## Run example

```bash
$ docker run --privileged -d -p 1311:1311 --restart=always \
   -v /lib/modules/`uname -r`:/lib/modules/`uname -r` \
   --name=omsa81 jdelaros1/openmanage:8.1
```

Once the container starts, give it about 10-15 seconds for all the OpenManage services to start inside the container.

From the CLI, you can run something like `docker exec omsa81 omreport system summary` or use a browser to go to https://your-server-ip:1311 and use login credentials listed above.

## Known Issues

  - NIC and MAC information is not displayed.

## Support

Please note this image is provided as-is and not supported by Dell in any shape or form.

If you run into any problems with this image, please send a note to the [Linux-PoweEdge mailing list](https://lists.us.dell.com/mailman/listinfo/linux-poweredge).
