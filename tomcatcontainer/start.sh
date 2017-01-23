#!/bin/bash
if [ -f /home/tomcat/tmp/env.properties ] ; then cp /home/tomcat/tmp/env.properties /opt/tomcat9/lib; fi
cp /home/tomcat/tmp/*.war /opt/tomcat9/webapps
/opt/tomcat9/bin/catalina.sh run
