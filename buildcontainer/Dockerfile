FROM centos:latest

RUN yum -y update; yum clean all
RUN yum -y install uuid openssh-server openssh-clients passwd initscripts wget unzip git ca-certificatesn openssl sudo which; yum clean all
RUN useradd jenkins
RUN mkdir -p /root/.ssh
RUN mkdir -p /home/jenkins/.ssh
RUN rm -f /etc/ssh/sshd_config
ADD ./sshd_config /etc/ssh/sshd_config
RUN wget https://s3.amazonaws.com/secureci-demo/jdk.rpm -O /jdk-8u112-linux-x64.rpm
ADD ./rootpass.sh /rootpass.sh
ADD ./jenkinspass.sh /jenkinspass.sh
ADD ./start.sh /start.sh
ADD ./authorized_keys /root/.ssh/authorized_keys
ADD ./authorized_keys /home/jenkins/.ssh/authorized_keys
ADD ./gradle-env.sh /etc/profile.d/
ADD ./maven-env.sh /etc/profile.d/
ADD ./sudoers /etc/sudoers
RUN chmod 440 /etc/sudoers
RUN chmod 755 /etc/profile.d/gradle-env.sh
RUN chown -R jenkins:jenkins /home/jenkins
RUN chmod 755 /start.sh
RUN chmod 755 /rootpass.sh
RUN chmod 755 /jenkinspass.sh
RUN rpm -i /jdk-8u112-linux-x64.rpm
RUN rm -f /jdk-8u112-linux-x64.rpm
RUN /rootpass.sh
RUN rm -f /rootpass.sh
RUN /jenkinspass.sh
RUN rm -f /jenkinspass.sh
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 
RUN wget https://services.gradle.org/distributions/gradle-3.3-bin.zip
RUN unzip -d /opt/ gradle-3.3-bin.zip
RUN rm -f gradle-3.3-bin.zip
RUN ln -s /opt/gradle-3.3 /opt/gradle
RUN cp /opt/gradle/bin/gradle /opt/gradle/bin/gradle.bin
ADD ./gradlewrapper.sh /opt/gradle/bin/gradle
RUN chmod 755 /opt/gradle/bin/gradle
RUN ln -s /opt/gradle/bin/gradle /usr/bin/gradle
RUN cd /opt; wget http://mirror.nexcess.net/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz; tar xzvf apache-maven-3.3.9-bin.tar.gz; rm -f apache-maven-3.3.9-bin.tar.gz; ln -s apache-maven-3.3.9 maven

ENTRYPOINT ["/bin/bash"]
