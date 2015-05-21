FROM java:openjdk-7-jdk

MAINTAINER victor.romero@gmail.com

RUN cd ~ && wget https://repository.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/3.5.0/mule-standalone-3.5.0.tar.gz && echo "4a94356f7401ac8be30a992a414ca9b9 mule-standalone-3.5.0.tar.gz" | md5sum -c

RUN cd /opt && tar xvzf ~/mule-standalone-3.5.0.tar.gz && rm ~/mule-standalone-3.5.0.tar.gz && ln -s /opt/mule-standalone-3.5.0 /opt/mule 

# Define environment variables.
ENV MULE_HOME /opt/mule

# Define mount points.
VOLUME ["/opt/mule/logs", "/opt/mule/conf", "/opt/mule/apps", "/opt/mule/domains"]

# Define working directory.
WORKDIR /opt/mule

CMD [ "/opt/mule/bin/mule" ]

# Default http port
EXPOSE 8081

