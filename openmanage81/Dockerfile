# Use CentOS 7 base image from Docker Hub
FROM centos:centos7
MAINTAINER Jose De la Rosa "https://github.com/jose-delarosa" 

# Do overall update and install missing packages needed for OpenManage
RUN yum -y update; yum -y install gcc wget perl passwd which tar

# Set login credentials
RUN echo 'root:password' | chpasswd

# Define OMSA repo
RUN wget -q -O - http://linux.dell.com/repo/hardware/latest/bootstrap.cgi | bash

# Install all but we could select specific components to reduce image size
RUN yum -y install srvadmin-all

# Clean cache to minimize container image
RUN yum clean all

# Simple hack so that srvadmin-services.sh stays running in foreground,
# else container will not run.
RUN echo "while true ; do" >> /opt/dell/srvadmin/sbin/srvadmin-services.sh
RUN echo "   sleep 60" >> /opt/dell/srvadmin/sbin/srvadmin-services.sh
RUN echo "done" >> /opt/dell/srvadmin/sbin/srvadmin-services.sh

# Add to PATH
ENV PATH $PATH:/opt/dell/srvadmin/bin:/opt/dell/srvadmin/sbin

# Open web UI port
EXPOSE 1311

# Start application
CMD ["/opt/dell/srvadmin/sbin/srvadmin-services.sh", "start"]
