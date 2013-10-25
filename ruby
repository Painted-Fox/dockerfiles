# Fresh install of ruby-lang

FROM ubuntu
MAINTAINER Ryan Seto <ryanseto@yak.net>

RUN apt-get update
RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

# Install ruby.
# Solution from: http://stackoverflow.com/a/16224372
RUN apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev
ADD http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz /tmp/
RUN tar -xzf /tmp/ruby-2.0.0-p247.tar.gz
RUN (cd ruby-2.0.0-p247/ && ./configure --disable-install-doc)
RUN (cd ruby-2.0.0-p247/ && make)
RUN (cd ruby-2.0.0-p247/ && make install)
RUN rm -rf ruby-2.0.0-p247/
RUN rm -f /tmp/ruby-2.0.0-p247.tar.gz
