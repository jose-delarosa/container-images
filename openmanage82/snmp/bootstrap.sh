#!/bin/bash
srvadmin-services.sh restart
/usr/sbin/snmpd
tail -f /opt/dell/srvadmin/var/log/openmanage/dcsys64.xml
