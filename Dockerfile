FROM tomcat:9-jdk8
LABEL organisation "PRACTICE"
WORKDIR /usr/local/tomcat
COPY gameoflife.war /usr/local/tomcat/gameoflife.war
EXPOSE 8080