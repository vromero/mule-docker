FROM java:openjdk-7-jdk

MAINTAINER victor.romero@gmail.com

RUN cd ~ && wget https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/3.6.1/mule-standalone-3.6.1.tar.gz && echo "3a018c579ae2cd172569c8f8cf3a44b8 mule-standalone-3.6.1.tar.gz" | md5sum -c

RUN cd /opt && tar xvzf ~/mule-standalone-3.6.1.tar.gz && rm ~/mule-standalone-3.6.1.tar.gz && ln -s /opt/mule-standalone-3.6.1 /opt/mule 

# Define environment variables.
ENV MULE_HOME /opt/mule

# Define mount points.
VOLUME ["/opt/mule/logs", "/opt/mule/conf", "/opt/mule/apps", "/opt/mule/domains"]

# Define working directory.
WORKDIR /opt/mule

CMD [ "/opt/mule/bin/mule" ]

# Default http port
EXPOSE 8081

