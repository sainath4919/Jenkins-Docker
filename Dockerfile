# Pull base image
FROM tomcat

# Maintainer
MAINTAINER "Thippeswamy"

# copy war file on to container
COPY ./webapp/target/webapp.war /usr/local/tomcat/webapps
