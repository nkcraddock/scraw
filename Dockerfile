FROM phusion/baseimage

ENV HOME /root

RUN apt-get update && apt-get install -y \
  git \
  vim \
  curl \
  ruby1.9.1 \
  wget \
  mercurial

RUN wget https://storage.googleapis.com/golang/go1.4.1.linux-amd64.tar.gz && \
  tar -C /usr/local -xzf go1.4.1.linux-amd64.tar.gz && \
  mkdir -p ~/dev/go/src/github.com

# clean out root's bash and profile
RUN rm ~/.bashrc ~/.profile 

# Add homesick
RUN gem install homesick 

# enable sshd
RUN rm -rf /etc/service/sshd/down

# enable the insecure key (dont expose sshd outside your localhost)
RUN /usr/sbin/enable_insecure_key

# Use baseimage-docker's init process
CMD ["/sbin/my_init"]

# Setup environment variables
ENV HOMESICK_CASTLE nkcraddock/dotfiles

# Add scripts
ADD .bash_local /root/.bash_local
ADD init_homesick /root/ 

# Clean up APT
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
