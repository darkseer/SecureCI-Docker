#!/bin/bash
cp /home/tomcat/tmp/*.war /opt/tomcat9/webapps
/opt/tomcat9/bin/catalina.sh run
