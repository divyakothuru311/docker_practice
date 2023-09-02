#Dockerfile for spc application in multistaging

FROM maven:3.9-amazoncorretto-17 AS builder
#git cloned the spc in docker host and copied the application into /spc
COPY spring-petclinic /spc
RUN cd /spc && mvn package

FROM amazoncorretto:17-alpine3.17
LABEL author="divyak"
LABEL organization="learning"
ARG DOWNLOAD_LOCATION='https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar'
ARG USERNAME='pet'
ARG HOMEDIR='/petclinic'
ENV TEST=hello
RUN adduser -h ${HOMEDIR} -s /bin/sh -D ${USERNAME}
USER ${USERNAME}
WORKDIR ${HOMEDIR}
COPY --from=builder --chown=${USERNAME}:${USERNAME}/spc/target/spring-petclinic-3.1.0-SNAPSHOT.jar "${HOMEDIR}/spring-petclinic-3.1.0-SNAPSHOT.jar"
EXPOSE 8080
CMD ["java", "-jar", "spring-petclinic-3.1.0-SNAPSHOT.jar"]
