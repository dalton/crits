FROM ubuntu:latest

MAINTAINER crits

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq update && apt-get install -y --no-install-recommends apt-utils

# git command
RUN apt-get install -y git
# pip command
# RUN apt-get install -y python-pip
# lsb_release command
RUN apt-get install -y lsb-release
# sudo command
RUN apt-get install -y sudo
# add-apt-repository command
RUN apt-get install -y software-properties-common
RUN sudo -E add-apt-repository universe
RUN sudo -E apt-get update -qq
RUN sudo -E apt-get install -y python-dev  python-libvirt libffi-dev libssl-dev
RUN sudo -E apt-get install -y libxml2-dev libxslt1-dev libjpeg-dev swig
RUN sudo -E apt-get install -y --fix-missing build-essential curl git libevent-dev libz-dev libjpeg-dev libfuzzy-dev libldap2-dev libpcap-dev libpcre3-dev libsasl2-dev libxml2-dev libxslt1-dev libyaml-dev  numactl p7zip-full python-dev python-pip  python-m2crypto ssdeep swig upx zip libssl-dev


# Clone the repo
ARG REPO_DEPTH=unknown
RUN git clone --depth ${REPO_DEPTH} https://github.com/dalton/crits.git

WORKDIR crits
# Install the dependencies
RUN TERM=xterm sh ./script/bootstrap < docker_inputs
