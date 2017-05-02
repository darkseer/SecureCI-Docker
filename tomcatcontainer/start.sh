#!/bin/bash
if [ -f /home/tomcat/tmp/env.properties ] ; then cp /home/tomcat/tmp/env.properties /opt/tomcat9/lib; fi
cp /home/tomcat/tmp/*.war /opt/tomcat9/webapps
echo ${MYSQL_PORT} | sed -e 's/tcp:\(\/\/.*\)/db.url=jdbc:mysql:\1\/speaker/g' >> /opt/tomcat9/lib/env.properties
echo "" >> /opt/tomcat9/lib/env.properties
export JAVA_OPTS="${JAVA_OPTS} -javaagent:/opt/tomcat9/lib/jacoco-agent.jar=destfile=/home/tomcat/tmp/jacoco-it.exec,append=true,includes=com.coveros.*"
/opt/tomcat9/bin/catalina.sh run
