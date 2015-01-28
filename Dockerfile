FROM ubuntu

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

RUN rm ~/.bashrc ~/.profile 

RUN gem install homesick && \
  homesick clone nkcraddock/dotfiles && \
  yes | homesick link dotfiles 

COPY home/.bash_local /root/
