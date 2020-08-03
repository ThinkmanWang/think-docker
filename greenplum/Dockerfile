FROM centos:7.5.1804
RUN yum -y update; yum clean all
RUN yum install -y \
    net-tools \
    ntp \
    openssh-server \
    openssh-clients \
    less \
    iproute \
    which; yum clean all
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN groupadd gpadmin
RUN useradd gpadmin -g gpadmin
RUN echo gpadmin | passwd gpadmin --stdin
ENTRYPOINT ["/usr/sbin/sshd", "-D"]

