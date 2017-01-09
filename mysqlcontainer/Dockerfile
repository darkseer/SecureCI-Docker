FROM jenkins.darkseer.org:444/centos:latest

RUN yum -y update; yum clean all
RUN yum -y install uuid openssh-server openssh-clients passwd initscripts wget unzip git; yum clean all
RUN mkdir -p /root/.ssh
RUN rm -f /etc/ssh/sshd_config
ADD ./sshd_config /etc/ssh/sshd_config
ADD ./rootpass.sh /rootpass.sh
ADD ./authorized_keys /root/.ssh/authorized_keys
RUN chmod 755 /rootpass.sh
RUN wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
RUN rpm -i mysql57-community-release-el7-9.noarch.rpm
RUN rm /etc/yum.repos.d/mysql-community.repo
ADD ./mysql-community.repo /etc/yum.repos.d/mysql-community.repo
RUN echo 192.168.1.15 jenkins.darkseer.org >> /etc/hosts
RUN yum install -y mysql-community-client mysql-community-server
RUN /rootpass.sh
RUN rm -f /rootpass.sh
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 

ENTRYPOINT ["/bin/bash"]
