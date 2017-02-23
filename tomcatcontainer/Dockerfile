FROM centos:latest

RUN yum -y update; yum clean all
RUN yum -y install uuid openssh-server openssh-clients passwd initscripts wget unzip sudo net-tools; yum clean all
RUN useradd tomcat
RUN mkdir -p /root/.ssh
RUN mkdir -p /home/tomcat/.ssh; mkdir -p /home/tomcat/tmp
RUN rm -f /etc/ssh/sshd_config
ADD ./sshd_config /etc/ssh/sshd_config
RUN wget https://s3.amazonaws.com/secureci-demo/jdk.rpm -O /jdk-8u112-linux-x64.rpm
COPY ./apache-tomcat-9.0.0.M17.tar.gz /opt/apache-tomcat-9.0.0.M17.tar.gz
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
RUN rpm -i /jdk-8u112-linux-x64.rpm; rm -f /jdk-8u112-linux-x64.rpm
RUN /rootpass.sh; rm -f /rootpass.sh; /tomcat.sh; rm -f /tomcat.sh
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 
RUN cd /opt/; tar xzvf /opt/apache-tomcat-9.0.0.M17.tar.gz; ln -s apache-tomcat-9.0.0.M17 tomcat9; chown -R tomcat:tomcat /opt/tomcat9

ENTRYPOINT ["/start.sh"]
