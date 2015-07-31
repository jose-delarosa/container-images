# Use CentOS 7 base image from Docker Hub
FROM centos:centos7
MAINTAINER Jose De la Rosa "https://github.com/jose-delarosa" 

# Do overall update and install missing packages needed for OpenManage
RUN yum -y update
RUN yum -y install gcc wget perl passwd which tar
RUN yum -y install libstdc++.so.6 compat-libstdc++-33.i686 glibc.i686

# Set login credentials
RUN echo 'root:password' | chpasswd

# Define OMSA repo
RUN wget -q -O - http://linux.dell.com/repo/hardware/latest/bootstrap.cgi | bash

# Install all but we could select specific components to reduce image size
RUN yum -y install srvadmin-all

# Clean cache to minimize container image
RUN yum clean all

# Add to PATH
ENV PATH $PATH:/opt/dell/srvadmin/bin:/opt/dell/srvadmin/sbin

# Restart application to ensure a clean start
CMD srvadmin-services.sh restart && tail -f /opt/dell/srvadmin/var/log/openmanage/dcsys64.xml
