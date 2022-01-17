FROM alpine:latest

RUN apk add --no-cache \
  bzip2-dev \
  g++ \
  make \
  bash \
  bash-doc \
  bash-completion \
  file \
  unzip \
  perl

RUN cd /tmp/ && \
  wget -q https://launchpad.net/pbzip2/1.1/1.1.13/+download/pbzip2-1.1.13.tar.gz && \
  tar -xzf pbzip2-1.1.13.tar.gz && \
  cd pbzip2-1.1.13/ && \
  make install && \
  rm -r /tmp/pbzip2-1.1.13/
  
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  ./aws/install
  ln -s $(which awscliv2) /usr/bin/aws
  aws --version
  
