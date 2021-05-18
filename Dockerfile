# Pull base image
FROM tomcat:8-jre8

# Maintainer
MAINTAINER "Thippeswamy"

# copy war file on to container
COPY ./webapp/target/webapp.war /usr/local/tomcat/webapps
