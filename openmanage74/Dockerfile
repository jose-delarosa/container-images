# Use centos6 base image from Docker Hub
FROM centos:centos6

# This could be anyone
MAINTAINER Jose De la Rosa "https://github.com/jose-delarosa" 

# Do update and install missing packages needed for OMSA
RUN yum -y update; yum -y install gcc wget perl passwd which tar

# Set password for root that I can use for the web UI
RUN echo 'root:password' | chpasswd

# Define OMSA repo
RUN wget -q -O - http://linux.dell.com/repo/hardware/latest/bootstrap.cgi | bash

# Install everything, but this could the trimmed down to reduce image size
RUN yum -y install srvadmin-all

# Clean cache to minimize container image
RUN yum clean all

# Simple hack so that srvadmin-services.sh stays running in foreground, else
# container will not run.
RUN echo "while true ; do" >> /opt/dell/srvadmin/sbin/srvadmin-services.sh
RUN echo "   sleep 60" >> /opt/dell/srvadmin/sbin/srvadmin-services.sh
RUN echo "done" >> /opt/dell/srvadmin/sbin/srvadmin-services.sh

# Add to $PATH
ENV PATH $PATH:/opt/dell/srvadmin/bin:/opt/dell/srvadmin/sbin

# Open web UI port. We could open more ports as needed
EXPOSE 1311

# Start application.
CMD ["/opt/dell/srvadmin/sbin/srvadmin-services.sh", "start"]
