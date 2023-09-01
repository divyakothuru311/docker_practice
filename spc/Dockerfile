## dockerfile with user pet(root user should be avoided) 
FROM amazoncorretto:11-alpine3.17
LABEL author="divyak"
LABEL organization="learning"
RUN adduser -h /petclinic -s bin/sh -D pet
USER pet
WORKDIR /petclinic
ADD --chown=pet:pet https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar /petclinic/spring-petclinic-2.4.2.jar
EXPOSE 8080
CMD ["java", "-jar", "spring-petclinic-2.4.2.jar"]                                                                                                                                                                                   ~                                                                                                                                                                                               

## Dockerfile with passing args
FROM amazoncorretto:11-alpine3.17
LABEL author="divyak
LABEL organization="learning"
ARG DOWNLOAD_LOCATION='https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar'
ARG USERNAME='pet'
ARG HOMEDIR='/petclinic'
ENV TEST=hello
RUN adduser -h ${HOMEDIR} -s /bin/sh -D ${USERNAME}
USER ${USERNAME}
WORKDIR ${HOMEDIR}
ADD --chown=${USERNAME}:${USERNAME} ${DOWNLOAD_LOCATION} "${HOMEDIR}/spring-petclinic-2.4.2.jar"
EXPOSE 8080
CMD ["java", "-jar", "spring-petclinic-2.4.2.jar"]