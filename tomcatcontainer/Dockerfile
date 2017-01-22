FROM jenkins.darkseer.org:444/centos:latest

RUN yum -y update; yum clean all
RUN yum -y install uuid openssh-server openssh-clients passwd initscripts wget unzip sudo; yum clean all
RUN useradd tomcat
RUN mkdir -p /root/.ssh
RUN mkdir -p /home/tomcat/.ssh
RUN rm -f /etc/ssh/sshd_config
ADD ./sshd_config /etc/ssh/sshd_config
ADD ../bin/jdk-8u112-linux-x64.rpm /jdk-8u112-linux-x64.rpm
ADD ./rootpass.sh /rootpass.sh
ADD ./tomcat.sh /tomcat.sh
ADD ./start.sh /start.sh
ADD ./authorized_keys /root/.ssh/authorized_keys
ADD ./authorized_keys /home/tomcat/.ssh/authorized_keys
ADD ./sudoers /etc/sudoers
RUN chmod 440 /etc/sudoers
RUN chown -R tomcat:tomcat /home/tomcat
RUN chmod 755 /start.sh
RUN chmod 755 /rootpass.sh
RUN chmod 755 /tomcat.sh
RUN rpm -i /jdk-8u112-linux-x64.rpm
RUN rm -f /jdk-8u112-linux-x64.rpm
RUN /rootpass.sh; rm -f /rootpass.sh
RUN /tomcat.sh; rm -f /tomcat.sh
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 

ENTRYPOINT ["/bin/bash"]
