FROM centos:7.5.1804
RUN yum -y update; yum clean all
RUN yum install -y \
    net-tools \
    ntp \
    openssh-server \
    openssh-clients \
    less \
    iproute \
	apr apr-util bzip2 curl krb5 libcurl libevent libxml2 libyaml zlib openldap openssh openssl openssl-libs perl readline rsync R sed tar zip java-1.8.0-openjdk \
    which; yum clean all
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN groupadd gpadmin
RUN useradd gpadmin -g gpadmin
RUN echo gpadmin | passwd gpadmin --stdin
ENTRYPOINT ["/usr/sbin/sshd", "-D"]

