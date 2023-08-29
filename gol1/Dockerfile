FROM tomcat:9-jdk8
LABEL author="divyak"
RUN curl https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/gameoflife.war
COPY ./gameoflife.war /usr/local/tomcat/webapps/
EXPOSE 8080