# OMSA image with SNMP support. Open port 161/udp when running container.
FROM centos:centos7
MAINTAINER Jose De la Rosa "https://github.com/jose-delarosa"

# Environment variables
ENV PATH $PATH:/opt/dell/srvadmin/bin:/opt/dell/srvadmin/sbin
ENV USER root
ENV PASS password

# Do overall update and install missing packages needed for OpenManage
RUN yum -y update && \
    yum -y install gcc wget perl passwd which tar libstdc++.so.6 compat-libstdc++-33.i686 glibc.i686 net-snmp

# Set login credentials
RUN echo "$USER:$PASS" | chpasswd

# Add OMSA repo
RUN wget -q -O - http://linux.dell.com/repo/hardware/dsu/bootstrap.cgi | bash

# Let's "install all", however we can select specific components instead
RUN yum -y install srvadmin-all && yum clean all

# Prevent daemon helper scripts from making systemd calls
ENV SYSTEMCTL_SKIP_REDIRECT=1

# Restart application to ensure a clean start
CMD srvadmin-services.sh restart && /usr/sbin/snmpd && tail -f /opt/dell/srvadmin/var/log/openmanage/dcsys32.xml
