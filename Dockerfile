FROM debian:stable


## install all that good stuff
RUN apt-get update \
  && apt-get install -y \
      apt-utils \
      build-essential \
      curl \
      git \
      jq \
      mercurial \
      silversearcher-ag \
      wget \
      vim \
      tmux \
      tmate \
      sudo \
      autotools-dev \
      autoconf \ 
      pkg-config \
      locales \
      xclip \
  && dpkg-reconfigure --frontend=noninteractive locales \
  && echo "Installing ctags" \
  && git clone -q --depth=1 https://github.com/universal-ctags/ctags.git /tmp/ctags \
  && cd /tmp/ctags \
  && ./autogen.sh \
  && ./configure \
  && make \
  && sudo make install \
  && cd - \
  && echo "Cleaning up" \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
  
# Set up scripts and root home
WORKDIR /root/dev

COPY home/bin/vim-plug /root/bin/vim-plug
COPY home/.vim-plugins /root/.vim-plugins

RUN $HOME/bin/vim-plug


COPY home/ /root/

#RUN apt-get update \
  #&& echo "Cleaning up" \
  #&& apt-get clean \
  #&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG C.UTF-8  
ENV LC_ALL C.UTF-8   

CMD ["/bin/bash"]

