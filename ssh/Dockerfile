FROM centos:centos7
MAINTAINER Jose De la Rosa "https://github.com/jose-delarosa"

# User we'll use to login with
ENV USER user 

# Update and install required packages
RUN yum -y update && yum -y install openssh-server; yum clean all

# Create needed SSH keys
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key; \
    ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N j3abnYQ9ju7g

# Setup for certificate login ONLY
RUN sed -i -e 's/#RSAAuthentication yes/RSAAuthentication yes/' \
           -e 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' \
           -e 's/#PermitRootLogin yes/PermitRootLogin no/' \
           -e 's/PasswordAuthentication yes/PasswordAuthentication no/' \
           -e 's/#PermitEmptyPasswords no/PermitEmptyPasswords no/' \
           /etc/ssh/sshd_config

# Create user ($HOME for $USER will be /home/$USER)
RUN useradd -c "Login User" -m $USER; \
    mkdir /home/$USER/.ssh && chmod 700 /home/$USER/.ssh

# Place public SSH key in place
COPY id_rsa.pub /home/$USER/.ssh/authorized_keys
RUN chown -R $USER.$USER /home/$USER/.ssh

CMD ["/usr/sbin/sshd", "-D"]
