FROM centos:latest

ADD chrome.repo /etc/yum.repos.d/chrome.repo
RUN yum -y update; yum clean all
RUN yum -y install  openssh-server openssh-clients passwd initscripts wget unzip git ca-certificatesn openssl sudo which firefox Xvfb; yum clean all
RUN yum -y install  google-chrome-stable --skip-broken
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
ADD ./geckodriver /usr/bin
ADD ./chromedriver /usr/bin
ADD ./gradle-env.sh /etc/profile.d/
ADD ./maven-env.sh /etc/profile.d/
ADD ./sudoers /etc/sudoers
RUN chown root:root /usr/bin/geckodriver; chmod 755 /usr/bin/geckodriver; mkdir /var/lib/jenkins; dbus-uuidgen > /etc/machine-id; 
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
RUN cd /opt; wget http://apache.osuosl.org/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz; tar xzvf apache-maven-3.5.4-bin.tar.gz; rm -f apache-maven-3.5.4-bin.tar.gz; ln -s apache-maven-3.5.4 maven
RUN mkdir /.mozilla /.pki; chmod 777 /.mozilla /.pki
RUN rpm -i https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

#ENTRYPOINT ["/bin/bash"]
