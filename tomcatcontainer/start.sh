#!/bin/bash
if [ -f /home/tomcat/tmp/env.properties ] ; then cp /home/tomcat/tmp/env.properties /opt/tomcat9/conf; fi
cp /home/tomcat/tmp/*.war /opt/tomcat9/webapps
echo ${MYSQL_PORT} | sed -e 's/tcp:\(\/\/.*\)/db.url=jdbc:mysql:\1\/speaker/g' >> /opt/tomcat9/conf/env.properties
echo "" >> /opt/tomcat9/conf/env.properties
/opt/tomcat9/bin/catalina.sh run
