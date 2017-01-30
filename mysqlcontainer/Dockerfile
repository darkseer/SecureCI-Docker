FROM centos:latest

ADD ./mariadb.repo /etc/yum.repos.d/mariadb.repo
RUN yum -y update; yum clean all
RUN yum -y install uuid openssh-server openssh-clients passwd initscripts wget unzip sudo net-tools mariadb-client mariadb-server; yum clean all
RUN mkdir -p /root/.ssh
RUN rm -f /etc/ssh/sshd_config
ADD ./sshd_config /etc/ssh/sshd_config
ADD ./rootpass.sh /rootpass.sh
ADD ./start.sh /start.sh
ADD ./authorized_keys /root/.ssh/authorized_keys
ADD ./authorized_keys /home/tomcat/.ssh/authorized_keys
ADD ./server.cnf /etc/my.cnf.d/server.cnf
ADD ./init.sql /init.sql
RUN chmod 755 /start.sh
RUN chmod 755 /rootpass.sh
RUN /rootpass.sh; rm -f /rootpass.sh;
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 
RUN mkdir /var/run/mariadb; chown mysql:mysql /var/run/mariadb
RUN mkdir /var/lib/mysql; /usr/bin/mysql_install_db; chown -R mysql:mysql /var/lib/mysql

ENTRYPOINT ["/start.sh"]
