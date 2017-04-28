#!/bin/bash
if [ -f /home/tomcat/tmp/env.properties ] ; then cp /home/tomcat/tmp/env.properties /opt/tomcat9/lib; fi
cp /home/tomcat/tmp/*.war /opt/tomcat9/webapps
cp /home/tomcat/tmp/*.properties /opt/tomcat9/conf
/opt/tomcat9/bin/catalina.sh run
