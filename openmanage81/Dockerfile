# Use CentOS 7 base image from Docker Hub
FROM centos:centos7
MAINTAINER Jose De la Rosa "https://github.com/jose-delarosa"

# Do overall update and install missing packages needed for OpenManage
RUN yum -y update && \
    yum -y install gcc wget perl passwd which tar libstdc++.so.6 compat-libstdc++-33.i686 glibc.i686

# Set login credentials
RUN echo 'root:password' | chpasswd

# Add OMSA repo
RUN wget -q -O - http://linux.dell.com/repo/hardware/latest/bootstrap.cgi | bash

# Run "install all", but we can select specific components instead 
RUN yum -y install srvadmin-all && yum clean all

# Let's fool OMSA into thinking we're running in RHEL 7 so that we don't have
# to build device drivers and have to volume mount /lib/modules 
RUN echo "Red Hat Enterprise Linux Server release 7.1 (Maipo)" > /etc/redhat-release

# Add to PATH
ENV PATH $PATH:/opt/dell/srvadmin/bin:/opt/dell/srvadmin/sbin

# Prevent daemon helper scripts from making systemd calls
ENV SYSTEMCTL_SKIP_REDIRECT=1

# Restart application to ensure a clean start
CMD srvadmin-services.sh restart && tail -f /opt/dell/srvadmin/var/log/openmanage/dcsys64.xml
