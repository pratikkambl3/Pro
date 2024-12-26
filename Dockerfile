FROM tomcat:latest
MAINTAINER pratikkambl3<pratikkamble122@gmail.com>
EXPOSE 8080
COPY target/maven-web-app.war /usr/local/tomcat/webapps/
