# This container doesn't do anything except run the sshd daemon. It can be used
# as a contained environment accessed remotely to retrieve or drop files for
# archival.
FROM centos:centos7
MAINTAINER Jose Delarosa "https://github.com/jose-delarosa"

# User to login with
ENV USER jose 

# Update and install required packages
RUN yum -y update && yum -y install openssh-server; yum clean all

# Create SSH keys
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

# Edit SSH config file to allow login via certificate only
RUN sed -i -e 's/#RSAAuthentication yes/RSAAuthentication yes/' \
           -e 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' \
           -e 's/#PermitRootLogin yes/PermitRootLogin no/' \
           -e 's/PasswordAuthentication yes/PasswordAuthentication no/' \
           -e 's/#PermitEmptyPasswords no/PermitEmptyPasswords no/' \
           /etc/ssh/sshd_config

# Create user and directory where public key will be dropped.
# Alternatively, /home/$USER could be volume-mounted so no need to mkdir ~/.ssh
RUN useradd -m $USER; mkdir /home/$USER/.ssh && chmod 700 /home/$USER/.ssh

# Copy public SSH key into container.
COPY id_rsa.pub /home/$USER/.ssh/authorized_keys
RUN chown -R $USER.$USER /home/$USER/.ssh

CMD ["/usr/sbin/sshd", "-D"]
