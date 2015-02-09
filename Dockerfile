FROM java:7-jdk

# Install Cassandra
RUN echo "deb http://debian.datastax.com/community stable main" | tee -a /etc/apt/sources.list.d/cassandra.sources.list
RUN curl -L http://debian.datastax.com/debian/repo_key | apt-key add -
RUN apt-get update && apt-get install -y dsc21

RUN service cassandra stop

RUN rm -rf /var/lib/cassandra/data/system/*

# Deploy startup script
ADD init.sh /usr/local/bin/start-cassandra
RUN chmod 755 /usr/local/bin/start-cassandra

# Deploy shutdown script
ADD shutdown.sh /usr/local/bin/stop-cassandra
RUN chmod 755 /usr/local/bin/stop-cassandra

EXPOSE 7199 7000 7001 9160 9042
USER root
CMD start-cassandra