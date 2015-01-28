FROM ubuntu

ENV HOME /root

RUN apt-get update && apt-get install -y \
  git \
  vim \
  curl \
  ruby1.9.1 \
  mercurial





