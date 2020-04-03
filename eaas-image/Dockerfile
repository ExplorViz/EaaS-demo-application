FROM explorviz/eaas-base:11-jre-alpine

# We need curl to make HTTP request to put load on the application, unzip to unpack the jar
RUN apk add --no-cache unzip curl

# Set a nice name to display in ExplorViz
RUN set-kieker-property kieker.monitoring.applicationName "Spring PetClinic"

COPY eaas-image /opt/app/
COPY target/spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar /opt/app/

# Spring Boot uses a jar-of-jars that we need to unpack, otherwise monitoring probes cannot be installed
RUN unzip spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar \
 && rm spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar

USER runner
CMD ["/opt/app/run.sh"]
