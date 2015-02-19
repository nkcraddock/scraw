FROM nkcraddock/scraw

# Use baseimage-docker's init process
CMD ["/sbin/my_init"]

# Install Java.
RUN \
  echo oracle-jdk7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    apt-get install -y \
        oracle-jdk7-installer \
        oracle-java7-set-default \
        maven && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk7-installer

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
# RUN echo "export JAVA_HOME='/usr/lib/jvm/java-7-oracle'" >> /home/scraw/.bash_local
