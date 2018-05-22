FROM java:openjdk-8-jdk

MAINTAINER victor.romero@gmail.com

ARG mule_version=3.9.0

RUN cd ~ \
    && wget https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/$mule_version/mule-standalone-$mule_version.tar.gz \
    && wget https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/$mule_version/mule-standalone-$mule_version.tar.gz.md5 \
    && echo "`cat mule-standalone-"$mule_version".tar.gz.md5` mule-standalone-"$mule_version".tar.gz" | md5sum -c \
    && cd /opt \ 
    && tar xvzf ~/mule-standalone-$mule_version.tar.gz \
    && rm ~/mule-standalone-$mule_version.tar.gz \
    && ln -s /opt/mule-standalone-$mule_version /opt/mule

# Define environment variables.
ENV MULE_HOME /opt/mule

# Define mount points.
VOLUME ["/opt/mule/logs", "/opt/mule/conf", "/opt/mule/apps", "/opt/mule/domains"]

# Define working directory.
WORKDIR /opt/mule

CMD [ "/opt/mule/bin/mule" ]

# Default http port
EXPOSE 8081
